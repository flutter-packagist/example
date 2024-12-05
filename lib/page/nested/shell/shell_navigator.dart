import 'package:example/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:packagist_route/route.dart';

import '../detail/detail_page.dart';
import 'shell_navigator_native.dart';
import 'shell_navigator_web.dart';

RouteBase shellNavigatorRoute() {
  if (GetPlatform.isWeb) {
    return ShellRoute(
      builder: (context, state, child) => ShellNavigatorWeb(child),
      routes: <RouteBase>[
        GoRoute(
          path: Paths.shell1,
          pageBuilder: (context, state) => FadeTransitionPage(
            key: state.pageKey,
            name: state.path,
            child: const DetailPage("Shell1"),
          ),
        ),
        GoRoute(
          path: Paths.shell2,
          pageBuilder: (context, state) => FadeTransitionPage(
            key: state.pageKey,
            name: state.path,
            child: const DetailPage("Shell2"),
          ),
        ),
      ],
    );
  }
  return GoRoute(
    path: Paths.shell,
    builder: (context, state) => const ShellNavigatorNative([
      DetailPage("Shell1"),
      DetailPage("Shell2"),
    ]),
  );
}
