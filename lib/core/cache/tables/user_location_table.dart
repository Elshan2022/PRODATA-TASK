import 'package:drift/drift.dart';

class UserLocation extends Table {
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
}
