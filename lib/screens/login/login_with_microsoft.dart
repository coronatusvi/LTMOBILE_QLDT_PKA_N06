import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qldt_pka/models/auth_model.dart';
import 'package:qldt_pka/providers/auth_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
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
  late AuthModel _authModel;
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
      // setState(() {
      //   _authModel = authData;
      // });
      Provider.of<AuthProvider>(context, listen: false).setAuth(authData);
      AuthModel? authProvider =
          Provider.of<AuthProvider>(context, listen: false).getAuth();
      try {
        ShowCustomDialog(
            'Done',
            "Hi,\n ${authProvider?.userId}, ${_authModel?.accessToken}",
            context);
      } catch (e) {
        ShowCustomDialog('Error', 'Error loading web page: $e', context);
      }
    }
  }

  AuthModel getDataHtml(String html) {
    // Xử lý thông tin / KHÔNG ĐỘNG ĐẾN
    final regexUserId = RegExp(r"var userId          = '([^']+)';");
    final regexTokenJWT = RegExp(r"var tokenJWT = '([^']+)';");
    final userId = regexUserId.firstMatch(html)?.group(1);
    final tokenJWT = regexTokenJWT.firstMatch(html)?.group(1);
    return AuthModel(userId: userId, accessToken: tokenJWT);
  }
}
