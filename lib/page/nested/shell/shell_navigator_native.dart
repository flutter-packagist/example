import 'package:flutter/material.dart';

class ShellNavigatorNative extends StatefulWidget {
  final List<Widget> children;

  const ShellNavigatorNative(
    this.children, {
    super.key,
  });

  @override
  State<ShellNavigatorNative> createState() => _ShellNavigatorNativeState();
}

class _ShellNavigatorNativeState extends State<ShellNavigatorNative> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShellRoute'),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: widget.children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Section A'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Section B'),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          _currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
