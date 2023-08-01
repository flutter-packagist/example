import 'package:example/routes/app_pages.dart';
import 'package:example/widget/refresh/refresh_notifier.dart';
import 'package:get/get.dart';
import 'package:mvc/base/base_model.dart';

class HomeModel extends BaseModel {
  final RefreshNotifier<ItemModel> refreshNotifier =
      RefreshNotifier<ItemModel>();

  Map<String, String> routes = {
    "路由 Navigator 2.0": GetPlatform.isWeb ? Routes.tab1 : Routes.tab,
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
