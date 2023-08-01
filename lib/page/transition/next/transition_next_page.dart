import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/base/base_page.dart';

import 'transition_next_controller.dart';
import 'transition_next_model.dart';

class TransitionNextPage extends BasePage<TransitionNextController, TransitionNextModel> {
  const TransitionNextPage({super.key});

  @override
  TransitionNextController putController() => Get.put(TransitionNextController());

  @override
  Widget? get appBar => AppBar(
        title: const Text('TransitionNextPage'),
      );

  @override
  Widget get body {
    return const Center(
      child: Text(
        'TransitionNextPage',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
