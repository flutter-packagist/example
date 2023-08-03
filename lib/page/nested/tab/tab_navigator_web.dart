import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabNavigatorWeb extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  const TabNavigatorWeb(
    this.navigationShell,
    this.children, {
    super.key,
  });

  @override
  State<TabNavigatorWeb> createState() => _TabNavigatorWebState();
}

class _TabNavigatorWebState extends State<TabNavigatorWeb>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
      length: widget.children.length,
      vsync: this,
      initialIndex: widget.navigationShell.currentIndex);
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController.addListener(() {
      if (_currentIndex == _tabController.index) return;
      widget.navigationShell.goBranch(_tabController.index);
    });
  }

  @override
  void didUpdateWidget(covariant TabNavigatorWeb oldWidget) {
    super.didUpdateWidget(oldWidget);
    _currentIndex = widget.navigationShell.currentIndex;
    _tabController.index = _currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabNavigatorWeb'),
      ),
      body: Column(children: [
        TabBar(
          controller: _tabController,
          onTap: (int index) {
            widget.navigationShell.goBranch(index);
          },
          tabs: const [
            Tab(text: 'Tab1'),
            Tab(text: 'Tab2'),
          ],
          labelColor: Colors.black,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.children,
          ),
        ),
      ]),
    );
  }
}
