import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qldt_pka/screens/calendar/home_view.dart';
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

    controller.clearCache();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthDataProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Education"),
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
      String response = await controller
          .runJavaScript('document.documentElement.innerHTML') as String;
      var authData = getDataHtml(response);

      Provider.of<AuthDataProvider>(context, listen: false).setAuth(authData);
      var authDataModel =
          Provider.of<AuthDataProvider>(context, listen: false).getAuth();

      try {
        if (authDataModel?.accessToken != "") {
          if (authDataModel?.accessToken?[0] != "e") {
          } else {
            if (authData.accessToken != "") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeView()),
              );
            } else {
              ShowCustomDialog("Error", "Đã xảy ra lỗi đăng nhập", context);
            }
          }
        }
      } catch (e) {
        ShowCustomDialog('Error', 'Error loading web page: $e', context);
      }
    }
  }
}
