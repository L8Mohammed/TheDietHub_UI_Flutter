import 'package:get/get.dart';
import 'package:thediet/models/dish.dart';
import 'package:thediet/models/restaurant.dart';

class FavoriteController extends GetxController{
  var restaurantFavList = <Restaurant>[].obs;
  var dishFavList = <Dish>[].obs;

  // Restaurant Favorite
  bool checkRInFavList(Restaurant r){
    bool checkIn = restaurantFavList.value.contains(r);
    return checkIn;
  }
  addOrRemoveRFromFavList(Restaurant restaurant){
    if(!checkRInFavList(restaurant)) {
      restaurantFavList.value.add(restaurant);
    } else {
      removeRToFavList(restaurant);
    }
  }
  removeRToFavList(Restaurant restaurant){
    restaurantFavList.remove(restaurant);
  }

  // Dish Favorite
  bool checkDInFavList(Dish dish){
    bool checkIn = dishFavList.value.contains(dish);
    return checkIn;
  }
  addOrRemoveDFromFavList(Dish dish){
    if(!checkDInFavList(dish)) {
      dishFavList.value.add(dish);
    } else {
      removeDToFavList(dish);
    }
  }
  removeDToFavList(Dish dish){
    dishFavList.remove(dish);
  }

}