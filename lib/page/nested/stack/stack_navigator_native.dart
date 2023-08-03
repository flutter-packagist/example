import 'package:flutter/material.dart';

class StackNavigatorNative extends StatefulWidget {
  final List<Widget> children;

  const StackNavigatorNative(
    this.children, {
    super.key,
  });

  @override
  State<StackNavigatorNative> createState() => _StackNavigatorNativeState();
}

class _StackNavigatorNativeState extends State<StackNavigatorNative> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IndexedStack'),
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
