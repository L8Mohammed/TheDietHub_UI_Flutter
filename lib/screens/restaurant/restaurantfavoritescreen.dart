import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:thediet/constant/myconstant.dart';
import 'package:thediet/controller/favoritecontroller.dart';
import 'package:thediet/models/restaurant.dart';
import 'package:thediet/ui/dishcardui.dart';
import 'package:thediet/ui/restaurantitemui.dart';

class RestaurantFavoriteScreen extends StatefulWidget  {

  const RestaurantFavoriteScreen({super.key});

  @override
  State<RestaurantFavoriteScreen> createState() => _RestaurantFavoriteScreenState();
}

class _RestaurantFavoriteScreenState extends State<RestaurantFavoriteScreen> with SingleTickerProviderStateMixin{
  final double itemHeight = (size.height - kToolbarHeight - 80 - 24) / 3;

  final double itemWidth = size.width / 2;

  late List<Restaurant> res = restaurants;

  final FavoriteController c = Get.put(FavoriteController());

  late TabController tabController;

  late int indexTab = 0;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          ButtonsTabBar(
            physics:  NeverScrollableScrollPhysics(),
            backgroundColor: greenC,
            height: 40.h,
            elevation: 10,
            borderWidth: 1,
            borderColor: greenC,
            unselectedBackgroundColor: Colors.white,
            unselectedBorderColor: greenC,
            onTap: (index){
              setState(() {
                indexTab = index;
              });
            },
            tabs: [
              Tab(
                 child: SizedBox(
                   width: 150.w,
                   child: Text("المطاعم",style: GoogleFonts.cairo(fontWeight: FontWeight.bold,color: indexTab == 0 ? Colors.white : greenC,fontSize: 15.sp,),textAlign: TextAlign.center,),
                 ),
              ),
              Tab(
                child: SizedBox(
                  width: 150.w,
                  child: Text("الوجبات",style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 15.sp,color: indexTab == 1 ? Colors.white : greenC,),textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
           Expanded(
            child: TabBarView(
              physics:  const NeverScrollableScrollPhysics(),
              children: [
                tabOfRestaurantFavorite(),
                tabOfDishFavorite()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tabOfRestaurantFavorite(){
    return Container(
      //height: heightD - 70 - heightD*0.1 - 80,
        child: Obx(() =>
        c.restaurantFavList.value.isEmpty
            ? Center(
               child: Lottie.asset("assets/animations/nofavorite.json",width: 200.w,height: 200.h,fit: BoxFit.fill,),
             )
            : GridView.builder(
          //controller: controller,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            childAspectRatio: (itemWidth / itemHeight),
            crossAxisCount: 2,
          ),
          itemCount: c.restaurantFavList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: RestaurantItemUi(restaurant: c.restaurantFavList[index])
            );
          },
        )
        )
    );
  }

  Widget tabOfDishFavorite(){
    return Container(
      //height: heightD - 70 - heightD*0.1 - 80,
        child: Obx(() =>
        c.dishFavList.value.isEmpty
            ? Center(
                child: Lottie.asset("assets/animations/nofavorite.json",width: 200.w,height: 200.h,fit: BoxFit.fill,),
              )
            : ListView.builder(
            padding: const EdgeInsets.all(8.0),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: c.dishFavList.value.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: DishCardUi(dish: c.dishFavList.value[index],numDish: 0),
              );
            }
        ),
        )
    );
  }
}