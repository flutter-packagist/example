import 'package:packagist_mvc/mvc.dart';
import 'package:packagist_route/route.dart';

import 'arguments_get_model.dart';

class ArgumentsGetController extends BaseController<ArgumentsGetModel> {
  @override
  ArgumentsGetModel model = ArgumentsGetModel();

  @override
  void onReady() {
    super.onReady();
    model.title = Go.arguments['title'] ?? "null";
    model.url = Go.arguments['url'] ?? "null";
    update();
  }
}
