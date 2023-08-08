import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/base/base_page.dart';

import 'permission_controller.dart';
import 'permission_model.dart';

class PermissionPage extends BasePage<PermissionController, PermissionModel> {
  const PermissionPage({super.key});

  @override
  PermissionController putController() => Get.put(PermissionController());

  @override
  Widget? get appBar => AppBar(
        title: const Text('权限统一处理流程示例'),
      );

  @override
  Widget get body {
    return Center(
      child: TextButton(
        onPressed: controller.onPermissionRequest,
        child: const Text('权限请求'),
      ),
    );
  }
}
