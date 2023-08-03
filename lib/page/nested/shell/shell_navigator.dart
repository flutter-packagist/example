import 'package:example/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:route/route/route_extension.dart';
import 'package:route/route/route_transition.dart';

import '../detail/detail_page.dart';
import 'shell_navigator_native.dart';
import 'shell_navigator_web.dart';

RouteBase shellNavigatorRoute() {
  if (GetPlatform.isWeb) {
    return ShellRoute(
      builder: (context, state, child) => ShellNavigatorWeb(child),
      routes: <RouteBase>[
        goRoute(
          path: Paths.shell1,
          child: const DetailPage("Shell1"),
          transitionType: PageTransitionType.fade,
        ),
        goRoute(
          path: Paths.shell2,
          child: const DetailPage("Shell2"),
          transitionType: PageTransitionType.fade,
        ),
      ],
    );
  }
  return goRoute(
    path: Paths.shell,
    child: const ShellNavigatorNative([
      DetailPage("Shell1"),
      DetailPage("Shell2"),
    ]),
  );
}
