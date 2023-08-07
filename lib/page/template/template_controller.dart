import 'package:mvc/base/base_controller.dart';

import 'template_model.dart';

class TemplateController extends BaseController<TemplateModel> {
  @override
  TemplateModel model = TemplateModel();
}

extension Data on TemplateController {}

extension Action on TemplateController {}

extension Network on TemplateController {}
