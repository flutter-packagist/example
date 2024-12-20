import 'package:flutter/material.dart';
import 'package:packagist_mvc/mvc.dart';

import 'arguments_set_controller.dart';
import 'arguments_set_model.dart';

class ArgumentsSetPage
    extends BasePage<ArgumentsSetController, ArgumentsSetModel> {
  const ArgumentsSetPage({super.key});

  @override
  ArgumentsSetController get binding => ArgumentsSetController();

  @override
  Widget? get appBar => AppBar(
        title: const Text('参数设置'),
      );

  @override
  Widget get body {
    return ListView.builder(
      itemCount: controller.routes.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return ListTile(
            tileColor: Colors.blue.shade300,
            title: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                controller.description,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        }
        return ListTile(
          tileColor: index % 2 == 0 ? Colors.white : Colors.grey[200],
          title: Text(controller.routes.keys.elementAt(index - 1)),
          onTap: () => controller.onItemTap(index - 1),
        );
      },
    );
  }
}
