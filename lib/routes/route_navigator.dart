import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:log_wrapper/log/log.dart';

/// StatefulShellRoute 简写
StatefulShellRoute statefulShellRoute({
  required Widget Function(
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  )
      containerBuilder,
  required List<StatefulShellBranch> branches,
}) {
  return StatefulShellRoute(
    builder: (BuildContext context, GoRouterState state,
        StatefulNavigationShell navigationShell) {
      return navigationShell;
    },
    navigatorContainerBuilder: (BuildContext context,
        StatefulNavigationShell navigationShell, List<Widget> children) {
      return containerBuilder(navigationShell, children);
    },
    branches: branches,
  );
}

/// StatefulShellBranch 简写
StatefulShellBranch statefulShellBranch({
  GlobalKey<NavigatorState>? navigatorKey,
  required Widget Function(
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  )
      containerBuilder,
  required List<StatefulShellBranch> branches,
}) {
  return StatefulShellBranch(
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      statefulShellRoute(
        containerBuilder: containerBuilder,
        branches: branches,
      ),
    ],
  );
}

abstract class PageInterface {
  Widget build(BuildContext context, TabController tabController);
}

class RouteNavigator extends StatefulWidget implements PageInterface {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  const RouteNavigator(
    this.navigationShell,
    this.children, {
    super.key,
  });

  @override
  State<RouteNavigator> createState() => _RouteNavigatorState();

  @override
  Widget build(BuildContext context, TabController tabController) {
    throw UnimplementedError();
  }
}

class _RouteNavigatorState extends State<RouteNavigator>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
      length: widget.children.length,
      vsync: this,
      initialIndex: widget.navigationShell.currentIndex);

  @override
  void didUpdateWidget(covariant RouteNavigator oldWidget) {
    super.didUpdateWidget(oldWidget);
    _tabController.index = widget.navigationShell.currentIndex;
    logW("didUpdateWidget: ${widget.navigationShell.currentIndex}");
  }

  @override
  Widget build(BuildContext context) {
    logW("build: ${widget.navigationShell.currentIndex}");
    return widget.build(context, _tabController);
  }
}
