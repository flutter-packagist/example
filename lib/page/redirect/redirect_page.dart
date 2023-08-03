import 'package:flutter/material.dart';

class RedirectPage extends StatelessWidget {
  const RedirectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('路由拦截和重定向'),
      ),
      body: const Center(
        child: Text('可用于拦截并跳转到登录页，详见 app_pages.dart 文件的 redirect 回调方法，在浏览器地址栏输入 /login 可跳转到 /redirect'),
      ),
    );
  }
}
