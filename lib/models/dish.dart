class Dish{
  late String name;
  late String imgSrc;
  late String description;
  late double price;
  late int calories;
  late String rating;

  Dish(this.name, this.imgSrc, this.description, this.price, this.calories,
      this.rating);
}

List<Dish> dishes = [
  Dish("دجاج مشوي", "assets/images/chicken.jpg", "دجاج مشوي على الفحم يقدم مع خضار", 300, 150 , "(1025) 4.5"),
  Dish("سمك مشوي", "assets/images/fishburn.jpg", "سمك مشوي على الفحم يقدم مع خضار", 600, 280 , "(1025) 4.5"),
  Dish("جمبري", "assets/images/gambri.jpg", "جمبري مطبوخ يقدم مع خضار", 160, 200 , "(1025) 4.5"),
  Dish("شرائح اللحم المشوي", "assets/images/meat.jpg", "لحم مشوي على الفحم يقدم مع خضار", 50, 350 , "(1025) 4.5"),
];