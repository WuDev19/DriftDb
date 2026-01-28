import 'package:drift/drift.dart';
import 'package:drift_database/local/db/AppDatabase.dart';
import 'package:drift_database/main.dart';

import '../../model/UserProductModel.dart';
import '../entity/Product.dart';
import '../entity/User.dart';

part 'ProductDao.g.dart';

@DriftAccessor(tables: [Product, User])
class ProductDao extends DatabaseAccessor<AppDatabase> with _$ProductDaoMixin {
  ProductDao(super.db);

  Future insertProduct(ProductCompanion productInsert) async {
    return into(product).insertOnConflictUpdate(productInsert);
  }

  Future<List<UserProductModel>> findUserProduct(int userId) async {
    logger.i(userId);
    final data = await (select(product).join([
      innerJoin(user, product.userId.equalsExp(user.userId)),
    ])..where(product.userId.equals(userId))).get();
    logger.i(data);
    return data.map((e) {
      final name = e.read(user.name);
      final des = e.read(product.description);
      final num = e.read(product.number);
      return UserProductModel(name: name, des: des, number: num);
    }).toList();
  }

  Future getProductDetail(int productId) async {
    return (select(
      product,
    )..where((tbl) => tbl.productId.equals(productId))).getSingleOrNull();
  }
}
