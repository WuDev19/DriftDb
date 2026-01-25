import 'package:drift/drift.dart' hide Column;
import 'package:drift_database/local/dao/ProductDao.dart';
import 'package:drift_database/local/db/AppDatabase.dart';
import 'package:drift_database/main.dart';
import 'package:drift_database/model/UserProductModel.dart';
import 'package:drift_database/state-management/ProductCubit.dart';
import 'package:drift_database/state-management/ProductProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    logger.i("build ngoai");
    final productDao = context.read<ProductDao>();
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return ProductProvider(context.read<ProductDao>());
      },
      builder: (context, child) {
        logger.i("build trong builder va $child");
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
                  BlocBuilder<ProductCubit, int>(
                    builder: (context, state) {
                      return Text("Nhập id user: $state");
                    },
                  ),
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
                        productDao.insertProduct(
                          ProductCompanion(
                            userId: Value(
                              int.parse(userIdController.text.trim()),
                            ),
                            description: Value(
                              descriptionController.text.trim(),
                            ),
                            number: Value(
                              int.parse(numberController.text.trim()),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                      child: Text(
                        "Create",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                      ),
                      child: Text(
                        "Update",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyanAccent,
                      ),
                      child: Text(
                        "Delete",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // productDao
                        //     .findUserProduct(
                        //       int.parse(userIdController.text.trim()),
                        //     )
                        //     .then((value) {
                        //       logger.i(value);
                        //       setState(() {
                        //         list = value;
                        //       });
                        //     });
                        context.read<ProductProvider>().getUserProduct(
                          int.parse(userIdController.text.trim()),
                        );
                        context.read<ProductCubit>().add();
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
              FutureProvider<String>(
                create: (context) => getData(),
                initialData: "nothing",
                builder: (context, child) {
                  return Text(context.watch());
                },
              ),
              Selector<ProductProvider, List<UserProductModel>>(
                builder: (context, value, child) {
                  logger.i("build in consumer");
                  return Expanded(
                    child: Column(
                      children: [
                        child ?? Text("Error"),
                        Expanded(
                          child: ListView.builder(
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                              final UserProductModel ps = value.elementAt(
                                index,
                              );
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    color: Colors.blueGrey,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                },
                selector: (_, it) => it.list,
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.red,
                  height: 100,
                  child: Text("hihi"),
                ),
              ),
              Selector<ProductProvider, int>(
                builder: (context, value, child) {
                  logger.e("build in selector");
                  return SizedBox(
                    height: 200,
                    child: Text(value == 1 ? "giu nguyen " : "moi"),
                  );
                },
                selector: (_, it) => it.ints.length,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              context.read<ProductProvider>().addToList(1);
            },
          ),
        );
      },
    );
  }

  Future<String> getData() async {
    return Future.delayed(Duration(seconds: 5), () {
      return "Hello";
    });
  }
}
