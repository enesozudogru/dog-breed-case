import 'package:case_study/core/init/theme/light_theme.dart';
import 'package:flutter/material.dart';

import 'core/init/locator.dart';
import 'feature/router/app_router.dart';

void main() {
  setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: LightTheme.theme,
      title: "Case Study",
      debugShowCheckedModeBanner: false,
    );
  }
}
