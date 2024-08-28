import 'package:example/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:log_wrapper/log/log.dart';
import 'package:mvc/base/base_page.dart';
import 'package:route/route.dart';

import 'arguments_observer_controller.dart';
import 'arguments_observer_model.dart';

class ArgumentsObserverPage
    extends BasePage<ArgumentsObserverController, ArgumentsObserverModel> {
  const ArgumentsObserverPage({super.key});

  @override
  ArgumentsObserverController get binding => ArgumentsObserverController();

  @override
  Widget? get appBar => AppBar(
        title: const Text('示例'),
      );

  @override
  Widget get body {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              logW("arguments: ${Go.routing.toString()}");
            },
            child: const Text('参数'),
          ),
          TextButton(
            onPressed: () {
              Go.to(
                "${Routes.argumentsObserver}/1",
                params: {"id": 1},
              );
            },
            child: const Text('跳转'),
          ),
        ],
      ),
    );
  }
}

class ArgumentsObserverPage1 extends StatelessWidget {
  const ArgumentsObserverPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                logW("arguments: ${Go.routing.toString()}");
              },
              child: const Text('参数1'),
            ),
            TextButton(
              onPressed: () {
                Go.to(
                  "${Routes.argumentsObserver}/2",
                  params: {"id": 1000},
                );
              },
              child: const Text('跳转1'),
            ),
          ],
        ),
      ),
    );
  }
}

class ArgumentsObserverPage2 extends StatelessWidget {
  const ArgumentsObserverPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                logW("arguments: ${Go.routing.toString()}");
              },
              child: const Text('参数2'),
            ),
            TextButton(
              onPressed: () {
                Go.back();
              },
              child: const Text('返回2'),
            ),
            TextButton(
              onPressed: () {
                Go.pushReplacement(
                  "${Routes.argumentsObserver}/2",
                  extra: {"id": 2000},
                );
              },
              child: const Text('替换2'),
            ),
          ],
        ),
      ),
    );
  }
}
