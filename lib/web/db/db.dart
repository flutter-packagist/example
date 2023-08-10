import 'package:drift/drift.dart';

import 'db_stub.dart'
    if (dart.library.io) 'db_native.dart'
    if (dart.library.html) 'db_web.dart';

class DB {
  static QueryExecutor createDatabaseConnection(String databaseName) =>
      DBInterface.createDatabaseConnection(databaseName);
}
