import 'package:packagist_mvc/mvc.dart';
import 'package:packagist_network/network.dart';
import 'package:packagist_widgets/widgets.dart';

class RefreshModel extends BaseModel {
  final RefreshNotifier<ItemModel> refreshNotifier =
      RefreshNotifier<ItemModel>();
}

class ItemModel {
  String title;
  String subTitle;
  String route;

  ItemModel(this.title, this.subTitle, this.route);

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        asString(json, 'title'),
        asString(json, 'title'),
        asString(json, 'title'),
      );
}
