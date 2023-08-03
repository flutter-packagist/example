import 'package:example/routes/app_pages.dart';
import 'package:example/widget/refresh/refresh_notifier.dart';
import 'package:get/get.dart';
import 'package:mvc/base/base_model.dart';

class HomeModel extends BaseModel {
  final RefreshNotifier<ItemModel> refreshNotifier =
      RefreshNotifier<ItemModel>();

  Map<String, String> routes = {
    "路由 Navigator 2.0（StatefulShellRoute）: TabBar和TabBarView同步切换，支持滑动页面切换浏览器地址":
        GetPlatform.isWeb ? Routes.tab1 : Routes.tab,
    "路由 Navigator 2.0（StatefulShellRoute）: BottomNavigationBar和PageView同步切换，支持滑动页面切换浏览器地址":
        GetPlatform.isWeb ? Routes.nav1 : Routes.nav,
    "路由参数传递": Routes.arguments,
    "页面调整动画": Routes.transition,
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
