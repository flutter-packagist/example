import 'package:example/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:route/route/route_extension.dart';

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
          goRoute(path: Paths.stack1, child: const DetailPage("Stack1")),
        ]),
        StatefulShellBranch(routes: <GoRoute>[
          goRoute(path: Paths.stack2, child: const DetailPage("Stack2")),
        ]),
      ],
    );
  }
  return goRoute(
    path: Paths.stack,
    child: const StackNavigatorNative([
      DetailPage("Stack1"),
      DetailPage("Stack2"),
    ]),
  );
}
