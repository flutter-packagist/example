import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/base/base_page.dart';

import 'transition_controller.dart';
import 'transition_model.dart';

class TransitionPage extends BasePage<TransitionController, TransitionModel> {
  const TransitionPage({super.key});

  @override
  TransitionController putController() => Get.put(TransitionController());

  @override
  Widget? get appBar => AppBar(
        title: const Text('TransitionPage'),
      );

  @override
  Widget get body {
    return ListView.builder(
      itemCount: controller.routes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(controller.routes.keys.elementAt(index)),
          onTap: () => controller.onItemTap(index),
        );
      },
    );
  }
}
