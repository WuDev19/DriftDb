import 'package:drift_database/local/db/AppDatabase.dart';
import 'package:drift_database/main.dart';
import 'package:drift_database/ui/ProductPage.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' hide Column;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final list = [];
  final idController = TextEditingController();
  final tenController = TextEditingController();
  final ageController = TextEditingController();
  final huyenController = TextEditingController();
  final db = AppDatabase();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    final result = await db.userDao.insertUser(
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
                  child: Text("Create", style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final result = await db.userDao.patchUser(
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
                  child: Text("Delete", style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () async {},
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
            onPressed: () async {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.greenAccent,
            ),
            child: Text("Fetch", style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final result = await db.userDao.putUser(UserCompanion(
                userId: Value(1),
                name: Value(tenController.text.trim()),
                age: Value(int.parse(ageController.text.trim()))
              ));
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
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => ProductPage()));
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
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final ps = list.elementAt(index);
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
                            ps.id.toString(),
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
    );
  }
}
