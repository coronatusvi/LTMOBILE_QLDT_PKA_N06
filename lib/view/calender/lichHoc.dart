import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

class Education_View extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const Education_View(),
      );

  const Education_View({super.key});

  @override
  State<Education_View> createState() => _Education_ViewState();
}

class _Education_ViewState extends State<Education_View> {
  late final WebViewController controller;
  final url =
      "https://qldtbeta.phenikaa-uni.edu.vn/congsinhvien/index.aspx#lichhoc";

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
          onPageStarted: (String url) {},
          onPageFinished: _handlePageFinished,
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://google.com')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
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
    if (url ==
        "https://qldtbeta.phenikaa-uni.edu.vn/congsinhvien/index.aspx#lichhoc") {
      // Create the file in the temporary directory
      final filePath = 'lib/db/aspx.txt';
      final file = File(filePath);

      try {
        final response = await http.get(Uri.parse(url));
        await file.writeAsString(response.body);
      } catch (e) {
        print("Lỗi khi tải aspx: $e");
        // Xử lý lỗi tại đây
      }

      // Trở về trang homeview
      Navigator.pop(context);
    }
  }
}
