import 'package:mvc/base/base_controller.dart';
import 'package:route/route/go_navigator.dart';

import 'transition_model.dart';

class TransitionController extends BaseController<TransitionModel> {
  @override
  TransitionModel model = TransitionModel();
}

extension Data on TransitionController {
  Map<String, String> get routes => model.routes;
}

extension Action on TransitionController {
  void onItemTap(int index) {
    Go.to(routes.values.elementAt(index));
  }
}
