import 'package:extensions/gesture_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/base/base_page.dart';

import 'gesture_controller.dart';
import 'gesture_model.dart';

class GesturePage extends BasePage<GestureController, GestureModel> {
  const GesturePage({super.key});

  @override
  GestureController putController() => Get.put(GestureController());

  @override
  Widget? get appBar => AppBar(
        title: const Text('事件抖动和节流'),
      );

  @override
  Widget get body {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            model.count.toString(),
            style: const TextStyle(fontSize: 40),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: controller.onTap,
            child: const Text('正常'),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: controller.onTap.debounce(),
            child: const Text('防抖'),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: controller.onTapDelay.throttle(),
            child: const Text('节流'),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: controller.onTap.throttle(timeout: 3000),
            child: const Text('3秒节流'),
          ),
        ],
      ),
    );
  }
}
