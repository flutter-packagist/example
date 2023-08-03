import 'package:flutter/material.dart';

class TabNavigatorNative extends StatefulWidget {
  final List<Widget> children;

  const TabNavigatorNative(
    this.children, {
    super.key,
  });

  @override
  State<TabNavigatorNative> createState() => _TabNavigatorNativeState();
}

class _TabNavigatorNativeState extends State<TabNavigatorNative>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(
      length: widget.children.length, vsync: this, initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabNavigatorNative'),
      ),
      body: Column(children: [
        TabBar(
          controller: _tabController,
          onTap: (int index) {
            _tabController.animateTo(index);
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
