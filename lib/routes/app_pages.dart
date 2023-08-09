import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:log_wrapper/log/log.dart';
import 'package:route/route.dart';
import 'package:route/route/route_transition.dart';

import '../page/arguments/get/arguments_get_page.dart';
import '../page/arguments/set/arguments_set_page.dart';
import '../page/main/main_page.dart';
import '../page/mvc/mvc_page.dart';
import '../page/nested/page/page_navigator.dart';
import '../page/nested/shell/shell_navigator.dart';
import '../page/nested/stack/stack_navigator.dart';
import '../page/nested/tab/tab_navigator.dart';
import '../page/network/network_page.dart';
import '../page/notfound/notfound_page.dart';
import '../page/observer/dialog_observer.dart';
import '../page/observer/dialog_page.dart';
import '../page/permission/permission_page.dart';
import '../page/redirect/redirect_page.dart';
import '../page/refresh/refresh_page.dart';
import '../page/transition/index/transition_page.dart';
import '../page/transition/next/transition_next_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final GoRouter router = GoRouter(
    navigatorKey: Go.key,
    observers: <NavigatorObserver>[
      GoNavigatorObserver(Go.routing),
      DialogObserver(),
    ],
    initialLocation: Paths.main,
    routes: <RouteBase>[
      goRoute(path: Paths.main, child: const MainPage()),
      goRoute(path: Paths.mvc, child: const MvcPage()),
      goRoute(path: Paths.transition, child: const TransitionPage(), routes: [
        goRoute(
          path: Paths.none,
          child: const TransitionNextPage(),
          transitionType: PageTransitionType.none,
        ),
        goRoute(
          path: Paths.fade,
          child: const TransitionNextPage(),
          transitionType: PageTransitionType.fade,
        ),
        goRoute(
          path: Paths.scale,
          child: const TransitionNextPage(),
          transitionType: PageTransitionType.scale,
        ),
        goRoute(
          path: Paths.rotate,
          child: const TransitionNextPage(),
          transitionType: PageTransitionType.rotate,
        ),
        goRoute(
          path: Paths.size,
          child: const TransitionNextPage(),
          transitionType: PageTransitionType.size,
        ),
        goRoute(
          path: Paths.right,
          child: const TransitionNextPage(),
          transitionType: PageTransitionType.right,
        ),
        goRoute(
          path: Paths.left,
          child: const TransitionNextPage(),
          transitionType: PageTransitionType.left,
        ),
        goRoute(
          path: Paths.top,
          child: const TransitionNextPage(),
          transitionType: PageTransitionType.top,
        ),
        goRoute(
          path: Paths.bottom,
          child: const TransitionNextPage(),
          transitionType: PageTransitionType.bottom,
        ),
        goRoute(
          path: Paths.rightFade,
          child: const TransitionNextPage(),
          transitionType: PageTransitionType.rightFade,
        ),
        goRoute(
          path: Paths.leftFade,
          child: const TransitionNextPage(),
          transitionType: PageTransitionType.leftFade,
        ),
      ]),
      goRoute(path: Paths.arguments, child: const ArgumentsSetPage(), routes: [
        goRoute(
          name: "namePushParams",
          path: Paths.argumentsParams,
          child: const ArgumentsGetPage(),
        ),
        goRoute(
          name: "namePushPath",
          path: Paths.argumentsPath,
          child: const ArgumentsGetPage(),
        ),
        goRoute(
          name: "namePushQuery",
          path: Paths.argumentsQuery,
          child: const ArgumentsGetPage(),
        ),
        goRoute(
          name: "nameGoParams",
          path: Paths.argumentsParams,
          child: const ArgumentsGetPage(),
        ),
        goRoute(
          name: "nameGoPath",
          path: Paths.argumentsPath,
          child: const ArgumentsGetPage(),
        ),
        goRoute(
          name: "nameGoQuery",
          path: Paths.argumentsQuery,
          child: const ArgumentsGetPage(),
        ),
      ]),
      tabNavigatorRoute(),
      pageNavigatorRoute(),
      stackNavigatorRoute(),
      shellNavigatorRoute(),
      goRoute(path: Paths.dialog, child: const DialogPage()),
      goRoute(path: Paths.redirect, child: const RedirectPage()),
      goRoute(path: Paths.notFound, child: const NotFoundPage()),
      goRoute(path: Paths.network, child: const NetworkPage()),
      goRoute(path: Paths.permission, child: const PermissionPage()),
      goRoute(path: Paths.refresh, child: const RefreshPage()),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      logV("redirect: ${state.matchedLocation}");
      if (state.matchedLocation == "/login") {
        return Routes.redirect;
      }

      // no need to redirect at all
      return null;
    },
    onException: (context, GoRouterState state, GoRouter router) {
      router.go(Routes.notFound, extra: {"uri": state.uri.toString()});
    },
  );
}
