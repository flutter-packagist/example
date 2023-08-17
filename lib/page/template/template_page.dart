import 'package:flutter/material.dart';
import 'package:mvc/base/base_page.dart';

import 'template_controller.dart';
import 'template_model.dart';

class TemplatePage extends BasePage<TemplateController, TemplateModel> {
  const TemplatePage({super.key});

  @override
  TemplateController get binding => TemplateController();

  @override
  Widget? get appBar => AppBar(
        title: const Text('示例'),
      );

  @override
  Widget get body {
    return Center();
  }
}
