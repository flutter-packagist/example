import 'package:example/routes/route_navigator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:log_wrapper/log/log.dart';

Widget tabNavigatorBuilder(
  StatefulNavigationShell navigationShell,
  List<Widget> children,
) =>
    TabNavigator(navigationShell, children);

class TabNavigator extends RouteNavigator {
  const TabNavigator(super.navigationShell, super.children, {super.key});

  @override
  Widget build(BuildContext context, TabController tabController) {
    logW("navigationShell: ${navigationShell.currentIndex}");
    return Material(
      child: Column(children: [
        TabBar(
          controller: tabController,
          tabs: const [
            Tab(text: 'Tab1'),
            Tab(text: 'Tab2'),
          ],
          labelColor: Colors.black,
          onTap: navigationShell.goBranch,
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: children,
          ),
        ),
      ]),
    );
  }
}
