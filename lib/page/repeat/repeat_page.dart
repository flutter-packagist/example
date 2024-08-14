import 'package:flutter/material.dart';
import 'package:mvc/base/base_page.dart';

import 'repeat_controller.dart';
import 'repeat_model.dart';

// ignore: must_be_immutable
class RepeatPage extends BasePage<RepeatController, RepeatModel> {
  RepeatPage({super.key});

  /// ======= 解决页面重复跳转复用Controller导致GlobalKey复用问题 start =======
  String? repeatTag;

  @override
  void initRepeatTag(String? tag) {
    repeatTag = tag;
  }

  @override
  String? get tagRepeat => repeatTag;

  /// ======= 解决页面重复跳转复用Controller导致GlobalKey复用问题 end   =======

  @override
  bool get reuseController => false;

  @override
  RepeatController get binding => RepeatController();

  @override
  Widget? get appBar => AppBar(
        title: const Text('Controller复用示例'),
      );

  @override
  Widget get body {
    return Center(
      key: controller.ancestorKey,
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
