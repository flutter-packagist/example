import 'dart:io';

import 'package:cache/sp/sp_manager.dart';
import 'package:example/cache/sp/sp_params.dart';

import 'constants.dart';

class EnvConfig {
  /// 当前环境是否为测试环境
  static bool get debug => env != 1;

  /// 当前环境 1: release 2: debug 3: dev
  static int get env {
    int env = SpManager.getInt(SpParams.env);
    if (env == 0) return envMode;
    return env;
  }

  /// 接口host
  static String get host {
    return "";
  }

  /// 网络请求日志打印
  static bool get switchNetworkLog =>
      SpManager.getBool(SpParams.switchNetworkLog, defaultValue: logNetwork);

  /// 本地log日志打印
  static bool get switchLocalLog =>
      SpManager.getBool(SpParams.switchLocalLog, defaultValue: logLocal);

  /// GetX日志打印
  static bool get switchGetXLog =>
      SpManager.getBool(SpParams.switchGetXLog, defaultValue: logGetX);

  /// 请求时长日志打印
  static bool get switchDurationLog =>
      SpManager.getBool(SpParams.switchDurationLog, defaultValue: logDuration);

  /// 是否展示log
  static bool get switchShowLog =>
      SpManager.getBool(SpParams.switchShowLog, defaultValue: showLog);

  /// DEV IP
  static String get devIP =>
      SpManager.getString(SpParams.envDevIp, defaultValue: devIp);

  /// dev 环境 服务器指向cookie
  static Cookie get devCookie {
    Cookie cookie = Cookie("dev", devIP);
    cookie.domain = ".dev.api.yoosoul.com";
    cookie.path = "/";
    cookie.expires = DateTime.now()..millisecondsSinceEpoch;
    return cookie;
  }
}
