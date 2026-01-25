import 'package:drift_database/local/dao/ProductDao.dart';
import 'package:drift_database/main.dart';
import 'package:drift_database/model/UserProductModel.dart';
import 'package:flutter/material.dart';

//khi notifyListeners() thì tất cả listener đều bị rebuild (có bao nhiêu consumer, watch, selector thì đều rebuild hết)
//để giải quyết vấn đề này thì dùng selector, selector sẽ xem thằng nào được quyền build lại
//watch sẽ làm cho hàm build hay builder gần nó nhất rebuild, consumer thì chỉ rebuild bên trong nó

class ProductProvider with ChangeNotifier {
  final ProductDao _productDao;
  List<UserProductModel> _list = []; //dùng selector để chỉ rebuild với thuộc tính này

  ProductProvider(this._productDao);

  List<UserProductModel> get list => _list;

  final List<int> _ints = []; //dùng selector để chỉ rebuild với thuộc tính này

  List<int> get ints => _ints;

  void getUserProduct(int userId) async {
    _list = await _productDao.findUserProduct(userId);
    notifyListeners();
  }

  void addToList(int u) {
    if (!_ints.contains(u)) {
      _ints.add(u);
    }
    else{
      _ints.replaceRange(0, 1, [0]);
      logger.i(_ints);
    }
    notifyListeners();
  }

}
