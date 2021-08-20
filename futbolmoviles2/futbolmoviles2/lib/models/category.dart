import 'dart:ui';

class Category {
  String name;
  String icon;
  Color color;
  String imgName;
  String leaguetag;
  List<Category>? subCategories;

  Category(
    {
      required this.name,
      required this.icon,
      required this.color, 
      required this.imgName,
      required this.leaguetag,
      required this.subCategories
    }
  );

}