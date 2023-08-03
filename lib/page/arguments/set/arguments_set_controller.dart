import 'package:example/routes/app_pages.dart';
import 'package:mvc/base/base_controller.dart';
import 'package:route/route.dart';

import 'arguments_set_model.dart';

class ArgumentsSetController extends BaseController<ArgumentsSetModel> {
  @override
  ArgumentsSetModel model = ArgumentsSetModel();
}

extension Data on ArgumentsSetController {
  String get description => model.description;

  Map<String, String> get routes => model.routes;
}

extension Action on ArgumentsSetController {
  void onItemTap(int index) {
    switch (index) {
      case 0:
        Go.push(Routes.argumentsParams, params: model.params);
        break;
      case 1:
        Go.push(Routes.argumentsQuery, queryParams: model.params);
        break;
      case 2:
        Go.push(Routes.argumentsPath, pathParams: model.params);
        break;
      case 3:
        Go.go(Routes.argumentsParams, params: model.params);
        break;
      case 4:
        Go.go(Routes.argumentsQuery, queryParams: model.params);
        break;
      case 5:
        Go.go(Routes.argumentsPath, pathParams: model.params);
        break;
      case 6:
        Go.to(Routes.argumentsParams, params: model.params);
        break;
      case 7:
        Go.to(Routes.argumentsQuery, queryParams: model.params);
        break;
      case 8:
        Go.to(Routes.argumentsPath, pathParams: model.params);
        break;
      case 9:
        Go.pushNamed("namePushParams", params: model.params);
        break;
      case 10:
        Go.pushNamed("namePushQuery", queryParams: model.params);
        break;
      case 11:
        Go.pushNamed("namePushPath", pathParams: model.params);
        break;
      case 12:
        Go.goNamed("nameGoParams", params: model.params);
        break;
      case 13:
        Go.goNamed("nameGoQuery", queryParams: model.params);
        break;
      case 14:
        Go.goNamed("nameGoPath", pathParams: model.params);
        break;
      case 15:
        Go.toNamed("nameGoParams", params: model.params);
        break;
      case 16:
        Go.toNamed("nameGoQuery", queryParams: model.params);
        break;
      case 17:
        Go.toNamed("nameGoPath", pathParams: model.params);
        break;
    }
  }
}
