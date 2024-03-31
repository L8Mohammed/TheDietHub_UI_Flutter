import 'package:get/get.dart';
import 'package:thediet/models/basketshoping.dart'; 
import 'package:thediet/models/order.dart';

class RestauMenuController extends GetxController{
  RxDouble  priceTotal = 0.0.obs;
  var dishTotal = 0.obs;
  var orders = <Order>[].obs;
  var basket = BasketShopping([],0.0,true).obs;
  var goToBasket = false.obs;

   increment(double price){
    priceTotal.value += price ;
    dishTotal ++;
  }
   decrement(double price){
    priceTotal.value -= price ;
    dishTotal --;
  }
   addOrder(Order order){
       if(orders.value.isEmpty){
          orders.value.add(order);
       }
       else{
         int i = 0;
         bool exist = false;
         for (var element in orders.value) {
           if(element.dish.name == order.dish.name){
             orders.value[i].quantity = order.quantity;
             exist = true;
             break;
           }
           i++;
         }
         if(!exist) {
           orders.value.add(order);
         }
       }
       for(var e in orders.value){
         print(e.dish.name + " " + e.quantity.toString());
       }
   }
   removeOrder(Order order){
    if(orders.value.isNotEmpty)
      {
        int i =0;
        for (var element in orders.value) {
          if(element.dish.name == order.dish.name){
            orders.value[i].quantity -= 1;
            if(orders.value[i].quantity == 0) {
              orders.value.remove(order);
            }
            break;
          }
          i++;
        }
      }
  }
   updateBasket(){
     basket.value.orders = orders.value;
     basket.value.priceTotal = priceTotal.value;
     basket.value.dishTotal = dishTotal.value;
     //basketToString();
   }
   @override
   void onClose() {
    priceTotal.value = 0;
    dishTotal.value = 0;
    //basket.value = BasketShopping([],0.0,true);
    goToBasket.value = false;
    //orders.value = [];
    super.onClose();
  }

}