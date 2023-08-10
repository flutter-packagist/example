import 'package:drift/drift.dart';
import 'package:drift/web/worker.dart';
import 'package:flutter/foundation.dart';

class DBInterface {
  static QueryExecutor createDatabaseConnection(String databaseName) {
    return DatabaseConnection.delayed(connectToDriftWorker(
        kReleaseMode ? 'worker.dart.min.js' : 'worker.dart.js',
        mode: DriftWorkerMode.shared));
  }
}
