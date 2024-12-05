import 'package:example/routes/app_pages.dart';
import 'package:packagist_mvc/mvc.dart';
import 'package:packagist_route/route.dart';

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
    if (routes.values.elementAt(index) == Routes.replace) {
      Go.pushReplacement(Routes.replace);
      return;
    }
    Go.to(routes.values.elementAt(index));
  }
}

extension Network on MainController {}
