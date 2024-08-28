import 'package:example/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:log_wrapper/log/log.dart';
import 'package:mvc/base/base_page.dart';
import 'package:route/route.dart';

import 'replace_controller.dart';
import 'replace_model.dart';

class ReplacePage extends BasePage<ReplaceController, ReplaceModel> {
  const ReplacePage({super.key});

  @override
  ReplaceController get binding => ReplaceController();

  @override
  Widget? get appBar => AppBar(
        title: const Text('示例'),
      );

  @override
  Widget get body {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              logW("arguments: ${Go.routing.toString()}");
            },
            child: const Text('参数'),
          ),
          TextButton(
            onPressed: () {
              Go.pushReplacement(Routes.replace, extra: {"id": 222});
            },
            child: const Text('跳转'),
          ),
          TextButton(
            onPressed: () {
              Go.pushReplacement(Routes.main, extra: {"id": 111});
            },
            child: const Text('main'),
          ),
        ],
      ),
    );
  }
}