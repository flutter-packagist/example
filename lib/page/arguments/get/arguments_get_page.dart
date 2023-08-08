import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/base/base_page.dart';

import 'arguments_get_controller.dart';
import 'arguments_get_model.dart';

class ArgumentsGetPage extends BasePage<ArgumentsGetController, ArgumentsGetModel> {
  const ArgumentsGetPage({super.key});

  @override
  ArgumentsGetController putController() => Get.put(ArgumentsGetController());

  @override
  Widget? get appBar => AppBar(
        title: const Text('参数获取'),
      );

  @override
  Widget get body {
    return Center(
      child: Text(
        '参数：title = ${model.title}, url =  ${model.url}',
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
