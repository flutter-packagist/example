import 'package:example/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:route/route/route_extension.dart';

import '../detail/detail_page.dart';
import 'tab_navigator_native.dart';
import 'tab_navigator_web.dart';

RouteBase tabNavigatorRoute() {
  if (GetPlatform.isWeb) {
    return statefulShellRoute(
      navigatorContainerBuilder: (context, navigationShell, children) =>
          TabNavigatorWeb(navigationShell, children),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(routes: <GoRoute>[
          goRoute(path: Paths.tab1, child: const DetailPage()),
        ]),
        StatefulShellBranch(routes: <GoRoute>[
          goRoute(path: Paths.tab2, child: const DetailPage()),
        ]),
      ],
    );
  }
  return goRoute(
    path: Paths.tab,
    child: const TabNavigatorNative(children: [DetailPage(), DetailPage()]),
  );
}
