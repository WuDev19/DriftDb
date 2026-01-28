import 'package:drift_database/local/dao/ProductDao.dart';
import 'package:drift_database/local/db/AppDatabase.dart';
import 'package:drift_database/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetail extends StatelessWidget {
  final int _productId;
  const ProductDetail({super.key, required int productId}) : _productId = productId;

  @override
  Widget build(BuildContext context) {
    logger.e(_productId);
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail"),
        backgroundColor: Colors.tealAccent,
      ),
      body: FutureBuilder(
        future: context.read<ProductDao>().getProductDetail(_productId),
        builder: (context, asyncSnapshot) {
          if(asyncSnapshot.hasData){
            final data = asyncSnapshot.data as ProductData?;
            logger.t(data);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  data?.userId.toString() ?? "",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data?.description ?? "",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data?.number.toString() ?? "",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          }
          return CircularProgressIndicator();
        }
      ),
    );
  }
}
