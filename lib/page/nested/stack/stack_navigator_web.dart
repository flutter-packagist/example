import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StackNavigatorWeb extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const StackNavigatorWeb(
    this.navigationShell, {
    super.key,
  });

  @override
  State<StackNavigatorWeb> createState() => _StackNavigatorWebState();
}

class _StackNavigatorWebState extends State<StackNavigatorWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IndexedStack'),
      ),
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Section A'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Section B'),
        ],
        currentIndex: widget.navigationShell.currentIndex,
        onTap: (int index) {
          widget.navigationShell.goBranch(
            index,
            initialLocation: index == widget.navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}
