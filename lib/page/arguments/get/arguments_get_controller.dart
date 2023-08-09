import 'package:mvc/base/base_controller.dart';
import 'package:route/route.dart';

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
