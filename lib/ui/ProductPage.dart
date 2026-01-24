import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final idController = TextEditingController();
  final descriptionController = TextEditingController();
  final numberControler = TextEditingController();

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
                  keyboardType: TextInputType.streetAddress,
                  controller: numberControler,
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
                  onPressed: () async {},
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
                  onPressed: () async {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  child: Text("Get", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
