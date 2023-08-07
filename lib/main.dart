import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:log_wrapper/log/log.dart';
import 'package:oktoast/oktoast.dart';

import 'global/service/app_service.dart';
import 'routes/app_pages.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppService.init();
    runApp(const MyApp());
    setupSystemChrome();
  }, (Object error, StackTrace stack) {
    logStackE("$error", error, stack);
  });
}

void setupSystemChrome() {
  if (!GetPlatform.isMobile) return;
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarDividerColor: null,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Demo",
      routerConfig: AppPages.router,
      builder: (context, widget) {
        return OKToast(child: widget!);
      },
    );
  }
}
