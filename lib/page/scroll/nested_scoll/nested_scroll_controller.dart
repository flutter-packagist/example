import 'package:packagist_mvc/mvc.dart';

import 'nested_scroll_model.dart';

class NestedScrollController extends BaseController<NestedScrollModel> {
  @override
  NestedScrollModel model = NestedScrollModel();
}

extension Private on NestedScrollController {}

extension GetData on NestedScrollController {}

extension SetData on NestedScrollController {}

extension Action on NestedScrollController {}

extension Network on NestedScrollController {}