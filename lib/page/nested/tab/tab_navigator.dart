import 'package:example/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../detail/detail_page.dart';
import 'tab_navigator_native.dart';
import 'tab_navigator_web.dart';

RouteBase tabNavigatorRoute() {
  if (GetPlatform.isWeb) {
    return StatefulShellRoute(
      builder: (context, state, navigationShell) => navigationShell,
      navigatorContainerBuilder: (context, navigationShell, children) =>
          TabNavigatorWeb(navigationShell, children),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(routes: <GoRoute>[
          GoRoute(
            path: Paths.tab1,
            builder: (context, state) => const DetailPage("Tab1"),
          ),
        ]),
        StatefulShellBranch(routes: <GoRoute>[
          GoRoute(
            path: Paths.tab2,
            builder: (context, state) => const DetailPage("Tab2"),
          ),
        ]),
      ],
    );
  }
  return GoRoute(
    path: Paths.tab,
    builder: (context, state) => const TabNavigatorNative([
      DetailPage("Tab1"),
      DetailPage("Tab2"),
    ]),
  );
}
