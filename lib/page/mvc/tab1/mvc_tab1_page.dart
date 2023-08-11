import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/base/base_page.dart';

import 'mvc_tab1_controller.dart';
import 'mvc_tab1_model.dart';

class MvcTab1Page extends BaseStatusPage<MvcTab1Controller, MvcTab1Model> {
  const MvcTab1Page({super.key});

  @override
  MvcTab1Controller putController() => Get.put(MvcTab1Controller());

  @override
  Color get backgroundColor => Colors.white;

  @override
  Widget get loading => super.loading;

  @override
  Widget get error => GestureDetector(
        onTap: controller.onRetry,
        child: super.error,
      );

  @override
  Widget get empty => GestureDetector(
        onTap: controller.onRetry,
        child: super.empty,
      );

  @override
  Widget get body {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("计数：${model.count}"),
          const SizedBox(height: 50),
          TextButton(
            onPressed: controller.onStatusSwitch,
            child: const Text('MVC加载状态切换测试，\n点击进入加载状态'),
          ),
        ],
      ),
    );
  }
}
