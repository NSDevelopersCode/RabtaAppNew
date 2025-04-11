import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum PDFViewerOption { googleDocs, downloadOnly }

class GenericWebViewPage extends StatefulWidget {
  final String url;
  final String title;

  const GenericWebViewPage({super.key, required this.url, required this.title});

  @override
  State<GenericWebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<GenericWebViewPage> {
  late final WebViewController webViewController;
  bool isLoading = true;
  bool isUploading = false;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    initializeWebViewController();
  }

  void initializeWebViewController() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) => setState(() => isLoading = true),
          onPageFinished: (String url) async {
            setState(() => isLoading = false);
            await _injectFileUploadHandler();
            await _injectDownloadHandler();
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.endsWith('.pdf') ||
                request.url.contains('download') ||
                request.url.contains('eLicense')) {
              _handleDownload(request.url);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'FileUploadChannel',
        onMessageReceived: (JavaScriptMessage message) {
          if (message.message == 'uploadFile') {
            _showImageSourceDialog();
          }
        },
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  Future<void> _injectDownloadHandler() async {
    await webViewController.runJavaScript("""
      document.querySelectorAll('a[href*="download"], button[id*="download"]').forEach(element => {
        element.addEventListener('click', function(e) {
          if (element.textContent.includes('eLicense') ||
              element.href.includes('eLicense') ||
              element.id.includes('eLicense')) {
            e.preventDefault();
            FileUploadChannel.postMessage('uploadFile');
          }
        });
      });
    """);
  }

  Future<void> _handleDownload(String url) async {
    try {
      setState(() => isLoading = true);

      final response = await http.get(Uri.parse(url));
      final directory = await getDownloadsDirectory();
      if (directory == null) throw Exception("No downloads directory");

      final file = File(
          '${directory.path}/eLicense_${DateTime.now().millisecondsSinceEpoch}${_getFileExtension(url)}');
      await file.writeAsBytes(response.bodyBytes);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Downloaded to ${file.path}')),
      );

      if (url.endsWith('.pdf')) {
        final openResult = await OpenFile.open(file.path);

        if (openResult.type == ResultType.noAppToOpen) {
          await _showPdfViewerOptions(url, file);
        }
      } else {
        OpenFile.open(file.path);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _showPdfViewerOptions(String url, File file) async {
    final choice = await showDialog<PDFViewerOption>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('View PDF'),
        content: Text('No PDF viewer found. Choose an option:'),
        actions: [
          TextButton(
            child: Text('Google Docs'),
            onPressed: () => Navigator.pop(context, PDFViewerOption.googleDocs),
          ),
          TextButton(
            child: Text('Download Only'),
            onPressed: () =>
                Navigator.pop(context, PDFViewerOption.downloadOnly),
          ),
        ],
      ),
    );

    switch (choice) {
      case PDFViewerOption.googleDocs:
        final encodedUrl = Uri.encodeFull(url);
        webViewController.loadRequest(
          Uri.parse(
              'https://docs.google.com/gview?embedded=true&url=$encodedUrl'),
        );
        break;
      case PDFViewerOption.downloadOnly:
      default:
        break;
    }
  }

  String _getFileExtension(String url) {
    if (url.contains('.pdf')) return '.pdf';
    if (url.contains('.jpg') || url.contains('.jpeg')) return '.jpg';
    if (url.contains('.png')) return '.png';
    return '';
  }

  Future<void> _injectFileUploadHandler() async {
    await webViewController.runJavaScript("""
      document.querySelectorAll('input[type=file]').forEach(input => {
        input.addEventListener('click', function(e) {
          e.preventDefault();
          FileUploadChannel.postMessage('uploadFile');
        });
      });
    """);
  }

  Future<void> _showImageSourceDialog() async {
    if (isUploading) return;

    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.photo_library),
            title: Text('Gallery'),
            onTap: () {
              Navigator.pop(context);
              _handleGalleryUpload();
            },
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Google Photos'),
            onTap: () {
              Navigator.pop(context);
              _handleGooglePhotosUpload();
            },
          ),
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Camera'),
            onTap: () {
              Navigator.pop(context);
              _handleCameraUpload();
            },
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Future<void> _handleGalleryUpload() async {
    setState(() => isUploading = true);
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final file = File(pickedFile.path);
        await _uploadAndPreviewImage(file);
      }
    } catch (e) {
      _showError("Failed to pick from gallery", e);
    } finally {
      setState(() => isUploading = false);
    }
  }

  Future<void> _handleGooglePhotosUpload() async {
    setState(() => isUploading = true);
    try {
      final result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null && result.files.isNotEmpty) {
        final filePath = result.files.single.path;
        if (filePath != null) {
          final file = File(filePath);
          await _uploadAndPreviewImage(file);
        }
      }
    } catch (e) {
      _showError("Failed to pick from Google Photos", e);
    } finally {
      setState(() => isUploading = false);
    }
  }

  Future<void> _handleCameraUpload() async {
    setState(() => isUploading = true);
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        final file = File(pickedFile.path);
        await _uploadAndPreviewImage(file);
      }
    } catch (e) {
      _showError("Failed to capture image", e);
    } finally {
      setState(() => isUploading = false);
    }
  }

  Future<void> _uploadAndPreviewImage(File imageFile) async {
    try {
      final bytes = await imageFile.readAsBytes();
      final base64 = base64Encode(bytes);
      final extension = imageFile.path.split('.').last.toLowerCase();
      final mimeType = _getMimeType(extension);

      await webViewController.runJavaScript("""
      (function() {
        const base64 = "$base64";
        const binary = atob(base64);
        const array = new Uint8Array(binary.length);
        for (let i = 0; i < binary.length; i++) {
          array[i] = binary.charCodeAt(i);
        }

        const file = new File([array], 'upload.$extension', { type: '$mimeType' });
        const dataTransfer = new DataTransfer();
        dataTransfer.items.add(file);

        const input = document.querySelector('input[type=file]');
        if (input) {
          input.files = dataTransfer.files;
          const event = new Event('change', { bubbles: true });
          input.dispatchEvent(event);

          // Clear the value so user can pick another file next time
          setTimeout(() => {
            input.value = '';
          }, 1000);
        }
      })();
    """);
    } catch (e) {
      debugPrint("Image upload error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to upload image: ${e.toString()}")),
      );
    }
  }

  void _showError(String prefix, Object e) {
    debugPrint("$prefix: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("$prefix: ${e.toString()}")),
    );
  }

  String _getMimeType(String extension) {
    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'webp':
        return 'image/webp';
      default:
        return 'application/octet-stream';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: webViewController),
          if (isLoading) Center(child: CircularProgressIndicator()),
          if (isUploading)
            Container(
              color: Colors.black54,
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}

