import 'package:get/get.dart';
import 'package:mvc/base/base_model.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionModel extends BaseModel {
  List<Permission> permissionList = Permission.values.where((permission) {
    if (GetPlatform.isIOS) {
      return permission != Permission.unknown &&
          permission != Permission.phone &&
          permission != Permission.sms &&
          permission != Permission.ignoreBatteryOptimizations &&
          permission != Permission.accessMediaLocation &&
          permission != Permission.activityRecognition &&
          permission != Permission.manageExternalStorage &&
          permission != Permission.systemAlertWindow &&
          permission != Permission.requestInstallPackages &&
          permission != Permission.accessNotificationPolicy &&
          permission != Permission.bluetoothScan &&
          permission != Permission.bluetoothAdvertise &&
          permission != Permission.bluetoothConnect &&
          permission != Permission.nearbyWifiDevices &&
          permission != Permission.videos &&
          permission != Permission.audio &&
          permission != Permission.scheduleExactAlarm &&
          permission != Permission.sensorsAlways;
    } else {
      return permission != Permission.unknown &&
          permission != Permission.mediaLibrary &&
          permission != Permission.photosAddOnly &&
          permission != Permission.reminders &&
          permission != Permission.bluetooth &&
          permission != Permission.appTrackingTransparency &&
          permission != Permission.criticalAlerts;
    }
  }).toList();

  List<PermissionStatus> permissionStatusList = [];
}
