import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage4 extends StatefulWidget {
  final String url;
  WebViewPage4({Key? key, required this.url}) : super(key: key);

  @override
  _WebViewPage4State createState() => _WebViewPage4State();
}

class _WebViewPage4State extends State<WebViewPage4> {
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
      body: Stack(children: [
        WebView(
          key: _key,
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          allowsInlineMediaPlayback: true,
          onWebViewCreated: (controller) {
            _controller.complete(controller);
            _myController = controller;
          },
          onPageFinished: (finish) {
            setState(() {
              isLoading = false;
            });
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