// import 'dart:convert';
// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// enum PDFViewerOption { googleDocs, downloadOnly }

// class GenericWebViewPage extends StatefulWidget {
//   final String url;
//   final String title;

//   const GenericWebViewPage({super.key, required this.url, required this.title});

//   @override
//   State<GenericWebViewPage> createState() => _WebViewPageState();
// }

// class _WebViewPageState extends State<GenericWebViewPage> {
//   late final WebViewController webViewController;
//   bool isLoading = true;
//   bool isUploading = false;
//   final ImagePicker _picker = ImagePicker();

//   @override
//   void initState() {
//     super.initState();
//     initializeWebViewController();
//   }

//   void initializeWebViewController() {
//     webViewController = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onPageStarted: (String url) => setState(() => isLoading = true),
//           onPageFinished: (String url) async {
//             setState(() => isLoading = false);
//             await _injectFileUploadHandler();
//             await _injectDownloadHandler();
//           },
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.endsWith('.pdf') ||
//                 request.url.contains('download') ||
//                 request.url.contains('eLicense')) {
//               _handleDownload(request.url);
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..addJavaScriptChannel(
//         'FileUploadChannel',
//         onMessageReceived: (JavaScriptMessage message) {
//           if (message.message == 'uploadFile') {
//             _showImageSourceDialog();
//           }
//         },
//       )
//       ..loadRequest(Uri.parse(widget.url));
//   }

//   Future<void> _injectDownloadHandler() async {
//     await webViewController.runJavaScript("""
//       document.querySelectorAll('a[href*="download"], button[id*="download"]').forEach(element => {
//         element.addEventListener('click', function(e) {
//           if (element.textContent.includes('eLicense') ||
//               element.href.includes('eLicense') ||
//               element.id.includes('eLicense')) {
//             e.preventDefault();
//             FileUploadChannel.postMessage('uploadFile');
//           }
//         });
//       });
//     """);
//   }

//   Future<void> _handleDownload(String url) async {
//     try {
//       setState(() => isLoading = true);

//       final response = await http.get(Uri.parse(url));
//       final directory = await getDownloadsDirectory();
//       if (directory == null) throw Exception("No downloads directory");

//       final file = File(
//           '${directory.path}/eLicense_${DateTime.now().millisecondsSinceEpoch}${_getFileExtension(url)}');
//       await file.writeAsBytes(response.bodyBytes);

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Downloaded to ${file.path}')),
//       );

//       if (url.endsWith('.pdf')) {
//         final openResult = await OpenFile.open(file.path);

//         if (openResult.type == ResultType.noAppToOpen) {
//           await _showPdfViewerOptions(url, file);
//         }
//       } else {
//         OpenFile.open(file.path);
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: ${e.toString()}')),
//       );
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }

