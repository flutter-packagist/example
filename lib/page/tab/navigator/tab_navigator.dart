import 'package:example/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:route/route/route_extension.dart';

import '../tab1/tab1_page.dart';
import '../tab2/tab2_page.dart';
import 'tab_navigator_native.dart';
import 'tab_navigator_web.dart';

RouteBase tabNavigatorRoute() {
  if (GetPlatform.isWeb) {
    return statefulShellRoute(
      containerBuilder: (
        StatefulNavigationShell navigationShell,
        List<Widget> children,
      ) {
        return TabNavigatorWeb(navigationShell, children);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(routes: <GoRoute>[
          goRoute(path: Paths.tab1, child: const Tab1Page()),
        ]),
        StatefulShellBranch(routes: <GoRoute>[
          goRoute(path: Paths.tab2, child: const Tab2Page()),
        ]),
      ],
    );
  }
  return goRoute(
    path: Paths.tab,
    child: const TabNavigatorNative(children: [Tab1Page(), Tab2Page()]),
  );
}
