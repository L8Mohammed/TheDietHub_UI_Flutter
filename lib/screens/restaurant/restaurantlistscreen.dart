import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thediet/models/category.dart';
import 'package:thediet/models/restaurant.dart';
import 'package:thediet/ui/categoryitemui.dart';
import 'package:thediet/ui/restaurantitemui.dart';

import '../../constant/myconstant.dart';

// Consisting of Animated Background (AnimatedContainer) -  List View of Categories(CategoryItemUi) on top - GridView of RestaurantItemUi rest of screen
// When Tap on CategoryItemUi, you change Dishes List (Filter List by category)
// When Tap on RestaurantItemUi will take you To MenuOfRestaurantScreen
class RestaurantListScreen extends StatefulWidget{
  const RestaurantListScreen({super.key});

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {

  final double itemHeight = (size.height - kToolbarHeight - 80 - 24) / 3;
  final double itemWidth = size.width / 2;
  late ScrollController controller;
   double height = heightD * 0.7;
   BorderRadius border = const BorderRadius.only(bottomRight: Radius.circular(200));
   late int itemSelected = 1;
   late List<Restaurant> res;
   late bool freeShip = true;
   late bool oldOrNew = false;

  @override
  void initState() {
    super.initState();
    res = restaurants;
    controller = ScrollController();
    controller.addListener(() {
      if (controller.hasClients) {
        if (controller.position.maxScrollExtent != controller.offset) {
          setState(() {
            height = heightD * 0.9;
            border = const BorderRadius.only(bottomRight: Radius.circular(0));
          });
        }
        if (controller.position.atEdge) {
          setState(() {
            height = heightD * 0.7;
            border = const BorderRadius.only(bottomRight: Radius.circular(200));
            // print(" i scroll");
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          // Animated background ..
          AnimatedContainer (
           curve:  Curves.fastOutSlowIn,
            height: height,
            decoration:  BoxDecoration(
              borderRadius: border,
              color: greenLightC,
            ), duration: const Duration (milliseconds: 500),
          ),
          Column(
            children: [
              // List View of Categories
              SizedBox(
                height: 45.h,
                child: ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          if(index == 0){
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext c){
                                  return Container(
                                     height: heightD * 0.4,
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Text("إعدادات البحث",style: GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold),),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text("التوصيل المجاني",style: GoogleFonts.cairo(fontSize: 15),),
                                            Checkbox(
                                              value: freeShip,
                                              onChanged: (value) {
                                                setState(() {
                                                  freeShip = value!;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: heightD * 0.1,),
                                        SizedBox(
                                          height: 40.h,
                                          width: widthD * 0.6,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: greenC,
                                              ),
                                              onPressed: (){Navigator.pop(context);},
                                              child: Text("تأكيد",style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 15.sp,color: Colors.white),)
                                          ),
                                        ),
                                        SizedBox(height: heightD * 0.01,),
                                        SizedBox(
                                          height: 40.h,
                                          width: widthD * 0.6,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: greenC.withAlpha(1),
                                              ),
                                              onPressed: (){Navigator.pop(context);},
                                              child: Text("إلغاء",style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 15.sp,color: Colors.white),)
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                            );
                          }
                          else if(index == 1 || index == 2){
                            itemSelected = index;
                            res = restaurants;
                          }
                          else if(index != 0){
                            itemSelected = index;
                            res = restaurants.where((element) => element.categories!.contains(categories[index].name)).toList();
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: index == 0 ? const Icon(Icons.tune,size: 40,color: greenC,) : CategoryItemUi(c: categories[index],index: itemSelected),
                      ),
                    );
                  },
                ),
              ),
              // GridView of Restaurant (RestaurantItemUi in ui folder)
              Container(
                height: heightD - 75.h - heightD*0.1 - 80,
                child: GridView.builder(
                  controller: controller,
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
                  itemCount: res.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        child: RestaurantItemUi(restaurant: res[index])
                    );
                  },

                ),
              )
            ],
          ),
        ],
      )
    );
  }
}