//   Future<void> _showPdfViewerOptions(String url, File file) async {
//     final choice = await showDialog<PDFViewerOption>(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('View PDF'),
//         content: Text('No PDF viewer found. Choose an option:'),
//         actions: [
//           TextButton(
//             child: Text('Google Docs'),
//             onPressed: () => Navigator.pop(context, PDFViewerOption.googleDocs),
//           ),
//           TextButton(
//             child: Text('Download Only'),
//             onPressed: () =>
//                 Navigator.pop(context, PDFViewerOption.downloadOnly),
//           ),
//         ],
//       ),
//     );

//     switch (choice) {
//       case PDFViewerOption.googleDocs:
//         final encodedUrl = Uri.encodeFull(url);
//         webViewController.loadRequest(
//           Uri.parse(
//               'https://docs.google.com/gview?embedded=true&url=$encodedUrl'),
//         );
//         break;
//       case PDFViewerOption.downloadOnly:
//       default:
//         break;
//     }
//   }

//   String _getFileExtension(String url) {
//     if (url.contains('.pdf')) return '.pdf';
//     if (url.contains('.jpg') || url.contains('.jpeg')) return '.jpg';
//     if (url.contains('.png')) return '.png';
//     return '';
//   }

//   Future<void> _injectFileUploadHandler() async {
//     await webViewController.runJavaScript("""
//       document.querySelectorAll('input[type=file]').forEach(input => {
//         input.addEventListener('click', function(e) {
//           e.preventDefault();
//           FileUploadChannel.postMessage('uploadFile');
//         });
//       });
//     """);
//   }

//   Future<void> _showImageSourceDialog() async {
//     if (isUploading) return;

//     showModalBottomSheet(
//       context: context,
//       builder: (context) => Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           ListTile(
//             leading: Icon(Icons.photo_library),
//             title: Text('Gallery'),
//             onTap: () {
//               Navigator.pop(context);
//               _handleGalleryUpload();
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.photo),
//             title: Text('Google Photos'),
//             onTap: () {
//               Navigator.pop(context);
//               _handleGooglePhotosUpload();
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.camera_alt),
//             title: Text('Camera'),
//             onTap: () {
//               Navigator.pop(context);
//               _handleCameraUpload();
//             },
//           ),
//           SizedBox(height: 50),
//         ],
//       ),
//     );
//   }

//   Future<void> _handleGalleryUpload() async {
//     setState(() => isUploading = true);
//     try {
//       final XFile? pickedFile =
//           await _picker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         final croppedFile = await _cropImage(File(pickedFile.path));
//         if (croppedFile != null) {
//           await _uploadAndPreviewImage(croppedFile);
//         }
//       }
//     } catch (e) {
//       _showError("Failed to pick from gallery", e);
//     } finally {
//       setState(() => isUploading = false);
//     }
//   }

//   Future<void> _handleGooglePhotosUpload() async {
//     setState(() => isUploading = true);
//     try {
//       final result = await FilePicker.platform.pickFiles(type: FileType.image);
//       if (result != null && result.files.isNotEmpty) {
//         final filePath = result.files.single.path;
//         if (filePath != null) {
//           final croppedFile = await _cropImage(File(filePath));
//           if (croppedFile != null) {
//             await _uploadAndPreviewImage(croppedFile);
//           }
//         }
//       }
//     } catch (e) {
//       _showError("Failed to pick from Google Photos", e);
//     } finally {
//       setState(() => isUploading = false);
//     }
//   }

