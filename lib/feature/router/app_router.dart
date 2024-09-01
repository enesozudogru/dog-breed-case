import 'package:case_study/feature/views/auth/splash_view.dart';
import 'package:case_study/feature/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/settings/settings_view.dart';


class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'splash',
        path: '/',
        builder: (context, state) => const SplashView(),
      ),

      GoRoute(
        path: '/home',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: const HomeView(),
            transitionDuration: const Duration(milliseconds: 700),
            transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
              // Sayfa açılırken yukarı doğru kaydırma
              const begin = Offset(0.0, 1.0); // Başlangıçta sayfa ekranın altında
              const end = Offset.zero; // Son durumda sayfa tam ekranda
              const curve = Curves.easeInOut;
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/settings',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return CustomTransitionPage<void>(
            key: state.pageKey,
            child: const SettingsView(),
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                // opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                position: offsetAnimation,                
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}