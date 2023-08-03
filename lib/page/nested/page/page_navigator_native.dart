import 'package:flutter/material.dart';

class PageNavigatorNative extends StatefulWidget {
  final List<Widget> children;

  const PageNavigatorNative(
    this.children, {
    super.key,
  });

  @override
  State<PageNavigatorNative> createState() => _PageNavigatorNativeState();
}

class _PageNavigatorNativeState extends State<PageNavigatorNative>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NavigationBar'),
      ),
      body: PageView(
        controller: _pageController,
        children: widget.children,
        onPageChanged: (index) {
          _currentIndex = index;
          setState(() {});
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Section A'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Section B'),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
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
