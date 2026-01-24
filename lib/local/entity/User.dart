import 'package:drift/drift.dart';

class User extends Table {
  IntColumn get userId => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 6, max: 30)();

  IntColumn get age => integer().check(age.isBiggerOrEqualValue(0))();
}