//   Future<void> _handleCameraUpload() async {
//     setState(() => isUploading = true);
//     try {
//       final XFile? pickedFile =
//           await _picker.pickImage(source: ImageSource.camera);
//       if (pickedFile != null) {
//         final croppedFile = await _cropImage(File(pickedFile.path));
//         if (croppedFile != null) {
//           await _uploadAndPreviewImage(croppedFile);
//         }
//       }
//     } catch (e) {
//       _showError("Failed to capture image", e);
//     } finally {
//       setState(() => isUploading = false);
//     }
//   }

//   Future<void> _uploadAndPreviewImage(File imageFile) async {
//     try {
//       final bytes = await imageFile.readAsBytes();
//       final base64 = base64Encode(bytes);
//       final extension = imageFile.path.split('.').last.toLowerCase();
//       final mimeType = _getMimeType(extension);

//       await webViewController.runJavaScript("""
//         const input = document.querySelector('input[type=file]');

//         let previewContainer = document.getElementById('flutter-preview-container');
//         if (!previewContainer) {
//           previewContainer = document.createElement('div');
//           previewContainer.id = 'flutter-preview-container';
//           previewContainer.style.margin = '20px 0';
//           previewContainer.style.textAlign = 'center';
//           input.parentNode.insertBefore(previewContainer, input.nextSibling);
//         }

//         previewContainer.innerHTML = '';

//         const previewImg = document.createElement('img');
//         previewImg.style.maxWidth = '100%';
//         previewImg.style.maxHeight = '200px';
//         previewImg.style.border = '1px solid #ddd';
//         previewImg.style.borderRadius = '4px';
//         previewImg.style.padding = '5px';
//         previewImg.src = 'data:${mimeType};base64,${base64}';
//         previewContainer.appendChild(previewImg);

//         const binary = atob('${base64}');
//         const array = new Uint8Array(binary.length);
//         for (let i = 0; i < binary.length; i++) {
//           array[i] = binary.charCodeAt(i);
//         }

//         const file = new File([array], 'upload.${extension}', { type: '${mimeType}' });
//         const dataTransfer = new DataTransfer();
//         dataTransfer.items.add(file);
//         input.files = dataTransfer.files;

//         const event = new Event('change', { bubbles: true });
//         input.dispatchEvent(event);
//       """);
//     } catch (e) {
//       debugPrint("Image upload error: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Failed to upload image: ${e.toString()}")),
//       );
//     }
//   }

//   Future<File?> _cropImage(File imageFile) async {
//     try {
//       final croppedFile = await ImageCropper().cropImage(
//         sourcePath: imageFile.path,
//         aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'Crop Image',
//             toolbarColor: Colors.green,
//             toolbarWidgetColor: Colors.white,
//             initAspectRatio: CropAspectRatioPreset.original,
//             lockAspectRatio: false,
//             hideBottomControls: true,
//           ),
//           IOSUiSettings(
//             title: 'Crop Image',
//             aspectRatioLockEnabled: false,
//           ),
//         ],
//       );
//       return croppedFile != null ? File(croppedFile.path) : null;
//     } catch (e) {
//       debugPrint("Image cropping error: $e");
//       return null;
//     }
//   }

//   void _showError(String prefix, Object e) {
//     debugPrint("$prefix: $e");
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("$prefix: ${e.toString()}")),
//     );
//   }

//   String _getMimeType(String extension) {
//     switch (extension) {
//       case 'jpg':
//       case 'jpeg':
//         return 'image/jpeg';
//       case 'png':
//         return 'image/png';
//       case 'gif':
//         return 'image/gif';
//       case 'webp':
//         return 'image/webp';
//       default:
//         return 'application/octet-stream';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Stack(
//         children: [
//           WebViewWidget(controller: webViewController),
//           if (isLoading) Center(child: CircularProgressIndicator()),
//           if (isUploading)
//             Container(
//               color: Colors.black54,
//               child: Center(child: CircularProgressIndicator()),
//             ),
//         ],
//       ),
//     );
//   }
// }
