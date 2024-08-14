import 'package:example/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../detail/detail_page.dart';
import 'page_navigator_native.dart';
import 'page_navigator_web.dart';

RouteBase pageNavigatorRoute() {
  if (GetPlatform.isWeb) {
    return StatefulShellRoute(
      builder: (context, state, navigationShell) => navigationShell,
      navigatorContainerBuilder: (context, navigationShell, children) =>
          PageNavigatorWeb(navigationShell, children),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(routes: <GoRoute>[
          GoRoute(
            path: Paths.page1,
            builder: (context, state) => const DetailPage("Page1"),
          ),
        ]),
        StatefulShellBranch(routes: <GoRoute>[
          GoRoute(
            path: Paths.page2,
            builder: (context, state) => const DetailPage("Page2"),
          ),
        ]),
      ],
    );
  }
  return GoRoute(
    path: Paths.page,
    builder: (context, state) => const PageNavigatorNative([
      DetailPage("Page1"),
      DetailPage("Page2"),
    ]),
  );
}
