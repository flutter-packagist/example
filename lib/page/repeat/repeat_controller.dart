import 'package:example/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:log_wrapper/log/log.dart';
import 'package:packagist_mvc/mvc.dart';
import 'package:packagist_route/route.dart';

import 'repeat_model.dart';
import 'repeat_page.dart';

class RepeatController extends BaseController<RepeatModel> {
  @override
  RepeatModel model = RepeatModel();

  @override
  void onInit() {
    super.onInit();
    int count = Go.arguments["count"] ?? 0;
    logW(count);
  }
}

extension Private on RepeatController {}

extension GetData on RepeatController {
  int get count => model.count;

  GlobalKey get ancestorKey => model.ancestorKey;
}

extension SetData on RepeatController {}

extension Action on RepeatController {
  void onCountIncrease() {
    model.count++;
    update();
  }

  void onPushPage() {
    Go.push(Routes.repeat, params: {"count": model.count});
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return RepeatPage();
    // }));
  }
}

extension Network on RepeatController {}
