import 'package:drift/drift.dart';
import 'package:example/cache/db/database.dart';
import 'package:example/cache/db/db_instance.dart';
import 'package:packagist_mvc/mvc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:packagist_route/route.dart';
import 'package:url_launcher/url_launcher.dart';

import 'database_model.dart';

class DatabaseController extends BaseController<DatabaseModel> {
  @override
  DatabaseModel model = DatabaseModel();
}

extension Data on DatabaseController {
  String get description => model.description;

  Map<String, Function> get routes {
    return {
      "insert操作": insertAction,
      "select操作": selectAction,
      "update操作": updateAction,
      "delete操作": deleteAction,
    };
  }
}

extension Action on DatabaseController {
  void onLinkTap() async {
    Uri uri = Uri.parse("https://drift.simonbinder.eu/docs/getting-started/");
    if (!await launchUrl(uri)) {
      Go.snackbar('Could not launch', "$uri");
    }
  }

  void insertAction() {
    database
        .into(database.todos)
        .insert(TodosCompanion.insert(title: "title long", content: "content"))
        .then((value) => showToast("插入成功: $value"));
  }

  void selectAction() {
    database
        .select(database.todos)
        .get()
        .then((value) => showToast("查询成功: $value"));
  }

  void updateAction() {
    (database.update(database.todos)..where((row) => row.id.equals(1)))
        .write(const TodosCompanion(title: Value("title 11")))
        .then((value) => showToast("更新成功: $value"));
  }

  void deleteAction() {
    (database.delete(database.todos)..where((t) => t.id.isSmallerThanValue(3)))
        .go()
        .then((value) => showToast("删除成功: $value"));
  }
}
