import 'package:flutter/material.dart';
import 'package:packagist_route/route.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('路由监听'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Go.dialog(
                  AlertDialog(
                    title: const Text('Dialog'),
                    content: const Text('This is a dialog.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Go.back(),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Show Dialog'),
            ),
            TextButton(
              onPressed: () {
                Go.bottomSheet(
                  AlertDialog(
                    title: const Text('bottomSheet'),
                    content: const Text('This is a dialog.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Go.back(),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Show bottomSheet'),
            ),
          ],
        ),
      ),
    );
  }
}
