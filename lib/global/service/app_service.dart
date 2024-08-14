import 'package:example/global/config/constants.dart';
import 'package:example/global/config/env_config.dart';
import 'package:extensions/cache_extension.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get.dart';
import 'package:log_wrapper/log/log.dart';
import 'package:network/network.dart';

class AppService {
  static Future<void> init() async {
    /// 初始化SharePreference
    await SharedPreferencesInstance.init();

    /// Getx 配置
    Get.config(
      enableLog: debugMode,
      logWriterCallback: getxLogWriter,
    );

    /// 设置路由路径为非 #
    usePathUrlStrategy();

    /// 初始化网络请求
    HttpRequest().init(HttpRequestSetting(baseUrl: EnvConfig.host));
    HttpRequest().client?.interceptors.addAll([
      RetryInterceptor(dio: HttpRequest().client!),
      LogInterceptor(),
      CancelInterceptor(),
    ]);
  }
}

void getxLogWriter(String text, {bool isError = false}) {
  // 在这里把信息传递给你最喜欢的日志包。
  // 请注意，即使enableLog: false，日志信息也会在这个回调中被推送。
  // 如果你想的话，可以通过GetConfig.isLogEnable来检查这个标志。
  if (!debugMode) return;
  if (!EnvConfig.switchGetXLog) return;
  if (isError) {
    logE(text);
  } else {
    logV(text);
  }
}
