import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/base/base_page.dart';

import 'arguments_set_controller.dart';
import 'arguments_set_model.dart';

class ArgumentsSetPage
    extends BasePage<ArgumentsSetController, ArgumentsSetModel> {
  const ArgumentsSetPage({super.key});

  @override
  ArgumentsSetController putController() => Get.put(ArgumentsSetController());

  @override
  Widget? get appBar => AppBar(
        title: const Text('ArgumentsSetPage'),
      );

  @override
  Widget get body {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: controller.onPushQueryParamsBtnTap,
            child: const Text(
              'push 设置 queryParams',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: controller.onPushPathParamsBtnTap,
            child: const Text(
              'push 设置 pathParams',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: controller.onGoQueryParamsBtnTap,
            child: const Text(
              'go 设置 queryParams',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: controller.onGoPathParamsBtnTap,
            child: const Text(
              'go 设置 pathParams',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: controller.onToQueryParamsBtnTap,
            child: const Text(
              'to 设置 queryParams',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: controller.onToPathParamsBtnTap,
            child: const Text(
              'to 设置 pathParams',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: controller.onPushNameQueryParamsBtnTap,
            child: const Text(
              'push name 设置 queryParams',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: controller.onPushNamePathParamsBtnTap,
            child: const Text(
              'push name 设置 pathParams',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: controller.onGoNameQueryParamsBtnTap,
            child: const Text(
              'go name 设置 queryParams',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: controller.onGoNamePathParamsBtnTap,
            child: const Text(
              'go name 设置 pathParams',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: controller.onToNameQueryParamsBtnTap,
            child: const Text(
              'to name 设置 queryParams',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: controller.onToNamePathParamsBtnTap,
            child: const Text(
              'to name 设置 pathParams',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
