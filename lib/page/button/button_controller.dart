import 'package:packagist_mvc/mvc.dart';

import 'button_model.dart';

class ButtonController extends BaseController<ButtonModel> {
  @override
  ButtonModel model = ButtonModel();
}

extension Private on ButtonController {}

extension GetData on ButtonController {}

extension SetData on ButtonController {}

extension Action on ButtonController {}

extension Network on ButtonController {}