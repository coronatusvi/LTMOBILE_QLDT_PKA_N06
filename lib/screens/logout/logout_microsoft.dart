import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qldt_pka/screens/login/login_with_microsoft.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../providers/auth_provider.dart';
import '../../utils/env.dart';
import '../../widgets/dialogCustom.dart';
import '../onboarding/onboarding_view.dart';

class LogOutWithMicrosoft_View extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LogOutWithMicrosoft_View(),
      );

  const LogOutWithMicrosoft_View({super.key});

  @override
  State<LogOutWithMicrosoft_View> createState() =>
      _LogOutWithMicrosoft_ViewState();
}

class _LogOutWithMicrosoft_ViewState extends State<LogOutWithMicrosoft_View> {
  late final WebViewController controller;

  String urlStarted = Config.API_URL + Config.LOGOUT_EDUCAION;
  String urlFinished = Config.LOGOUT_ACCESS;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (urlStarted) {},
          onPageFinished: _handlePageFinished,
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(urlStarted)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(urlStarted));

    controller.clearCache();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthDataProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text("Logout Education"),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.blue, Colors.red],
                ),
              ),
            ),
          ),
          body: WebViewWidget(
            controller: controller,
          ),
        );
      },
    );
  }

  void _handlePageFinished(String url) async {
    if (url == urlFinished) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => LoginWithMicrosoft_View()));
    }
  }
}
