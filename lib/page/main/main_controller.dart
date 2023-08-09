import 'package:mvc/base/base_controller.dart';
import 'package:route/route/go_navigator.dart';

import 'main_model.dart';

class MainController extends BaseController<MainModel> {
  @override
  MainModel model = MainModel();
}

extension Data on MainController {
  Map<String, String> get routes => model.routes;
}

extension Action on MainController {
  void onItemTap(int index) {
    Go.to(routes.values.elementAt(index));
  }
}

extension Network on MainController {}
