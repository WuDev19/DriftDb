// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppDatabase.dart';

// ignore_for_file: type=lint
class $UserTable extends User with TableInfo<$UserTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 6,
      maxTextLength: 30,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    false,
    check: () => ComparableExpr(age).isBiggerOrEqualValue(0),
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [userId, name, age];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age'],
      )!,
    );
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(attachedDatabase, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final int userId;
  final String name;
  final int age;
  const UserData({required this.userId, required this.name, required this.age});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    map['name'] = Variable<String>(name);
    map['age'] = Variable<int>(age);
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      userId: Value(userId),
      name: Value(name),
      age: Value(age),
    );
  }

  factory UserData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      userId: serializer.fromJson<int>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      age: serializer.fromJson<int>(json['age']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'name': serializer.toJson<String>(name),
      'age': serializer.toJson<int>(age),
    };
  }

  UserData copyWith({int? userId, String? name, int? age}) => UserData(
    userId: userId ?? this.userId,
    name: name ?? this.name,
    age: age ?? this.age,
  );
  UserData copyWithCompanion(UserCompanion data) {
    return UserData(
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      age: data.age.present ? data.age.value : this.age,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, name, age);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.age == this.age);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<int> userId;
  final Value<String> name;
  final Value<int> age;
  const UserCompanion({
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.age = const Value.absent(),
  });
  UserCompanion.insert({
    this.userId = const Value.absent(),
    required String name,
    required int age,
  }) : name = Value(name),
       age = Value(age);
  static Insertable<UserData> custom({
    Expression<int>? userId,
    Expression<String>? name,
    Expression<int>? age,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (age != null) 'age': age,
    });
  }

  UserCompanion copyWith({
    Value<int>? userId,
    Value<String>? name,
    Value<int>? age,
  }) {
    return UserCompanion(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }
}

class $ProductTable extends Product with TableInfo<$ProductTable, ProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
    'number',
    aliasedName,
    false,
    check: () => ComparableExpr(number).isBiggerThanValue(0),
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user (user_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    productId,
    description,
    number,
    userId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId};
  @override
  ProductData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductData(
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
    );
  }

  @override
  $ProductTable createAlias(String alias) {
    return $ProductTable(attachedDatabase, alias);
  }
}

