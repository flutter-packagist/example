import 'package:drift/drift.dart';

class DBInterface {
  static QueryExecutor createDatabaseConnection(String databaseName) =>
      throw UnsupportedError(
          'Cannot create a client without dart:html or dart:io');
}
