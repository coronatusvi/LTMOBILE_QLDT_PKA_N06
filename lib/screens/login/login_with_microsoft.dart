import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../models/auth_model.dart';
import '../../providers/auth_provider.dart';
import '../../utils/env.dart';
import '../../widgets/dialogCustom.dart';
import '../calendar/calendar_view.dart';

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

  String urlStarted = Config.API_URL + Config.LOGIN_EDUCAION;
  String urlFinished = Config.API_URL + Config.HOME_EDUCAION;
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
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Education"),
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
      String response = await controller
          .runJavaScript('document.documentElement.innerHTML') as String;
      var authData = getDataHtml(response);

      Provider.of<AuthProvider>(context, listen: false).setAuth(authData);
      try {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CalenderView()));
        ShowCustomDialog(
            'Done',
            "Bạn đã đăng nhập thành công! \nNhấn 'OK' để đến màn hình chính.",
            context);
      } catch (e) {
        ShowCustomDialog('Error', 'Error loading web page: $e', context);
      }
    }
  }
}
