import 'package:thediet/models/dish.dart';

class Order{
  late Dish dish;
  late int quantity;

  Order(this.dish, this.quantity);
}