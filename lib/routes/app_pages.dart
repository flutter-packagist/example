import 'package:flutter/material.dart';
import 'package:log_wrapper/log/log.dart';
import 'package:packagist_route/route.dart';

import '../page/arguments/get/arguments_get_page.dart';
import '../page/arguments/observer/arguments_observer_page.dart';
import '../page/arguments/set/arguments_set_page.dart';
import '../page/button/button_page.dart';
import '../page/database/database_page.dart';
import '../page/gesture/gesture_page.dart';
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
import '../page/repeat/repeat_page.dart';
import '../page/replace/replace_page.dart';
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
      GoRoute(
        path: Paths.replace,
        builder: (context, state) => const ReplacePage(),
      ),
      GoRoute(path: Paths.main, builder: (context, state) => const MainPage()),
      GoRoute(path: Paths.mvc, builder: (context, state) => const MvcPage()),
      GoRoute(
          path: Paths.transition,
          builder: (context, state) => const TransitionPage(),
          routes: [
            GoRoute(
              path: Paths.none,
              builder: (context, state) => const TransitionNextPage(),
            ),
            GoRoute(
              path: Paths.fade,
              pageBuilder: (context, state) => FadeTransitionPage(
                key: state.pageKey,
                name: state.name,
                child: const TransitionNextPage(),
              ),
            ),
            GoRoute(
              path: Paths.scale,
              pageBuilder: (context, state) => ScaleTransitionPage(
                key: state.pageKey,
                name: state.name,
                child: const TransitionNextPage(),
              ),
            ),
            GoRoute(
              path: Paths.rotate,
              pageBuilder: (context, state) => RotateTransitionPage(
                key: state.pageKey,
                name: state.name,
                child: const TransitionNextPage(),
              ),
            ),
            GoRoute(
              path: Paths.size,
              pageBuilder: (context, state) => SizeTransitionPage(
                key: state.pageKey,
                name: state.name,
                child: const TransitionNextPage(),
              ),
            ),
            GoRoute(
              path: Paths.right,
              pageBuilder: (context, state) => RightToLeftTransitionPage(
                key: state.pageKey,
                name: state.name,
                child: const TransitionNextPage(),
              ),
            ),
            GoRoute(
              path: Paths.left,
              pageBuilder: (context, state) => LeftToRightTransitionPage(
                key: state.pageKey,
                name: state.name,
                child: const TransitionNextPage(),
              ),
            ),
            GoRoute(
              path: Paths.top,
              pageBuilder: (context, state) => TopToBottomTransitionPage(
                key: state.pageKey,
                name: state.name,
                child: const TransitionNextPage(),
              ),
            ),
            GoRoute(
              path: Paths.bottom,
              pageBuilder: (context, state) => BottomToTopTransitionPage(
                key: state.pageKey,
                name: state.name,
                child: const TransitionNextPage(),
              ),
            ),
            GoRoute(
              path: Paths.rightFade,
              pageBuilder: (context, state) =>
                  RightToLeftWithFadeTransitionPage(
                key: state.pageKey,
                name: state.name,
                child: const TransitionNextPage(),
              ),
            ),
            GoRoute(
              path: Paths.leftFade,
              pageBuilder: (context, state) =>
                  LeftToRightWithFadeTransitionPage(
                key: state.pageKey,
                name: state.name,
                child: const TransitionNextPage(),
              ),
            ),
          ]),
      GoRoute(
          path: Paths.arguments,
          builder: (context, state) => const ArgumentsSetPage(),
          routes: [
            GoRoute(
              name: "namePushParams",
              path: Paths.argumentsParams,
              builder: (context, state) => const ArgumentsGetPage(),
            ),
            GoRoute(
              name: "namePushPath",
              path: Paths.argumentsPath,
              builder: (context, state) => const ArgumentsGetPage(),
            ),
            GoRoute(
              name: "namePushQuery",
              path: Paths.argumentsQuery,
              builder: (context, state) => const ArgumentsGetPage(),
            ),
            GoRoute(
              name: "nameGoParams",
              path: Paths.argumentsParams,
              builder: (context, state) => const ArgumentsGetPage(),
            ),
            GoRoute(
              name: "nameGoPath",
              path: Paths.argumentsPath,
              builder: (context, state) => const ArgumentsGetPage(),
            ),
            GoRoute(
              name: "nameGoQuery",
              path: Paths.argumentsQuery,
              builder: (context, state) => const ArgumentsGetPage(),
            ),
            GoRoute(
              path: Paths.argumentsReplace,
              builder: (context, state) => const ArgumentsGetPage(),
            ),
          ]),
      GoRoute(
        path: Paths.arguments + Paths.observer,
        builder: (context, state) => const ArgumentsObserverPage(),
      ),
      GoRoute(
        path: "${Paths.arguments}${Paths.observer}/1",
        builder: (context, state) => const ArgumentsObserverPage1(),
      ),
      GoRoute(
        path: "${Paths.arguments}${Paths.observer}/2",
        builder: (context, state) => const ArgumentsObserverPage2(),
      ),
      GoRoute(
        path: Paths.argumentsReplace1,
        builder: (context, state) => const ArgumentsGetPage(),
      ),
      tabNavigatorRoute(),
      pageNavigatorRoute(),
      stackNavigatorRoute(),
      shellNavigatorRoute(),
      GoRoute(
        path: Paths.dialog,
        builder: (context, state) => const DialogPage(),
      ),
      GoRoute(
        path: Paths.redirect,
        builder: (context, state) => const RedirectPage(),
      ),
      GoRoute(
        path: Paths.notFound,
        builder: (context, state) => const NotFoundPage(),
      ),
      GoRoute(
        path: Paths.network,
        builder: (context, state) => const NetworkPage(),
      ),
      GoRoute(
        path: Paths.permission,
        builder: (context, state) => const PermissionPage(),
      ),
      GoRoute(
        path: Paths.refresh,
        builder: (context, state) => const RefreshPage(),
      ),
      GoRoute(
        path: Paths.database,
        builder: (context, state) => const DatabasePage(),
      ),
      GoRoute(
        path: Paths.gesture,
        builder: (context, state) => const GesturePage(),
      ),
      GoRoute(
        path: Paths.repeat,
        builder: (context, state) => RepeatPage(),
      ),
      GoRoute(
        path: Paths.button,
        builder: (context, state) => const ButtonPage(),
      ),
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
