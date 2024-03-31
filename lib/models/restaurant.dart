class Restaurant{
  late String name;
  late String img;
  late double distance;
  late String shapping;
  late int time;
  List<String>? categories;

  Restaurant(this.name, this.img, this.distance, this.shapping, this.time,this.categories);

}

List<Restaurant> restaurants = [
  Restaurant("شهية (أسماك,مشروبات)", "assets/images/2.jpg", 1.6, "مجانا", 30,["أسماك",]),
  Restaurant("البيك (دجاج..)", "assets/images/a.jpg", 2, "مجانا", 40,["دجاج","أسماك"]),
  Restaurant("ديرتي (دجاج,أسماك..)", "assets/images/1.jpg", 2.5, "مجانا", 50,[]),
  Restaurant("لمة (دجاج,لحوم)", "assets/images/3.jpg", 1.5, "مجانا", 25,["لحوم"]),
  Restaurant("مذاق (دجاج,لحوم)", "assets/images/6.jpg", 1.5, "مجانا", 25,["الدجاج"]),
  Restaurant("الطازج (دجاج,لحوم)", "assets/images/5.jpg", 3, "مجانا", 60,["اللحوم"]),
  Restaurant("شهية (أسماك,مشروبات)", "assets/images/2.jpg", 1.6, "مجانا", 30,["الدجاج"]),
  Restaurant("البيك (دجاج..)", "assets/images/a.jpg", 2, "مجانا", 40,["اللحوم"]),
  Restaurant("ديرتي (دجاج,أسماك..)", "assets/images/1.jpg", 2.5, "مجانا", 50,["اللحوم"]),
  Restaurant("لمة (دجاج,لحوم)", "assets/images/3.jpg", 1.5, "مجانا", 25,["الدجاج"]),
  Restaurant("مذاق (دجاج,لحوم)", "assets/images/6.jpg", 1.5, "مجانا", 25,["اللحوم"]),
  Restaurant("الطازج (دجاج,لحوم)", "assets/images/5.jpg", 3, "مجانا", 60,["الدجاج"]),
];