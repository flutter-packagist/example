import 'package:example/page/transition/next/transition_next_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:log_wrapper/log/log.dart';
import 'package:route/route.dart';
import 'package:route/route/route_extension.dart';
import 'package:route/route/route_transition.dart';

import '../page/arguments/get/arguments_get_page.dart';
import '../page/arguments/set/arguments_set_page.dart';
import '../page/home/home_page.dart';
import '../page/nested/tab/tab_navigator.dart';
import '../page/transition/index/transition_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final GoRouter router = GoRouter(
    navigatorKey: Go.key,
    observers: <NavigatorObserver>[GoNavigatorObserver(Go.routing)],
    initialLocation: Paths.home,
    routes: <RouteBase>[
      goRoute(path: Paths.home, child: const HomePage()),
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
    ],
    redirect: (BuildContext context, GoRouterState state) {
      logV("redirect: ${state.matchedLocation}");
      // no need to redirect at all
      return null;
    },
  );
}
