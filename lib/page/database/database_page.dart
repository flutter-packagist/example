import 'package:flutter/material.dart';
import 'package:mvc/base/base_page.dart';

import 'database_controller.dart';
import 'database_model.dart';

class DatabasePage extends BasePage<DatabaseController, DatabaseModel> {
  const DatabasePage({super.key});

  @override
  DatabaseController get binding => DatabaseController();

  @override
  Widget? get appBar => AppBar(
        title: const Text('数据库使用示例（drift）'),
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
            onTap: controller.onLinkTap,
          );
        }
        return ListTile(
          tileColor: index % 2 == 0 ? Colors.white : Colors.grey[200],
          title: Text(controller.routes.keys.elementAt(index - 1)),
          onTap: () => controller.routes.values.elementAt(index - 1)(),
        );
      },
    );
  }
}
