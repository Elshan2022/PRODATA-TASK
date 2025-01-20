import 'package:flutter_prodata_task/core/cache/database/app_database.dart';

class DatabaseInstance {
  static DatabaseInstance? _databaseInstance;

  late AppDatabase appDatabase;

  DatabaseInstance._() {
    appDatabase = AppDatabase();
  }

  static DatabaseInstance get instance {
    _databaseInstance ??= DatabaseInstance._();

    return _databaseInstance!;
  }
}
