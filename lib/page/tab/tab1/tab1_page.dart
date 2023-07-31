import 'package:example/page/tab/tab1/tab1_controller.dart';
import 'package:example/page/tab/tab1/tab1_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/base/base_page.dart';

class Tab1Page extends BasePage<Tab1Controller, Tab1Model> {
  const Tab1Page({super.key});

  @override
  Tab1Controller putController() => Get.put(Tab1Controller());

  @override
  Widget get body {
    return const Center(
      child: Text(
        'Tab1Page',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
