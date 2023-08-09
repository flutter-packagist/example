import 'package:mvc/base/base_model.dart';
import 'package:network/network.dart';
import 'package:widgets/widgets.dart';

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
