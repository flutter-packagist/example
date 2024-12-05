import 'dart:io';

import 'package:example/cache/sp/sp_params.dart';
import 'package:packagist_extensions/extensions.dart';

import 'constants.dart';

class EnvConfig {
  /// 当前环境是否为测试环境
  static bool get debug => env != 1;

  /// 当前环境 1: release 2: debug 3: dev
  static int get env {
    int env = SpParams.env.getInt();
    if (env == 0) return envMode;
    return env;
  }

  /// 接口host
  static String get host {
    // return 'http://192.168.2.9:8080/';
    return "http://localhost:8080/";
  }

  /// 网络请求日志打印
  static bool get switchNetworkLog =>
      SpParams.switchNetworkLog.getBool(defaultValue: logNetwork);

  /// 本地log日志打印
  static bool get switchLocalLog =>
      SpParams.switchLocalLog.getBool(defaultValue: logLocal);

  /// GetX日志打印
  static bool get switchGetXLog =>
      SpParams.switchGetXLog.getBool(defaultValue: logGetX);

  /// 请求时长日志打印
  static bool get switchDurationLog =>
      SpParams.switchDurationLog.getBool(defaultValue: logDuration);

  /// 是否展示log
  static bool get switchShowLog =>
      SpParams.switchShowLog.getBool(defaultValue: showLog);

  /// DEV IP
  static String get devIP => SpParams.envDevIp.getString(defaultValue: devIp);

  /// dev 环境 服务器指向cookie
  static Cookie get devCookie {
    Cookie cookie = Cookie("dev", devIP);
    cookie.domain = ".dev.api.yoosoul.com";
    cookie.path = "/";
    cookie.expires = DateTime.now()..millisecondsSinceEpoch;
    return cookie;
  }
}
