import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/base/base_page.dart';

import 'detail_controller.dart';
import 'detail_model.dart';

class DetailPage extends BasePage<DetailController, DetailModel> {
  const DetailPage({super.key});

  @override
  DetailController putController() => Get.put(DetailController());

  @override
  Widget get body {
    return const Center(
      child: Text(
        'DetailPage',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
