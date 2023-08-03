import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageNavigatorWeb extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  const PageNavigatorWeb(
    this.navigationShell,
    this.children, {
    super.key,
  });

  @override
  State<PageNavigatorWeb> createState() => _PageNavigatorWebState();
}

class _PageNavigatorWebState extends State<PageNavigatorWeb> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    initPageController();
  }

  @override
  void didUpdateWidget(covariant PageNavigatorWeb oldWidget) {
    super.didUpdateWidget(oldWidget);
    initPageController();
  }

  void initPageController() {
    _pageController = PageController(
      initialPage: widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NavigationBar'),
      ),
      body: PageView(
        controller: _pageController,
        children: widget.children,
        onPageChanged: (int index) {
          widget.navigationShell.goBranch(index);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Section A'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Section B'),
        ],
        currentIndex: widget.navigationShell.currentIndex,
        onTap: (int index) {
          widget.navigationShell.goBranch(index);
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        },
      ),
    );
  }
}
