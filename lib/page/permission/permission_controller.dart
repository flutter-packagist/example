import 'package:example/permission/permission_ext.dart';
import 'package:log_wrapper/log/log.dart';
import 'package:mvc/base/base_controller.dart';
import 'package:oktoast/oktoast.dart';
import 'package:permission_handler/permission_handler.dart';

import 'permission_model.dart';

class PermissionController extends BaseController<PermissionModel> {
  @override
  PermissionModel model = PermissionModel();
}

extension Data on PermissionController {}

extension Action on PermissionController {
  void onPermissionRequest() async {
    final status = await Permission.camera.use(
      onAccept: (status) {
        showToast("请求权限成功");
      },
    );
    logD("status: $status");
  }
}
