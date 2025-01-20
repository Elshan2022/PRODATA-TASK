import 'package:drift/drift.dart';
import 'package:flutter_prodata_task/core/initilaize/database_instance.dart';

abstract class IBaseCache {
  Future<void> addItem(TableInfo table, Insertable insertable);
  Future<List<dynamic>> getItem(TableInfo table);
  Future<void> deleteItem(TableInfo table);
}

class BaseCache extends IBaseCache {
  @override
  Future<void> addItem(TableInfo table, Insertable insertable) async {
    await DatabaseInstance.instance.appDatabase.into(table).insert(insertable);
  }

  @override
  Future<void> deleteItem(TableInfo table) async {
    await DatabaseInstance.instance.appDatabase.delete(table).go();
  }

  @override
  Future<List<dynamic>> getItem(TableInfo table) async {
    final result =
        await DatabaseInstance.instance.appDatabase.select(table).get();

    return result;
  }
}
