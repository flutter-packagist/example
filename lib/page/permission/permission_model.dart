import 'package:get/get.dart';
import 'package:packagist_mvc/mvc.dart';
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
    } else if (GetPlatform.isAndroid) {
      return permission != Permission.unknown &&
          permission != Permission.mediaLibrary &&
          permission != Permission.photosAddOnly &&
          permission != Permission.reminders &&
          permission != Permission.bluetooth &&
          permission != Permission.appTrackingTransparency &&
          permission != Permission.criticalAlerts;
    }
    return false;
  }).toList();

  List<PermissionStatus> permissionStatusList = [];
}
