// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserDao.dart';

// ignore_for_file: type=lint
mixin _$UserDaoMixin on DatabaseAccessor<AppDatabase> {
  $UserTable get user => attachedDatabase.user;
  UserDaoManager get managers => UserDaoManager(this);
}

class UserDaoManager {
  final _$UserDaoMixin _db;
  UserDaoManager(this._db);
  $$UserTableTableManager get user =>
      $$UserTableTableManager(_db.attachedDatabase, _db.user);
}
