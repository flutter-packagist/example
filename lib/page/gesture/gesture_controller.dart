import 'package:packagist_mvc/mvc.dart';

import 'gesture_model.dart';

class GestureController extends BaseController<GestureModel> {
  @override
  GestureModel model = GestureModel();
}

extension Data on GestureController {}

extension Action on GestureController {
  void onTap() {
    model.count++;
    update();
  }

  Future onTapDelay() async {
    await Future.delayed(const Duration(seconds: 1));
    model.count++;
    update();
  }
}
