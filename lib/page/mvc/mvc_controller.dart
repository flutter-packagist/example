import 'package:packagist_mvc/mvc.dart';

import 'mvc_model.dart';

class MvcController extends BaseController<MvcModel> {
  @override
  MvcModel model = MvcModel();
}

extension Action on MvcController {}

extension Network on MvcController {}
