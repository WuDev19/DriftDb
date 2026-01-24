import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import '../dao/ProductDao.dart';
import '../dao/UserDao.dart';
import '../entity/Product.dart';
import '../entity/User.dart';
import 'package:path_provider/path_provider.dart';

part 'AppDatabase.g.dart';

@DriftDatabase(tables: [User, Product], daos: [UserDao, ProductDao])
class AppDatabase extends _$AppDatabase {
  //giống room khi khởi tạo db
  AppDatabase([QueryExecutor? executor])
    : super(
        executor ?? _openConnection(),
      ); //cần truyền queryExecutor vào constructor

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      // nếu dùng driftDatabse mà ko truyền native thì mặc định sẽ dùng getApplicationDocumentsDirectory() (thư mục được hệ thống backup)
      name: "my_databse",
      native: const DriftNativeOptions(
        databaseDirectory:
            getApplicationSupportDirectory, //thư mục hỗ trợ, không bị backup mặc định
      ),
    );
  }

}
