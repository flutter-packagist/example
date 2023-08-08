import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:route/route.dart';

extension PermissionActionHandle on Permission {
  Future<PermissionStatus> use({
    Function(PermissionStatus)? onAccept,
    Function(PermissionStatus)? onDenied,
  }) async {
    final PermissionStatus status = await request();
    if (status.isGranted || status.isLimited) {
      onAccept?.call(status);
    } else if (onDenied != null) {
      onDenied.call(status);
    } else if (status.isPermanentlyDenied) {
      settingDialog();
    }
    return status;
  }

  Future settingDialog({String? description}) {
    return Go.dialog(Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          const Text(
            '提示',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description ?? '請在設置中打開權限',
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          Container(height: 0.5, width: 300, color: Colors.black12),
          SizedBox(
            width: 300,
            height: 50,
            child: Row(children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Go.back(),
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: const Text(
                    '取消',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(height: 50, width: 0.5, color: Colors.black12),
              Expanded(
                child: TextButton(
                  onPressed: () => openAppSettings(),
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: const Text(
                    '前往',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    ));
  }
}
