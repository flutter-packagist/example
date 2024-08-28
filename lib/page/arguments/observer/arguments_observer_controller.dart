import 'package:mvc/base/base_controller.dart';

import 'arguments_observer_model.dart';

class ArgumentsObserverController extends BaseController<ArgumentsObserverModel> {
  @override
  ArgumentsObserverModel model = ArgumentsObserverModel();
}

extension Private on ArgumentsObserverController {}

extension GetData on ArgumentsObserverController {}

extension SetData on ArgumentsObserverController {}

extension Action on ArgumentsObserverController {}

extension Network on ArgumentsObserverController {}