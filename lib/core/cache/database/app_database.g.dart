// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserLocationTable extends UserLocation
    with TableInfo<$UserLocationTable, UserLocationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserLocationTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [latitude, longitude];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_location';
  @override
  VerificationContext validateIntegrity(Insertable<UserLocationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserLocationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserLocationData(
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude'])!,
    );
  }

  @override
  $UserLocationTable createAlias(String alias) {
    return $UserLocationTable(attachedDatabase, alias);
  }
}

class UserLocationData extends DataClass
    implements Insertable<UserLocationData> {
  final double latitude;
  final double longitude;
  const UserLocationData({required this.latitude, required this.longitude});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    return map;
  }

  UserLocationCompanion toCompanion(bool nullToAbsent) {
    return UserLocationCompanion(
      latitude: Value(latitude),
      longitude: Value(longitude),
    );
  }

  factory UserLocationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserLocationData(
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
    };
  }

  UserLocationData copyWith({double? latitude, double? longitude}) =>
      UserLocationData(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );
  UserLocationData copyWithCompanion(UserLocationCompanion data) {
    return UserLocationData(
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserLocationData(')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(latitude, longitude);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserLocationData &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude);
}

class UserLocationCompanion extends UpdateCompanion<UserLocationData> {
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<int> rowid;
  const UserLocationCompanion({
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserLocationCompanion.insert({
    required double latitude,
    required double longitude,
    this.rowid = const Value.absent(),
  })  : latitude = Value(latitude),
        longitude = Value(longitude);
  static Insertable<UserLocationData> custom({
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserLocationCompanion copyWith(
      {Value<double>? latitude, Value<double>? longitude, Value<int>? rowid}) {
    return UserLocationCompanion(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserLocationCompanion(')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserLocationTable userLocation = $UserLocationTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userLocation];
}

typedef $$UserLocationTableCreateCompanionBuilder = UserLocationCompanion
    Function({
  required double latitude,
  required double longitude,
  Value<int> rowid,
});
typedef $$UserLocationTableUpdateCompanionBuilder = UserLocationCompanion
    Function({
  Value<double> latitude,
  Value<double> longitude,
  Value<int> rowid,
});

class $$UserLocationTableFilterComposer
    extends Composer<_$AppDatabase, $UserLocationTable> {
  $$UserLocationTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnFilters(column));
}

class $$UserLocationTableOrderingComposer
    extends Composer<_$AppDatabase, $UserLocationTable> {
  $$UserLocationTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<double> get latitude => $composableBuilder(
      column: $table.latitude, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get longitude => $composableBuilder(
      column: $table.longitude, builder: (column) => ColumnOrderings(column));
}

class $$UserLocationTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserLocationTable> {
  $$UserLocationTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);
}

class $$UserLocationTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserLocationTable,
    UserLocationData,
    $$UserLocationTableFilterComposer,
    $$UserLocationTableOrderingComposer,
    $$UserLocationTableAnnotationComposer,
    $$UserLocationTableCreateCompanionBuilder,
    $$UserLocationTableUpdateCompanionBuilder,
    (
      UserLocationData,
      BaseReferences<_$AppDatabase, $UserLocationTable, UserLocationData>
    ),
    UserLocationData,
    PrefetchHooks Function()> {
  $$UserLocationTableTableManager(_$AppDatabase db, $UserLocationTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserLocationTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserLocationTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserLocationTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<double> latitude = const Value.absent(),
            Value<double> longitude = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserLocationCompanion(
            latitude: latitude,
            longitude: longitude,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required double latitude,
            required double longitude,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserLocationCompanion.insert(
            latitude: latitude,
            longitude: longitude,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserLocationTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserLocationTable,
    UserLocationData,
    $$UserLocationTableFilterComposer,
    $$UserLocationTableOrderingComposer,
    $$UserLocationTableAnnotationComposer,
    $$UserLocationTableCreateCompanionBuilder,
    $$UserLocationTableUpdateCompanionBuilder,
    (
      UserLocationData,
      BaseReferences<_$AppDatabase, $UserLocationTable, UserLocationData>
    ),
    UserLocationData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserLocationTableTableManager get userLocation =>
      $$UserLocationTableTableManager(_db, _db.userLocation);
}
