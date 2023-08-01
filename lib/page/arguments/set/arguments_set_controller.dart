import 'package:example/routes/app_pages.dart';
import 'package:mvc/base/base_controller.dart';
import 'package:route/route.dart';

import 'arguments_set_model.dart';

class ArgumentsSetController extends BaseController<ArgumentsSetModel> {
  @override
  ArgumentsSetModel model = ArgumentsSetModel();
}

extension Action on ArgumentsSetController {
  void onPushQueryParamsBtnTap() {
    Go.push(
      Routes.argumentsQuery,
      queryParams: {'title': '标题', 'url': '链接'},
    );
  }

  void onPushPathParamsBtnTap() {
    Go.push(
      Routes.argumentsPath,
      queryParams: {'title': '标题', 'url': '链接'},
    );
  }

  void onGoQueryParamsBtnTap() {
    Go.go(
      Routes.argumentsQuery,
      queryParams: {'title': '标题', 'url': '链接'},
    );
  }

  void onGoPathParamsBtnTap() {
    Go.go(
      Routes.argumentsPath,
      pathParams: {'title': '标题', 'url': '链接'},
    );
  }

  void onToQueryParamsBtnTap() {
    Go.to(
      Routes.argumentsQuery,
      queryParams: {'title': '标题', 'url': '链接'},
    );
  }

  void onToPathParamsBtnTap() {
    Go.to(
      Routes.argumentsPath,
      pathParams: {'title': '标题', 'url': '链接'},
    );
  }

  void onPushNameQueryParamsBtnTap() {
    Go.pushNamed(
      "namePushQuery",
      queryParams: {'title': '标题', 'url': '链接'},
    );
  }

  void onPushNamePathParamsBtnTap() {
    Go.pushNamed(
      "namePushPath",
      pathParams: {'title': '标题', 'url': '链接'},
    );
  }

  void onGoNameQueryParamsBtnTap() {
    Go.goNamed(
      "nameGoQuery",
      queryParams: {'title': '标题', 'url': '链接'},
    );
  }

  void onGoNamePathParamsBtnTap() {
    Go.goNamed(
      "nameGoPath",
      pathParams: {'title': '标题', 'url': '链接'},
    );
  }

  void onToNameQueryParamsBtnTap() {
    Go.toNamed(
      "nameGoQuery",
      queryParams: {'title': '标题', 'url': '链接'},
    );
  }

  void onToNamePathParamsBtnTap() {
    Go.toNamed(
      "nameGoPath",
      pathParams: {'title': '标题', 'url': '链接'},
    );
  }
}
