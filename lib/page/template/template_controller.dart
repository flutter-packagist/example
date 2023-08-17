import 'package:mvc/base/base_controller.dart';

import 'template_model.dart';

class TemplateController extends BaseController<TemplateModel> {
  @override
  TemplateModel model = TemplateModel();
}

extension Private on TemplateController {}

extension GetData on TemplateController {}

extension SetData on TemplateController {
  void ss() {
    update(["ss"]);
  }
}

extension Action on TemplateController {}

extension Network on TemplateController {}
