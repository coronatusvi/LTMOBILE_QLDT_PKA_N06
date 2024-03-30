import 'package:flutter/material.dart';
import 'common/loading_page.dart';
import 'features/auth/view/login_view.dart';
import 'theme/app_theme.dart';
import 'theme/pallete.dart';
import 'theme/theme_controller.dart';
import 'theme/theme_provider.dart';

class MyMxh {
  final ThemeManager _themeManager = ThemeManager();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      manager: _themeManager,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Phenikaa Campus',
        theme: AppTheme.theme,
        home: LoginView(),
      ),
    );
  }
}
