import 'package:example/widget/refresh/refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/base/base_page.dart';

import 'home_controller.dart';
import 'home_model.dart';

class HomePage extends BasePage<HomeController, HomeModel> {
  const HomePage({super.key});

  @override
  HomeController putController() => Get.put(HomeController());

  @override
  Widget get body {
    return WrapperEasyRefresh(
      refreshNotifier: controller.refreshNotifier,
      child: ListView.builder(
        itemCount: controller.routes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(controller.routes.keys.elementAt(index)),
            onTap: () => controller.onItemTap(index),
          );
        },
      ),
    );
  }
}
