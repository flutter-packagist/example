import 'package:flutter/material.dart';
import 'package:packagist_mvc/mvc.dart';

import 'transition_next_controller.dart';
import 'transition_next_model.dart';

class TransitionNextPage
    extends BasePage<TransitionNextController, TransitionNextModel> {
  const TransitionNextPage({super.key});

  @override
  TransitionNextController get binding => TransitionNextController();

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
