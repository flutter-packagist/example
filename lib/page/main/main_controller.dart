import 'package:example/widget/refresh/refresh_notifier.dart';
import 'package:mvc/base/base_controller.dart';
import 'package:network/network.dart';
import 'package:route/route/go_navigator.dart';

import 'main_model.dart';

class MainController extends BaseController<MainModel> {
  @override
  MainModel model = MainModel();
}

extension Data on MainController {
  Map<String, String> get routes => model.routes;

  RefreshNotifier get refreshNotifier => model.refreshNotifier;
}

extension Action on MainController {
  void onItemTap(int index) {
    Go.to(routes.values.elementAt(index));
  }
}

extension Network on MainController {
  Future<void> setupRefresh() async {
    refreshNotifier.setup(
      requestUrl: "https://www.baidu.com",
      requestParams: {
        "sourceType": "article",
      },
      pageSize: 10,
      jsonParse: (json) =>
          asList(json, "data").map((e) => ItemModel.fromJson(e)).toList(),
      onBegin: (loadMore) {},
      onSuccess: (data, loadMore) {},
      onFailed: (code, error, loadMore) {},
    );
    await refreshNotifier.refresh();
  }
}
