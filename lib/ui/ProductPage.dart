import 'package:drift/drift.dart' hide Column;
import 'package:drift_database/local/db/AppDatabase.dart';
import 'package:drift_database/main.dart';
import 'package:drift_database/model/UserProductModel.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final productIdController = TextEditingController();
  final descriptionController = TextEditingController();
  final numberController = TextEditingController();
  final userIdController = TextEditingController();
  final db = AppDatabase();
  List list = <UserProductModel>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
        backgroundColor: Colors.tealAccent,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 10),
              Text("Nhập id sản phẩm: "),
              Spacer(),
              SizedBox(
                height: 50,
                width: 250,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: productIdController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 10),
              Text("Nhập mô tả: "),
              Spacer(),
              SizedBox(
                height: 50,
                width: 250,
                child: TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 10),
              Text("Nhập số lượng: "),
              Spacer(),
              SizedBox(
                height: 50,
                width: 250,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: numberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 10),
              Text("Nhập id user: "),
              Spacer(),
              SizedBox(
                height: 50,
                width: 250,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: userIdController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 100,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                // childAspectRatio: 2 //tỉ lệ width / height
                mainAxisExtent: 40,
              ),
              children: [
                ElevatedButton(
                  onPressed: () async {
                    db.productDao.insertProduct(
                      ProductCompanion(
                        userId: Value(int.parse(userIdController.text.trim())),
                        description: Value(descriptionController.text.trim()),
                        number: Value(int.parse(numberController.text.trim())),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                  child: Text("Create", style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  child: Text("Update", style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyanAccent,
                  ),
                  child: Text("Delete", style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () async {
                    db.productDao
                        .findUserProduct(
                          int.parse(userIdController.text.trim()),
                        )
                        .then((value) {
                          logger.i(value);
                          setState(() {
                            list = value;
                          });
                        });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  child: Text("Get", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final UserProductModel ps = list.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.blueGrey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            ps.name ?? "",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ps.des ?? "",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ps.number.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
