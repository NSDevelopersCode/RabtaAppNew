import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class GenericWebViewPage extends StatefulWidget {
  final String url;
  final title;
  const GenericWebViewPage({Key? key, required this.url, required this.title})
      : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
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
            // Handle download requests
            if (request.url.endsWith('.pdf') ||
                request.url.contains('download') ||
                request.url.contains('eLicense')) {
              _handleDownload(request
                  .url); // This is where the download handler is triggered
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

  // Updated _handleDownload method
  Future<void> _handleDownload(String url) async {
    try {
      setState(() => isLoading = true);

      // 1. First try to directly view PDF in WebView (works for some browsers)
      if (url.endsWith('.pdf')) {
        try {
          await webViewController.loadRequest(Uri.parse(url));
          return;
        } catch (e) {
          print('Direct PDF load failed: $e');
          // Continue to download approach if the load fails
        }
      }

      // 2. Download the file (your original approach)
      final response = await http.get(Uri.parse(url));
      final directory = await getDownloadsDirectory();
      if (directory == null) throw Exception("No downloads directory");

      // Extract the file extension from the URL or the response headers
      final contentType = response.headers['content-type'] ?? '';
      String extension = _getFileExtensionFromUrl(url);

      // If the extension is still missing, use the content type to guess the extension
      if (extension.isEmpty) {
        if (contentType.contains('pdf')) {
          extension = '.pdf';
        } else if (contentType.contains('jpeg') ||
            contentType.contains('jpg')) {
          extension = '.jpg';
        } else if (contentType.contains('png')) {
          extension = '.png';
        }
      }

      final file = File(
          '${directory.path}/file_${DateTime.now().millisecondsSinceEpoch}$extension');
      await file.writeAsBytes(response.bodyBytes);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Downloaded to ${file.path}')),
      );

      // 3. Try to open with system apps
      if (url.endsWith('.pdf') || extension == '.pdf') {
        final openResult = await OpenFile.open(file.path);

        // If no app available, try alternative viewers
        if (openResult.type == ResultType.noAppToOpen) {
          await _showPdfViewerOptions(url, file);
        }
      } else {
        OpenFile.open(file.path); // Open non-PDF files normally
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  String _getFileExtensionFromUrl(String url) {
    if (url.contains('.pdf')) return '.pdf';
    if (url.contains('.jpg') || url.contains('.jpeg')) return '.jpg';
    if (url.contains('.png')) return '.png';
    return ''; // Default case if no extension is found
  }

  // Function to show PDF viewer options (in case no apps available)
  Future<void> _showPdfViewerOptions(String url, File file) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('No PDF Viewer Found'),
          content: Text(
              'You can download a PDF viewer or open it using your browser.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
            TextButton(
              onPressed: () {
                _openInBrowser(url);
                Navigator.of(context).pop();
              },
              child: Text('Open in Browser'),
            ),
          ],
        );
      },
    );
  }

  // Open PDF in browser (alternative option)
  void _openInBrowser(String url) {
    launch(url); // This requires the `url_launcher` package to open URLs
  }

  // Placeholder for showing an image source dialog (e.g., file upload)
  void _showImageSourceDialog() {
    // Implement image upload functionality here
  }

  // Placeholder methods for injecting upload and download handlers (can be customized as needed)
  Future<void> _injectFileUploadHandler() async {
    // Implement file upload handler injection if needed
  }

  Future<void> _injectDownloadHandler() async {
    // Implement download handler injection if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.title}')),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : WebViewWidget(controller: webViewController),
      ),
    );
  }
}
