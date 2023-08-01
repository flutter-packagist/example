import 'package:flutter/material.dart';
import 'package:route/route/route_navigator.dart';

class TabNavigatorWeb extends RouteNavigator {
  const TabNavigatorWeb(super.navigationShell, super.children, {super.key});

  @override
  Widget build(BuildContext context, TabController tabController) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabNavigator'),
      ),
      body: Column(children: [
        TabBar(
          controller: tabController,
          tabs: const [
            Tab(text: 'Tab1'),
            Tab(text: 'Tab2'),
          ],
          labelColor: Colors.black,
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
