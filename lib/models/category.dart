class Category{
  int? index;
  late String name;
  late String icon;

  Category(this.index,this.name, this.icon);
}

List<Category> categories = [
  Category(0,"كل الوجبات", "assets/icons/all.svg"),
  Category(1,"كل الوجبات", "assets/icons/all.svg"),
  Category(2,"الأكثر طلبا", "assets/icons/popular.svg"),
  Category(3,"الدجاج", "assets/icons/chicken.svg"),
  Category(4,"أسماك", "assets/icons/fish.svg"),
  Category(5,"اللحوم", "assets/icons/viande.svg"),
];