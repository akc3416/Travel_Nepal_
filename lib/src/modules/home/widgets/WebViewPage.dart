import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;
  WebViewPage({Key? key, required this.url, required this.title})
      : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _myController;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true;
  final _key = UniqueKey();
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(children: [
        WebView(
          key: _key,
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            _controller.complete(controller);
            _myController = controller;
          },
          onPageFinished: (finish) {
            setState(() {
              isLoading = false;
            });

            // _myController.evaluateJavascript(
            // "document.getElementsByClassName('menu-top menu-ani menu-top__up')[0].style.display='none';");
            // .evaluateJavascript("document.getElementsByClassName('sticky-wrapper')[0].style.display='none';");
          },
        ),
        isLoading
            ? Center(
                child: SpinKitChasingDots(
                  color: Colors.blue[500],
                  size: 80,
                ),
              )
            : Stack(),
      ]),
    );
  }
}
