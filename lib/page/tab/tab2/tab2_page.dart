import 'package:example/page/tab/tab2/tab2_controller.dart';
import 'package:example/page/tab/tab2/tab2_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/base/base_page.dart';

class Tab2Page extends BasePage<Tab2Controller, Tab2Model> {
  const Tab2Page({super.key});

  @override
  Tab2Controller putController() => Get.put(Tab2Controller());

  @override
  Widget get body {
    return const Center(
      child: Text(
        'Tab2Page',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
