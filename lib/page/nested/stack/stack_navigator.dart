import 'package:example/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../detail/detail_page.dart';
import 'stack_navigator_native.dart';
import 'stack_navigator_web.dart';

RouteBase stackNavigatorRoute() {
  if (GetPlatform.isWeb) {
    return StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          StackNavigatorWeb(navigationShell),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(routes: <GoRoute>[
          GoRoute(
            path: Paths.stack1,
            builder: (context, state) => const DetailPage("Stack1"),
          ),
        ]),
        StatefulShellBranch(routes: <GoRoute>[
          GoRoute(
            path: Paths.stack2,
            builder: (context, state) => const DetailPage("Stack2"),
          ),
        ]),
      ],
    );
  }
  return GoRoute(
    path: Paths.stack,
    builder: (context, state) => const StackNavigatorNative([
      DetailPage("Stack1"),
      DetailPage("Stack2"),
    ]),
  );
}
