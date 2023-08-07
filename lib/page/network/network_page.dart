import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/base/base_page.dart';

import 'network_controller.dart';
import 'network_model.dart';

class NetworkPage extends BasePage<NetworkController, NetworkModel> {
  const NetworkPage({super.key});

  @override
  NetworkController putController() => Get.put(NetworkController());

  @override
  Widget? get appBar => AppBar(
        title: const Text('示例'),
      );

  @override
  Widget get body {
    return Center(
      child: TextButton(
        child: const Text('上传'),
        onPressed: () => controller.pickFile(),
      ),
    );
  }
}
