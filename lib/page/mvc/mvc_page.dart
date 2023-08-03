import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/base/base_page.dart';

import 'mvc_controller.dart';
import 'mvc_model.dart';
import 'tab1/mvc_tab1_page.dart';
import 'tab2/mvc_tab2_page.dart';

class MvcPage extends BasePage<MvcController, MvcModel> {
  const MvcPage({super.key});

  @override
  MvcController putController() => Get.put(MvcController());

  @override
  Color get backgroundColor => Colors.white;

  @override
  Widget? get appBar => AppBar(
        title: const Text('MVC TabController使用示例'),
      );

  @override
  Widget get body {
    return Column(children: [
      TabBar(
        controller: model.tabController,
        onTap: (int index) {
          model.tabController.animateTo(index);
        },
        tabs: const [
          Tab(text: 'BaseStatusPage使用方式'),
          Tab(text: 'KeepAliveState以及局部刷新'),
        ],
        labelColor: Colors.black,
      ),
      Expanded(
        child: TabBarView(
          controller: model.tabController,
          children: const [
            MvcTab1Page(),
            MvcTab2Page(),
          ],
        ),
      ),
    ]);
  }

  @override
  State<BasePage> createState() => TabControllerState<MvcPage, MvcController>();

  @override
  void initTabController(TickerProvider vsync) {
    model.tabController = TabController(length: 2, vsync: vsync);
  }
}