class ProductData extends DataClass implements Insertable<ProductData> {
  final int productId;
  final String description;
  final int number;
  final int userId;
  const ProductData({
    required this.productId,
    required this.description,
    required this.number,
    required this.userId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<int>(productId);
    map['description'] = Variable<String>(description);
    map['number'] = Variable<int>(number);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  ProductCompanion toCompanion(bool nullToAbsent) {
    return ProductCompanion(
      productId: Value(productId),
      description: Value(description),
      number: Value(number),
      userId: Value(userId),
    );
  }

  factory ProductData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductData(
      productId: serializer.fromJson<int>(json['productId']),
      description: serializer.fromJson<String>(json['description']),
      number: serializer.fromJson<int>(json['number']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<int>(productId),
      'description': serializer.toJson<String>(description),
      'number': serializer.toJson<int>(number),
      'userId': serializer.toJson<int>(userId),
    };
  }

  ProductData copyWith({
    int? productId,
    String? description,
    int? number,
    int? userId,
  }) => ProductData(
    productId: productId ?? this.productId,
    description: description ?? this.description,
    number: number ?? this.number,
    userId: userId ?? this.userId,
  );
  ProductData copyWithCompanion(ProductCompanion data) {
    return ProductData(
      productId: data.productId.present ? data.productId.value : this.productId,
      description: data.description.present
          ? data.description.value
          : this.description,
      number: data.number.present ? data.number.value : this.number,
      userId: data.userId.present ? data.userId.value : this.userId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductData(')
          ..write('productId: $productId, ')
          ..write('description: $description, ')
          ..write('number: $number, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(productId, description, number, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductData &&
          other.productId == this.productId &&
          other.description == this.description &&
          other.number == this.number &&
          other.userId == this.userId);
}

class ProductCompanion extends UpdateCompanion<ProductData> {
  final Value<int> productId;
  final Value<String> description;
  final Value<int> number;
  final Value<int> userId;
  const ProductCompanion({
    this.productId = const Value.absent(),
    this.description = const Value.absent(),
    this.number = const Value.absent(),
    this.userId = const Value.absent(),
  });
  ProductCompanion.insert({
    this.productId = const Value.absent(),
    required String description,
    required int number,
    required int userId,
  }) : description = Value(description),
       number = Value(number),
       userId = Value(userId);
  static Insertable<ProductData> custom({
    Expression<int>? productId,
    Expression<String>? description,
    Expression<int>? number,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (description != null) 'description': description,
      if (number != null) 'number': number,
      if (userId != null) 'user_id': userId,
    });
  }

  ProductCompanion copyWith({
    Value<int>? productId,
    Value<String>? description,
    Value<int>? number,
    Value<int>? userId,
  }) {
    return ProductCompanion(
      productId: productId ?? this.productId,
      description: description ?? this.description,
      number: number ?? this.number,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCompanion(')
          ..write('productId: $productId, ')
          ..write('description: $description, ')
          ..write('number: $number, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserTable user = $UserTable(this);
  late final $ProductTable product = $ProductTable(this);
  late final UserDao userDao = UserDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [user, product];
}

typedef $$UserTableCreateCompanionBuilder =
    UserCompanion Function({
      Value<int> userId,
      required String name,
      required int age,
    });
typedef $$UserTableUpdateCompanionBuilder =
    UserCompanion Function({
      Value<int> userId,
      Value<String> name,
      Value<int> age,
    });

final class $$UserTableReferences
    extends BaseReferences<_$AppDatabase, $UserTable, UserData> {
  $$UserTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductTable, List<ProductData>>
  _productRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.product,
    aliasName: $_aliasNameGenerator(db.user.userId, db.product.userId),
  );

  $$ProductTableProcessedTableManager get productRefs {
    final manager = $$ProductTableTableManager(
      $_db,
      $_db.product,
    ).filter((f) => f.userId.userId.sqlEquals($_itemColumn<int>('user_id')!));

    final cache = $_typedResult.readTableOrNull(_productRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UserTableFilterComposer extends Composer<_$AppDatabase, $UserTable> {
  $$UserTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productRefs(
    Expression<bool> Function($$ProductTableFilterComposer f) f,
  ) {
    final $$ProductTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.product,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTableFilterComposer(
            $db: $db,
            $table: $db.product,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserTableOrderingComposer extends Composer<_$AppDatabase, $UserTable> {
  $$UserTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserTable> {
  $$UserTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  Expression<T> productRefs<T extends Object>(
    Expression<T> Function($$ProductTableAnnotationComposer a) f,
  ) {
    final $$ProductTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.product,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTableAnnotationComposer(
            $db: $db,
            $table: $db.product,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserTable,
          UserData,
          $$UserTableFilterComposer,
          $$UserTableOrderingComposer,
          $$UserTableAnnotationComposer,
          $$UserTableCreateCompanionBuilder,
          $$UserTableUpdateCompanionBuilder,
          (UserData, $$UserTableReferences),
          UserData,
          PrefetchHooks Function({bool productRefs})
        > {
  $$UserTableTableManager(_$AppDatabase db, $UserTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> userId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> age = const Value.absent(),
              }) => UserCompanion(userId: userId, name: name, age: age),
          createCompanionCallback:
              ({
                Value<int> userId = const Value.absent(),
                required String name,
                required int age,
              }) => UserCompanion.insert(userId: userId, name: name, age: age),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UserTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({productRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (productRefs) db.product],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productRefs)
                    await $_getPrefetchedData<
                      UserData,
                      $UserTable,
                      ProductData
                    >(
                      currentTable: table,
                      referencedTable: $$UserTableReferences._productRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$UserTableReferences(db, table, p0).productRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.userId == item.userId),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UserTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserTable,
      UserData,
      $$UserTableFilterComposer,
      $$UserTableOrderingComposer,
      $$UserTableAnnotationComposer,
      $$UserTableCreateCompanionBuilder,
      $$UserTableUpdateCompanionBuilder,
      (UserData, $$UserTableReferences),
      UserData,
      PrefetchHooks Function({bool productRefs})
    >;
typedef $$ProductTableCreateCompanionBuilder =
    ProductCompanion Function({
      Value<int> productId,
      required String description,
      required int number,
      required int userId,
    });
typedef $$ProductTableUpdateCompanionBuilder =
    ProductCompanion Function({
      Value<int> productId,
      Value<String> description,
      Value<int> number,
      Value<int> userId,
    });

final class $$ProductTableReferences
    extends BaseReferences<_$AppDatabase, $ProductTable, ProductData> {
  $$ProductTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserTable _userIdTable(_$AppDatabase db) => db.user.createAlias(
    $_aliasNameGenerator(db.product.userId, db.user.userId),
  );

  $$UserTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UserTableTableManager(
      $_db,
      $_db.user,
    ).filter((f) => f.userId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProductTableFilterComposer
    extends Composer<_$AppDatabase, $ProductTable> {
  $$ProductTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  $$UserTableFilterComposer get userId {
    final $$UserTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableFilterComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductTable> {
  $$ProductTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserTableOrderingComposer get userId {
    final $$UserTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableOrderingComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductTable> {
  $$ProductTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  $$UserTableAnnotationComposer get userId {
    final $$UserTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.user,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserTableAnnotationComposer(
            $db: $db,
            $table: $db.user,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductTable,
          ProductData,
          $$ProductTableFilterComposer,
          $$ProductTableOrderingComposer,
          $$ProductTableAnnotationComposer,
          $$ProductTableCreateCompanionBuilder,
          $$ProductTableUpdateCompanionBuilder,
          (ProductData, $$ProductTableReferences),
          ProductData,
          PrefetchHooks Function({bool userId})
        > {
  $$ProductTableTableManager(_$AppDatabase db, $ProductTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> productId = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> number = const Value.absent(),
                Value<int> userId = const Value.absent(),
              }) => ProductCompanion(
                productId: productId,
                description: description,
                number: number,
                userId: userId,
              ),
          createCompanionCallback:
              ({
                Value<int> productId = const Value.absent(),
                required String description,
                required int number,
                required int userId,
              }) => ProductCompanion.insert(
                productId: productId,
                description: description,
                number: number,
                userId: userId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$ProductTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$ProductTableReferences
                                    ._userIdTable(db)
                                    .userId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProductTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductTable,
      ProductData,
      $$ProductTableFilterComposer,
      $$ProductTableOrderingComposer,
      $$ProductTableAnnotationComposer,
      $$ProductTableCreateCompanionBuilder,
      $$ProductTableUpdateCompanionBuilder,
      (ProductData, $$ProductTableReferences),
      ProductData,
      PrefetchHooks Function({bool userId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserTableTableManager get user => $$UserTableTableManager(_db, _db.user);
  $$ProductTableTableManager get product =>
      $$ProductTableTableManager(_db, _db.product);
}
