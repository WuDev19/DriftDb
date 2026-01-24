// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductDao.dart';

// ignore_for_file: type=lint
mixin _$ProductDaoMixin on DatabaseAccessor<AppDatabase> {
  $UserTable get user => attachedDatabase.user;
  $ProductTable get product => attachedDatabase.product;
  ProductDaoManager get managers => ProductDaoManager(this);
}

class ProductDaoManager {
  final _$ProductDaoMixin _db;
  ProductDaoManager(this._db);
  $$UserTableTableManager get user =>
      $$UserTableTableManager(_db.attachedDatabase, _db.user);
  $$ProductTableTableManager get product =>
      $$ProductTableTableManager(_db.attachedDatabase, _db.product);
}
