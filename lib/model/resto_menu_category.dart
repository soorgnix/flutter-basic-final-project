import 'package:tugasakhir_pemula/model/resto_menu.dart';

class RestoMenuCategory {
  int id;
  String name;
  List<RestoMenu> restoMenusInCategory;

  RestoMenuCategory ({
    required this.id,
    required this.name,
    required this.restoMenusInCategory
  });
}

var restoMenuCategoryList = [
  RestoMenuCategory (
    id: 1,
    name: 'Main Course',
    restoMenusInCategory: restoMenuList
        .where((x) => x.category == 1)
        .toList(),
  ),
  RestoMenuCategory (
    id: 2,
    name: 'Snack',
    restoMenusInCategory: restoMenuList
        .where((x) => x.category == 2)
        .toList(),
  ),
  RestoMenuCategory (
    id: 3,
    name: 'Drink',
    restoMenusInCategory: restoMenuList
      .where((x) => x.category == 3)
      .toList(), 
  ),
];