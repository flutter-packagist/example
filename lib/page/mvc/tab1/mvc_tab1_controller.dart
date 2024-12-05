import 'package:packagist_mvc/mvc.dart';

import 'mvc_tab1_model.dart';

class MvcTab1Controller extends BaseStatusController<MvcTab1Model> {
  @override
  MvcTab1Model model = MvcTab1Model();

  @override
  void onReady() {
    super.onReady();
    toContent();
  }

  @override
  void onRetry() {
    onStatusSwitch();
  }
}

extension Action on MvcTab1Controller {
  void onStatusSwitch() {
    model.count++;
    if (model.count % 5 == 0) {
      toLoading();
      Future.delayed(const Duration(seconds: 2), () => toContent());
    } else if (model.count % 2 == 0) {
      toLoading();
      Future.delayed(const Duration(seconds: 2), () => toEmpty());
    } else {
      toLoading();
      Future.delayed(const Duration(seconds: 2), () => toError());
    }
  }
}

extension Network on MvcTab1Controller {}
