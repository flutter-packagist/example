import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/base/base_page.dart';

import 'mvc_tab2_controller.dart';
import 'mvc_tab2_model.dart';

class MvcTab2Page extends BasePage<MvcTab2Controller, MvcTab2Model> {
  const MvcTab2Page({super.key});

  @override
  MvcTab2Controller get binding => MvcTab2Controller();

  @override
  Color get backgroundColor => Colors.white;

  @override
  Widget get body {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<MvcTab2Controller>(
            id: mvcTab2Btn1,
            builder: (_) => Text("计数区1：${model.count}"),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: controller.onBtn1Tap,
            child: const Text('计数区1 +1'),
          ),
          const SizedBox(height: 80),
          GetBuilder<MvcTab2Controller>(
            id: mvcTab2Btn2,
            builder: (_) => Text("计数区2：${model.count}"),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: controller.onBtn2Tap,
            child: const Text('全部 +1'),
          ),
        ],
      ),
    );
  }

  @override
  State<BasePage> createState() =>
      KeepAliveState<MvcTab2Page, MvcTab2Controller>();
}
