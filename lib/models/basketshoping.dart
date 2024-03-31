import 'order.dart';

class BasketShopping{
  late List<Order> orders;
  late double priceTotal;
  late int dishTotal = 0;
  bool isFreeShipping = true;
  late DateTime dateTime = DateTime.now();
  BasketShopping(this.orders, this.priceTotal, this.isFreeShipping);

}