import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:raabta/utils/media_query.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KPKTraffic extends StatefulWidget {
  const KPKTraffic({super.key});

  @override
  State<KPKTraffic> createState() => _KPKTrafficState();
}

class _KPKTrafficState extends State<KPKTraffic> {
  late WebViewController webViewController;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          title: const Text('K P K'),
        ),
        body: WillPopScope(
          onWillPop: () async {
            if (await webViewController.canGoBack()) {
              webViewController.goBack();
              return false;
            }
            return true;
          },
          child: OrientationBuilder(
            builder: (context, orientation) {
              double containerWidth;
              double containerHeight;

              // Determine the dimensions based on orientation
              if (orientation == Orientation.portrait) {
                containerWidth = screenwidth(context);
                containerHeight = screenheight(context);
              } else {
                containerWidth = screenwidth(context) * 2;
                containerHeight = screenheight(context);
              }
              return SizedBox(
                width: containerWidth,
                height: containerHeight,
                child: Stack(
                  children: [
                    // WebView(
                    //   onWebResourceError: (error) {},
                    //   onPageStarted: (url) {
                    //     setState(() {
                    //       isLoading = true;
                    //     });
                    //     log('on page started');
                    //     // await webViewController.runJavascriptReturningResult(
                    //     //     'document.getElementById("printSlip").innerHTML=""');
                    //   },
                    //   onPageFinished: (url) {
                    //     log('message');
                    //     setState(() {
                    //       isLoading = false;
                    //     });
                    //   },
                    //   javascriptMode: JavascriptMode.unrestricted,
                    //   initialUrl: 'https://ptpkp.gov.pk/',
                    //   onWebViewCreated: (controller) {
                    //     webViewController = controller;
                    //   },
                    // ),
                    if (isLoading)
                      const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

