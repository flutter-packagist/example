import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:log_wrapper/log/log.dart';
import 'package:mvc/base/base_page.dart';
import 'package:widgets/widgets.dart';

import 'refresh_controller.dart';
import 'refresh_model.dart';

class RefreshPage extends BasePage<RefreshController, RefreshModel> {
  const RefreshPage({super.key});

  @override
  RefreshController putController() => Get.put(RefreshController());

  @override
  Widget? get appBar => AppBar(
        title: const Text('下拉刷新和上拉加载更多'),
      );

  @override
  Widget get body {
    logW(controller.refreshNotifier.listSize);
    return WrapperEasyRefresh(
      refreshNotifier: controller.refreshNotifier,
      child: ListView.builder(
        itemCount: controller.refreshNotifier.listSize,
        itemBuilder: (context, index) {
          var itemData = controller.refreshNotifier.listData[index];
          return ListTile(
            tileColor: index % 2 == 0 ? Colors.white : Colors.grey[200],
            title: Text("当前Item序号： ${itemData.title}\n"
                "当前Item序号： ${itemData.title}\n"
                "当前Item序号： ${itemData.title}\n"
                "当前Item序号： ${itemData.title}"),
          );
        },
      ),
    );
  }
}
