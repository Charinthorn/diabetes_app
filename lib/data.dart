import 'package:Diabo/model/category.dart';

class FakeData {
  List<Category> _categoriesList = <Category>[
    Category(name: 'แจ้งเตือนการนัดเเพทย์', image: 'assets/images/meet-med.png'),
    Category(name: 'ผลตรวจ', image: 'assets/images/รายงาน.png'),
    Category(name: 'อาหาร', image: 'assets/images/food.png'),
    Category(name: 'แจ้งเตือนการรับประทานยา', image: 'assets/images/ยา.png')
  ];
  List<Category> get categoriesList => _categoriesList;
}
