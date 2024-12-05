import 'package:flutter/material.dart';
import 'package:packagist_mvc/mvc.dart';

import 'detail_controller.dart';
import 'detail_model.dart';

class DetailPage extends BasePage<DetailController, DetailModel> {
  final String title;

  const DetailPage(this.title, {super.key});

  @override
  DetailController get binding => DetailController();

  @override
  Widget get body {
    return Center(
      child: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
