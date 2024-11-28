import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:go_router/go_router.dart";
import 'package:portfolio/config/navigation/pages.dart';
import 'package:portfolio/config/navigation/routes_enum.dart';
import 'package:portfolio/viewmodel/contact_viewmodel/contact_viewmodel.dart';
import 'package:portfolio/viewmodel/main_viewmodel/main_viewmodel.dart';
import 'package:portfolio/viewmodel/skills_viewmodel/skills_viewmodel.dart';
import 'package:portfolio/viewmodel/work_details_viewmodel/work_details_viewmodel.dart';
import 'package:portfolio/viewmodel/works_viewmodel/work_viewmodel.dart';

class AppNavigation {
  AppNavigation._();

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  static String activeRoute = Routes.home.path;
  static final GoRouter config = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.home.path,
    debugLogDiagnostics: true,
    routerNeglect: true,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => MainViewmodel(),
              ),
              BlocProvider(
                create: (context) => WorkViewModel(),
              ),
            ],
            child: MainScreen(body: child),
          );
        },
        routes: [
          GoRoute(
            path: Routes.home.path,
            name: Routes.home.name,
            builder: (context, state) => BlocProvider(
              create: (context) => SkillsViewModel(),
              child: const Home(),
            ),
          ),
          GoRoute(
            path: Routes.works.path,
            name: Routes.works.name,
            builder: (context, state) => const Works(),
            routes: [
              GoRoute(
                path: Routes.workDetails.path,
                name: Routes.workDetails.name,
                builder: (context, state) {
                  context.read<MainViewmodel>().setSelectedTab(1);
                  return BlocProvider(
                    create: (context) => WorkDetailsViewModel(),
                    child: WorkDetails(
                      id: state.pathParameters['id']!,
                    ),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: Routes.contact.path,
            name: Routes.contact.name,
            builder: (context, state) => BlocProvider(
              create: (context) => ContactViewmodel(),
              child: const Contact(),
            ),
          ),
        ],
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
