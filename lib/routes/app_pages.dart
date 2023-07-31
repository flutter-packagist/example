import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:log_wrapper/log/log.dart';
import 'package:route/route.dart';

import '../page/home/home_page.dart';
import '../page/tab/navigator/tab_navigator.dart';
import '../page/tab/tab1/tab1_page.dart';
import '../page/tab/tab2/tab2_page.dart';
import 'route_navigator.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final GoRouter router = GoRouter(
    navigatorKey: Go.key,
    observers: <NavigatorObserver>[GoNavigatorObserver(Go.routing)],
    initialLocation: _Paths.home,
    routes: <RouteBase>[
      GoRoute(
        path: _Paths.home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      statefulShellRoute(
        containerBuilder: tabNavigatorBuilder,
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <GoRoute>[
              GoRoute(
                path: _Paths.tab1,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return fadeTransition(state, const Tab1Page());
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <GoRoute>[
              GoRoute(
                path: _Paths.tab2,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return fadeTransition(state, const Tab2Page());
                },
              ),
            ],
            // preload: true,
          ),
        ],
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      logV("redirect: ${state.matchedLocation}");
      // no need to redirect at all
      return null;
    },
  );
}

/// 使用GO路由进行参数传递
void passGoArguments(GoRouterState state) {
  if (state.fullPath != Go.currentRoute) return;
  Map<String, dynamic> args = <String, dynamic>{};
  if (state.pathParameters.isNotEmpty) args.addAll(state.pathParameters);
  if (state.uri.queryParameters.isNotEmpty) {
    args.addAll(state.uri.queryParameters);
  }
  Go.routing.args = args;
  logV("current route: ${Go.currentRoute}, arguments: $args");
}

/// 路由切换动画
Page fadeTransition(GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 150),
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
        child: child,
      );
    },
  );
}
