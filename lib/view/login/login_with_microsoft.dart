import 'package:flutter/material.dart';
import 'package:qldt_pka/view/calender/calenerView.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

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
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          // Now that the web page has finished loading, close the screen
          // CalenderView.route();
          _showCustomDialog('Done', '${response.request}');
        } else {
          // Display an error dialog when there is an HTTP error
          _showCustomDialog('Error', 'HTTP Error: ${response.statusCode}');
        }
      } catch (e) {
        // Display an error dialog for other errors
        _showCustomDialog('Error', 'Error loading web page: $e');
      }
    }
  }

  void _showCustomDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                10.0), // Điều chỉnh giá trị để thay đổi độ cong
          ),
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
  //
}
