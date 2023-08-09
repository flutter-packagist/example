import 'package:extensions/permission_extension.dart';
import 'package:flutter/material.dart';
import 'package:log_wrapper/log/log.dart';
import 'package:mvc/base/base_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:route/route.dart';

import 'permission_model.dart';

class PermissionController extends BaseController<PermissionModel> {
  @override
  PermissionModel model = PermissionModel();

  @override
  void onReady() {
    super.onReady();
    initPermissionStatus();
  }

  void initPermissionStatus() async {
    final permissionStatusList = await Future.wait<PermissionStatus>(
      model.permissionList.map((permission) => permission.status),
    );
    model.permissionStatusList = permissionStatusList;
    update();
  }
}

extension Data on PermissionController {
  List<Permission> get permissionList => model.permissionList;

  List<PermissionStatus> get permissionStatusList => model.permissionStatusList;

  List<Color> get permissionColorList =>
      model.permissionStatusList.map((e) => _parsePermissionColor(e)).toList();

  Color _parsePermissionColor(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.denied:
        return Colors.red;
      case PermissionStatus.granted:
        return Colors.green;
      case PermissionStatus.limited:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}

extension Action on PermissionController {
  void onPermissionRequest(int index, Permission permission) async {
    final status = await permission.use();
    model.permissionStatusList[index] = status;
    update();
    logD("status: $status");
  }

  void checkServiceStatus(PermissionWithService permission) async {
    final serviceStatus = await permission.serviceStatus;
    Go.snackbar("serviceStatus:", serviceStatus.toString());
  }
}
