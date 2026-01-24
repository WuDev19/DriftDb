import 'package:drift/drift.dart';
import 'package:drift_database/local/db/AppDatabase.dart';

import '../entity/User.dart';

part 'UserDao.g.dart';

// định nghĩa dao, giống như DAO trong Room
@DriftAccessor(tables: [User])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(AppDatabase db) : super(db);

  Future insertUser(UserCompanion userCreate) async {
    return into(user).insert(userCreate);
  }

  Future patchUser(int age, String name) async {
    return (update(user)..where((tbl) => tbl.name.equals(name))).write(
      UserCompanion(age: Value(age)),
    );
  }

  Future putUser(UserCompanion putUser) async {
    return update(user).replace(putUser);
  }

}
