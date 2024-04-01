import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thediet/controller/basketcontroller.dart';
import 'package:thediet/models/dish.dart';
import 'package:thediet/models/restaurant.dart';
import 'package:thediet/screens/restaurant/rhomescreen.dart';
import 'package:thediet/ui/appbarrestaurant.dart';
import 'package:thediet/ui/dishcardui.dart';
import '../../constant/myconstant.dart';
import '../../models/category.dart';
import '../../ui/categoryitemui.dart';

/* Consisting of Restaurant title and image header on top - List of categories(CategoryItemUi exist in ui folder) - List of Dishes(DishCardUi)
 - Bottom bar showing basket information - Bottom Modal Bar showing basket information */
// When Tap on CategoryItemUi, you change Dishes List (Filter List by category)
// When Tap on DishCardUi will take you To DishDetailScreen

class MenuOfRestaurantScreen extends StatefulWidget{
    Restaurant restaurant;
    MenuOfRestaurantScreen({super.key,required this.restaurant});

  @override
  State<MenuOfRestaurantScreen> createState() => _MenuOfRestaurantScreenState();
}

class _MenuOfRestaurantScreenState extends State<MenuOfRestaurantScreen> {

  final BasketController c = Get.put(BasketController());
  late int itemSelected = 1;
  late bool freeShip = true;
  late bool oldOrNew = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: const AppBarRestaurant(),
      body: Stack(
        children: [
          Container(
            color: greenLightC,
            height: heightD - 0.9,
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Column(
              children: [
                // Restaurant title and image header on top
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.restaurant.name,style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 18.sp),),
                    SizedBox(width: 10.w,),
                    SizedBox(
                      height: 40.h,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(13)),
                          child: SizedBox(
                              height: 30.h,
                              //width: 50.w,
                              child: Image.asset(widget.restaurant.img,fit: BoxFit.fill)
                          )
                      ),
                    ),
                  ],
                ),
                // List of categories(CategoryItemUi)
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
                              //res = restaurants;
                            }
                            else if(index != 0){
                              itemSelected = index;
                              //res = restaurants.where((element) => element.categories!.contains(categories[index].name)).toList();
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
                // List of Dishes(DishCardUi)
                Container(
                  height: heightD * 0.64,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                      itemCount: dishes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: DishCardUi(dish: dishes[index],numDish: 0),
                        );
                      }
                  ),
                )
              ],
            ),
          ),
          // Bottom bar showing basket information
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                height: heightD * 0.1,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(Icons.keyboard_arrow_up_sharp,color: Colors.grey,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() => Text(" ر.س${c.priceTotal}",style: GoogleFonts.cairo(fontWeight: FontWeight.w500,fontSize: 20.sp,color: greenC),),),
                        Obx(() => Text("الإجمالي( ${c.dishTotal}وجبة)",style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 18.sp,),),),
                      ],
                    ),
                  ],
                )
              ),
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext bc) => bottomModalForTotal(bc)
                );
              },
              onVerticalDragStart: (dragEvent){
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext bc) => bottomModalForTotal(bc)
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  // Bottom Modal Bar showing basket information
  Widget bottomModalForTotal(BuildContext ctx){
    return Container(
      height: heightD * 0.3,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: Colors.white,
      ),
      width: widthD,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.keyboard_arrow_down_sharp,color: Colors.grey,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: heightD * 0.1,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text(" ر.س${c.priceTotal}",style: GoogleFonts.cairo(fontWeight: FontWeight.w500,fontSize: 20.sp,color: greenC),),),
                Obx(() => Text("الإجمالي( ${c.dishTotal}وجبة)",style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 18.sp),),),
              ],
            ),
          ),
          SizedBox(height: 5.h,),
          SizedBox(
            height: 50.h,
            width: widthD * 0.6,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenC,
                ),
                onPressed: c.dishTotal.value == 0 ? null : (){
                  c.goToBasket.value = true;
                  c.updateBasket();
                  Navigator.pop(ctx);
                  c.onClose();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const RHomeScreen()));
                  //Get.to(RHomeScreen());
                },
                child: Text("إضافة إلى السلة",style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 20.sp,color: Colors.white),)
            ),
          ),
        ],
      ),
    );
  }
}
