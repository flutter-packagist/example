import 'package:flutter/material.dart';
import 'package:ll_dropdown_menu/button/text_button.dart';
import 'package:packagist_mvc/mvc.dart';
import 'package:packagist_widgets/widgets.dart';

import 'button_controller.dart';
import 'button_model.dart';

class ButtonPage extends BasePage<ButtonController, ButtonModel> {
  const ButtonPage({super.key});

  @override
  ButtonController get binding => ButtonController();

  @override
  Widget? get appBar => AppBar(
        title: const Text('示例'),
      );

  @override
  Widget get body {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WrapperTextButton(
            onPressed: () {},
            text: 'Button',
            backgroundColor: Colors.blue,
          ),
          const SizedBox(height: 10),
          WrapperButton(
            onPressed: () {},
            text: 'Button',
            backgroundColor: Colors.blue,
          ),
          const SizedBox(height: 10),
          WrapperTextButton(
            onPressed: () {},
            text: '复制',
            backgroundColor: Colors.greenAccent,
          ),
          const SizedBox(height: 10),
          WrapperButton(
            onPressed: () {},
            text: '复制',
            backgroundColor: Colors.greenAccent,
          ),
          const SizedBox(height: 10),
          WrapperTextButton(
            onPressed: () {},
            text: 'Button',
            height: 30,
            width: 60,
            backgroundColor: Colors.orange,
          ),
          const SizedBox(height: 10),
          WrapperButton(
            onPressed: () {},
            text: 'Button',
            height: 30,
            width: 60,
            backgroundColor: Colors.orange,
          ),
          const SizedBox(height: 10),
          WrapperTextButton(
            onPressed: () {},
            text: '复制',
            height: 30,
            width: 60,
            backgroundColor: Colors.amberAccent,
            padding: EdgeInsets.zero,
          ),
          const SizedBox(height: 10),
          WrapperButton(
            onPressed: () {},
            text: '复制',
            height: 30,
            width: 60,
            backgroundColor: Colors.amberAccent,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WrapperTextButton(
                onPressed: () {},
                text: '复制',
                textStyle: TextStyle(color: Colors.white, fontSize: 16),
                icon: Icon(Icons.copy, color: Colors.white, size: 14),
                height: 40,
                width: 100,
                backgroundColor: Colors.deepPurpleAccent,
                padding: EdgeInsets.zero,
                radius: 10,
              ),
              const SizedBox(width: 10),
              WrapperButton(
                onPressed: () {},
                text: '复制',
                textStyle: TextStyle(color: Colors.white, fontSize: 16),
                icon: Icon(Icons.copy, color: Colors.white, size: 14),
                height: 40,
                width: 100,
                backgroundColor: Colors.deepPurpleAccent,
                radius: 10,
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
