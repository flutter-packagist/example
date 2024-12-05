import 'package:flutter/material.dart';
import 'package:packagist_mvc/mvc.dart';

import 'nested_scroll_controller.dart';
import 'nested_scroll_model.dart';

class NestedScrollPage
    extends BasePage<NestedScrollController, NestedScrollModel> {
  const NestedScrollPage({super.key});

  @override
  NestedScrollController get binding => NestedScrollController();

  @override
  Widget? get appBar => AppBar(
        title: const Text('示例'),
      );

  @override
  Widget get body {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Demo'),
              background: Image.asset(
                'assets/images/1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ];
      },
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
    );
  }
}
