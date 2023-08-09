import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/base/base_page.dart';
import 'package:permission_handler/permission_handler.dart';

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
    return ListView.builder(
      itemCount: controller.permissionStatusList.length,
      itemBuilder: (context, index) {
        final permission = controller.permissionList[index];
        final permissionStatus = controller.permissionStatusList[index];
        final permissionColor = controller.permissionColorList[index];
        return ListTile(
          tileColor: index % 2 == 0 ? Colors.white : Colors.grey[200],
          title: Text(
            permission.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          subtitle: Text(
            permissionStatus.toString(),
            style: TextStyle(color: permissionColor),
          ),
          trailing: (permission is PermissionWithService)
              ? IconButton(
                  icon: const Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.checkServiceStatus(permission);
                  },
                )
              : null,
          onTap: () {
            controller.onPermissionRequest(index, permission);
          },
        );
      },
    );
  }
}
