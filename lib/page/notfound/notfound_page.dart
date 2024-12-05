import 'package:flutter/material.dart';
import 'package:packagist_route/route.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('404 页面'),
      ),
      body: Center(
        child: Text('无法找到该页面: ${Go.arguments}，请检查您的路由配置是否正确!\n'
            '配置方式：详见 app_pages.dart 文件的 redirect 回调方法'),
      ),
    );
  }
}
