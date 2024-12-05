import 'package:packagist_mvc/mvc.dart';
import 'package:packagist_route/route.dart';

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
