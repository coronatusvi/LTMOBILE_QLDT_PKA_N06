import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

import '../../widgets/dialogCustom.dart';

class LoginWithMicrosoft_View extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginWithMicrosoft_View(),
      );

  const LoginWithMicrosoft_View({super.key});

  @override
  State<LoginWithMicrosoft_View> createState() =>
      _LoginWithMicrosoft_ViewState();
}

class _LoginWithMicrosoft_ViewState extends State<LoginWithMicrosoft_View> {
  late final WebViewController controller;
  final urlStarted =
      "https://qldtbeta.phenikaa-uni.edu.vn/congsinhvien/login.aspx#";
  final urlFinished =
      "https://qldtbeta.phenikaa-uni.edu.vn/congsinhvien/index.aspx#dashboard";

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (urlStarted) {},
          onPageFinished: _handlePageFinished,
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(urlFinished)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(urlFinished));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Education'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }

  void _handlePageFinished(String url) async {
    if (url == urlFinished) {
      try {
        final request = http.Request('GET', Uri.parse(url));
        final response = await http.Client().send(request);

        if (response.statusCode == 200) {
          // Now that the web page has finished loading, close the screen
          // CalenderView.route();
          ShowCustomDialog('Done', '${request.headers}', context);
        } else {
          // Display an error dialog when there is an HTTP error
          ShowCustomDialog(
              'Error', 'HTTP Error: ${response.statusCode}', context);
        }
      } catch (e) {
        // Display an error dialog for other errors
        ShowCustomDialog('Error', 'Error loading web page: $e', context);
      }
    }
  }
  //
}
