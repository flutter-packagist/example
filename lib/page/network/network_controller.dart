import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide MultipartFile;
import 'package:log_wrapper/log/log.dart';
import 'package:mvc/base/base_controller.dart';
import 'package:network/network.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path_provider/path_provider.dart';

import 'network_model.dart';

class NetworkController extends BaseController<NetworkModel> {
  @override
  NetworkModel model = NetworkModel();

  @override
  void onReady() async {
    super.onReady();
    get();
    get2();
  }

  @override
  void onClose() {
    // 取消当前控制器绑定的网络请求
    CancelTokenPool().cancel(this);
    super.onClose();
  }
}

extension Data on NetworkController {}

extension Action on NetworkController {
  Future pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result?.files.single.path != null) {
      if (GetPlatform.isWeb) {
        Uint8List? fileBytes = result!.files.first.bytes;
        String fileName = result.files.first.name;
      } else {
        File file = File(result!.files.single.path!);
        upload(file.path);
      }
    } else {
      // User canceled the picker
    }
  }
}

extension Network on NetworkController {
  /// 网络请求绑定当前控制器，当控制器销毁时，会自动取消网络请求
  Future get() async {
    await Future.delayed(const Duration(milliseconds: 200), () {});
    await HttpRequest().get(
      'https://pub.dev',
      onSuccess: (data) {
        showToast("请求成功");
      },
      onFailed: (code, DioException? error) {
        logE('code: $code, msg: $error');
      },
      bind: this, // 绑定当前控制器
    );
  }

  /// 网络请求未绑定当前控制器，当控制器销毁时，不会自动取消网络请求
  Future get2() async {
    await Future.delayed(const Duration(milliseconds: 200), () {});
    await HttpRequest().get(
      'https://pub.dev',
      onSuccess: (data) {
        showToast("请求成功2");
      },
      onFailed: (code, DioException? error) {
        logE('code: $code, msg: $error');
      },
    );
  }

  Future upload(String file) async {
    await HttpRequest().post(
      'https://tinify.cn/backend/opt/shrink',
      formData: {
        'url': await MultipartFile.fromFile(
          file,
          filename: 'upload.png',
        ),
      },
      onSuccess: (data) {},
      onFailed: (code, msg) {},
    );
  }

  Future download() async {
    await HttpRequest().download(
      'https://cp4.100.com.tw/images/works/202306/09/api_1904411_1686304395_OTYuIIucc2.jpg!8887t1500-v4.jpg',
      '${(await getTemporaryDirectory()).path}pub.html',
      onReceiveProgress: (count, total) {},
      onSuccess: (data) {},
      onFailed: (code, msg) {},
    );
  }
}
