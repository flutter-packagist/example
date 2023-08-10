import 'package:drift/drift.dart';
import 'package:example/web/db/db.dart';

import 'todos_table.dart';

part 'database.g.dart';

const dbName = "flutter_db";

@DriftDatabase(tables: [Todos])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(DB.createDatabaseConnection(dbName));

  @override
  int get schemaVersion => 1;
}
