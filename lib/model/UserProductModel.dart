class UserProductModel {
  final String? name;
  final String? des;
  final int? number;

  UserProductModel({
    required this.name,
    required this.des,
    required this.number,
  });

  @override
  String toString() {
    return 'UserProductModel{name: $name, des: $des, number: $number}';
  }
}
