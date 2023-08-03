import 'package:example/routes/app_pages.dart';
import 'package:example/widget/refresh/refresh_notifier.dart';
import 'package:get/get.dart';
import 'package:mvc/base/base_model.dart';

class MainModel extends BaseModel {
  final RefreshNotifier<ItemModel> refreshNotifier =
      RefreshNotifier<ItemModel>();

  Map<String, String> routes = {
    "路由 Navigator 2.0（StatefulShellRoute）: TabBar和TabBarView同步切换，支持滑动页面切换浏览器地址":
        GetPlatform.isWeb ? Routes.tab1 : Routes.tab,
    "路由 Navigator 2.0（StatefulShellRoute）: BottomNavigationBar和PageView同步切换，支持滑动页面切换浏览器地址":
        GetPlatform.isWeb ? Routes.page1 : Routes.page,
    "路由 Navigator 2.0（StatefulShellRoute.indexedStack）: BottomNavigationBar驱动IndexedStack内部页面切换":
        GetPlatform.isWeb ? Routes.stack1 : Routes.stack,
    "路由 Navigator 2.0（ShellRoute）: 匹配路由路径切换":
        GetPlatform.isWeb ? Routes.shell1 : Routes.shell,
    "路由参数传递": Routes.arguments,
    "页面调整动画": Routes.transition,
    "页面路由监听": Routes.dialog,
    "路由拦截和重定向": Routes.redirect,
  };
}

class ItemModel {
  String title;
  String subTitle;
  String route;

  ItemModel(this.title, this.subTitle, this.route);

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      json['title'],
      json['subTitle'],
      json['route'],
    );
  }
}