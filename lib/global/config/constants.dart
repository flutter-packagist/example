import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// debug 环境
const bool debugMode = !kReleaseMode;
const int envMode = debugMode ? 2 : 1;

/// dev ip 指向
const String devIp = "192.168.2.12";

/// 日志打印开关
const bool logNetwork = debugMode;
const bool logLocal = debugMode;
const bool logGetX = debugMode;
const bool logDuration = debugMode;
const bool showLog = false;

/// UI常量
final double appBarHeightC = 50.r;
final double bottomBarHeight = 65.r + Get.mediaQuery.padding.bottom;
final double safeTop = Get.mediaQuery.padding.top;
final double safeBottom = Get.mediaQuery.padding.bottom;
final double safeHeight = Get.height - safeTop - safeBottom;

/// 数据库
const String dbName = "design100.db";
const int dbVersion = 1;

/// 设备类型
const String deviceType = "mobile"; // desktop/mobile
