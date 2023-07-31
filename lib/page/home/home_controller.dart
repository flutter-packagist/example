import 'package:dio/dio.dart';
import 'package:mvc/base/base_controller.dart';
import 'package:network/request/http_request.dart';
import 'package:path_provider/path_provider.dart';
import 'package:route/route/go_navigator.dart';

import 'home_model.dart';

class HomeController extends BaseController<HomeModel> {
  @override
  HomeModel model = HomeModel();
}

extension Data on HomeController {
  Map<String, String> get routes => model.routes;
}

extension Action on HomeController {
  void onItemTap(int index) {
    Go.go(routes.values.elementAt(index));
  }
}

extension Network on HomeController {
  Future get() async {
    await HttpRequest().get(
      'https://www.baidu.com',
      onSuccess: (data) {},
      onFailed: (code, msg) {},
    );
  }

  Future upload() async {
    await HttpRequest().post(
      'https://www.baidu.com',
      formData: {
        'name': 'dio',
        'date': DateTime.now().toIso8601String(),
        'file': await MultipartFile.fromFile(
          './text.txt',
          filename: 'upload.txt',
        ),
      },
      onSuccess: (data) {},
      onFailed: (code, msg) {},
    );
  }

  Future download() async {
    await HttpRequest().download(
      'https://www.baidu.com',
      '${(await getTemporaryDirectory()).path}pub.html',
      onReceiveProgress: (count, total) {},
      onSuccess: (data) {},
      onFailed: (code, msg) {},
    );
  }
}
