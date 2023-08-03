import 'package:example/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:route/route/route_extension.dart';

import '../detail/detail_page.dart';
import 'page_navigator_native.dart';
import 'page_navigator_web.dart';

RouteBase pageNavigatorRoute() {
  if (GetPlatform.isWeb) {
    return statefulShellRoute(
      navigatorContainerBuilder: (context, navigationShell, children) =>
          PageNavigatorWeb(navigationShell, children),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(routes: <GoRoute>[
          goRoute(path: Paths.page1, child: const DetailPage("Page1")),
        ]),
        StatefulShellBranch(routes: <GoRoute>[
          goRoute(path: Paths.page2, child: const DetailPage("Page2")),
        ]),
      ],
    );
  }
  return goRoute(
    path: Paths.page,
    child: const PageNavigatorNative([
      DetailPage("Page1"),
      DetailPage("Page2"),
    ]),
  );
}
