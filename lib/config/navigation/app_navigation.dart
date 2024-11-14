import 'package:flutter/material.dart';
import "package:go_router/go_router.dart";
import 'package:portfolio/config/navigation/pages.dart';
import 'package:portfolio/config/navigation/routes_enum.dart';

class AppNavigation {
  AppNavigation._();

  static final GlobalKey<NavigatorState> _parrentNavigatorKey =
      GlobalKey<NavigatorState>();
  static String activeRoute = Routes.home.path;
  static final GoRouter config = GoRouter(
    navigatorKey: _parrentNavigatorKey,
    initialLocation: Routes.home.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.home.path,
        name: Routes.home.name,
        builder: (context, state) => const Home(),
      ),
    ],
    errorBuilder: (context, state) {
      return Scaffold(
        body: Center(
          child: Text(
            state.error!.message,
          ),
        ),
      );
    },
  );

  static SlideTransition pageTransition(
      BuildContext context, Animation<double> animation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Directionality.of(context) == TextDirection.ltr
            ? const Offset(1.0, 0)
            : const Offset(-1.0, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
