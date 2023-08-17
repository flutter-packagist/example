import 'package:flutter/material.dart';
import 'package:mvc/base/base_page.dart';

import 'repeat_controller.dart';
import 'repeat_model.dart';

class RepeatPage extends BasePage<RepeatController, RepeatModel> {
  const RepeatPage({super.key});

  @override
  bool? get reuseController => false;

  @override
  RepeatController get binding => RepeatController();

  @override
  Widget? get appBar => AppBar(
        title: const Text('Controller复用示例'),
      );

  @override
  Widget get body {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('count: ${controller.count}'),
          const SizedBox(height: 20),
          TextButton(
            onPressed: controller.onCountIncrease,
            child: const Text('+1'),
          ),
          TextButton(
            onPressed: controller.onPushPage,
            child: const Text('跳转'),
          ),
        ],
      ),
    );
  }
}
