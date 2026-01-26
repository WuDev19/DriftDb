import 'package:drift_database/local/dao/UserDao.dart';
import 'package:drift_database/local/db/AppDatabase.dart';
import 'package:drift_database/main.dart';
import 'package:drift_database/ui/ProductPage.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = <UserData>[];
  final idController = TextEditingController();
  final tenController = TextEditingController();
  final ageController = TextEditingController();
  final huyenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userDao = context.read<UserDao>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Drift"),
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 10),
                Text("Nhập id: "),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: TextField(
                    controller: idController,
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
                Text("Nhập tên: "),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: TextField(
                    controller: tenController,
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
                Text("Nhập tuổi: "),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: TextField(
                    keyboardType: TextInputType.streetAddress,
                    controller: ageController,
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
                      final result = await userDao.insertUser(
                        UserCompanion(
                          age: Value(int.parse(ageController.text.trim())),
                          name: Value(tenController.text.trim()),
                        ),
                      );
                      logger.e(result);
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
                    onPressed: () async {
                      final result = await userDao.patchUser(
                        int.parse(ageController.text.trim()),
                        tenController.text,
                      );
                      logger.i(result);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                    ),
                    child: Text("Patch", style: TextStyle(color: Colors.white)),
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
                      final result = await userDao.findUserByName(
                        tenController.text,
                      );
                      setState(() {
                        list = result;
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
            ElevatedButton(
              onPressed: () async {
                userDao
                    .findUserAgeBiggerThan10(
                      int.parse(idController.text.trim()),
                    )
                    .then((value) {
                      setState(() {
                        list = value;
                      });
                    });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
              child: Text("Fetch", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final result = await userDao.putUser(
                  UserCompanion(
                    userId: Value(1),
                    name: Value(tenController.text.trim()),
                    age: Value(int.parse(ageController.text.trim())),
                  ),
                );
                logger.i(result);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
              child: Text("Put", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.push('/product');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
              child: Text(
                "Move to Product",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Container(
              color: Colors.tealAccent,
              height: 300,
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final UserData ps = list.elementAt(index);
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
                              ps.userId.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ps.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ps.age.toString(),
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
      ),
    );
  }
}
