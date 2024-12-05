import 'package:log_wrapper/log/log.dart';
import 'package:packagist_mvc/mvc.dart';
import 'package:packagist_network/network.dart';
import 'package:packagist_widgets/widgets.dart';

import 'refresh_model.dart';

class RefreshController extends BaseController<RefreshModel> {
  @override
  RefreshModel model = RefreshModel();

  @override
  void onReady() {
    super.onReady();
    setupRefresh();
  }
}

extension Data on RefreshController {
  RefreshNotifier get refreshNotifier => model.refreshNotifier;
}

extension Action on RefreshController {}

extension Network on RefreshController {
  Future<void> setupRefresh() async {
    refreshNotifier.setup(
      requestUrl: "list",
      requestParams: {
        "limit": "10",
      },
      pageSize: 10,
      jsonParse: (json) =>
          asList(json, "data").map((e) => ItemModel.fromJson(e)).toList(),
      onBegin: (loadMore) {},
      onSuccess: (data, loadMore) {
        logW(data);
        update();
      },
      onFailed: (code, error, loadMore) {},
    );
    await refreshNotifier.refresh();
  }
}
