import 'package:flutter/material.dart';
import 'package:mvc/base/base_page.dart';

import 'main_controller.dart';
import 'main_model.dart';

class MainPage extends BasePage<MainController, MainModel> {
  const MainPage({super.key});

  @override
  MainController get binding => MainController();

  @override
  Color get backgroundColor => Colors.white;

  @override
  Widget? get appBar => AppBar(
        title: const Text('示例'),
      );

  @override
  Widget get body {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 50),
      itemCount: controller.routes.length,
      itemBuilder: (context, index) {
        return ListTile(
          tileColor: index % 2 == 0 ? Colors.white : Colors.grey[200],
          title: Text(controller.routes.keys.elementAt(index)),
          onTap: () => controller.onItemTap(index),
        );
      },
    );
  }
}
