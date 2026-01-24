import 'package:drift/drift.dart';
import 'package:drift_database/local/entity/User.dart';

class Product extends Table {
  IntColumn get productId => integer().autoIncrement()();

  TextColumn get description => text().withLength(min: 3, max: 255)();

  IntColumn get number => integer().check(number.isBiggerThanValue(0))();

  IntColumn get userId => integer().references(User, #userId)();
}
