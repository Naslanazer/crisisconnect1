import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

String disasterLocation = 'Kozhikode';

class WebViewScreen extends StatelessWidget {
  WebViewScreen({super.key});

  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$disasterLocation'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: double.infinity,
        child: WebViewWidget(controller: controller)),
    );
  }
}
