import 'package:example/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:packagist_route/route.dart';

class ShellNavigatorWeb extends StatelessWidget {
  final Widget child;

  const ShellNavigatorWeb(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShellRoute'),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'A Screen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'B Screen',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(Routes.shell1)) {
      return 0;
    }
    if (location.startsWith(Routes.shell1)) {
      return 1;
    }
    return 0;
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Go.go(Routes.shell1);
        break;
      case 1:
        Go.go(Routes.shell2);
        break;
    }
  }
}
