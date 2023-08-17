import 'package:example/routes/app_pages.dart';
import 'package:mvc/base/base_controller.dart';
import 'package:route/route/go_navigator.dart';

import 'repeat_model.dart';

class RepeatController extends BaseController<RepeatModel> {
  @override
  RepeatModel model = RepeatModel();
}

extension Private on RepeatController {}

extension GetData on RepeatController {
  int get count => model.count;
}

extension SetData on RepeatController {}

extension Action on RepeatController {
  void onCountIncrease() {
    model.count++;
    update();
  }

  void onPushPage() {
    Go.push(Routes.repeat);
  }
}

extension Network on RepeatController {}
