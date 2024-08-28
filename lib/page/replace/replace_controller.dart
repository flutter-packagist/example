import 'package:mvc/base/base_controller.dart';

import 'replace_model.dart';

class ReplaceController extends BaseController<ReplaceModel> {
  @override
  ReplaceModel model = ReplaceModel();
}

extension Private on ReplaceController {}

extension GetData on ReplaceController {}

extension SetData on ReplaceController {}

extension Action on ReplaceController {}

extension Network on ReplaceController {}