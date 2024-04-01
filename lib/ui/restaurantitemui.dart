import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:thediet/controller/favoritecontroller.dart';
import 'package:thediet/models/restaurant.dart';
import 'package:thediet/screens/restaurant/menuofrestaurantscreen.dart';
import 'package:thediet/tools.dart';

import '../constant/myconstant.dart';

class RestaurantItemUi extends StatefulWidget{
  Restaurant restaurant;

  RestaurantItemUi({super.key,required this.restaurant});

  @override
  State<RestaurantItemUi> createState() => _RestaurantItemUiState();
}

class _RestaurantItemUiState extends State<RestaurantItemUi> {
  final FavoriteController c = Get.put(FavoriteController());

  final double itemHeight = (size.height - kToolbarHeight - 80 - 24) / 3;
  final double itemWidth = size.width / 2;
  late bool isInFavList;

  @override
  Widget build(BuildContext context) {
    isInFavList = c.checkRInFavList(widget.restaurant);
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.leftToRight,
            alignment: Alignment.center,
            curve: Curves.ease,

            duration: const Duration(milliseconds: 400),
            child: MenuOfRestaurantScreen(restaurant: widget.restaurant,),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      height: itemHeight * 0.6,
                      width: itemWidth * 0.8,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                        child: Image.asset(
                          height: itemHeight.h,
                          width: itemWidth.w,
                          widget.restaurant.img,
                          fit: BoxFit.fill,
                        ),
                      )
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 6.h),
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    height: itemHeight * 0.25,
                    width: itemWidth * 0.8,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: greenC,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("دقيقة ${widget.restaurant.time}",style: GoogleFonts.cairo(fontSize: 9.sp,color: Colors.white),),
                                Tools.svgToIcon("assets/icons/time.svg")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("(4.6) 125",style: GoogleFonts.cairo(fontSize: 9.sp,color: Colors.white),),
                                Tools.svgToIcon("assets/icons/star.svg")
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("${widget.restaurant.distance} كلم",style: GoogleFonts.cairo(fontSize: 9.sp,color: Colors.white),),
                                Tools.svgToIcon("assets/icons/location.svg")
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(" مجانا",style: GoogleFonts.cairo(fontSize: 9.sp,color: Colors.white),),
                                Tools.svgToIcon("assets/icons/delivery.svg")
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: IconButton(
                      onPressed: (){
                       c.addOrRemoveRFromFavList(widget.restaurant);
                       setState(() {
                         isInFavList = c.checkRInFavList(widget.restaurant);
                       });
                      },
                      icon: Icon(
                        isInFavList ? Icons.favorite : Icons.favorite_border_sharp,
                        size: 25.w,
                        color: greenC,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(widget.restaurant.name,style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 13.sp),overflow: TextOverflow.ellipsis,textDirection: TextDirection.rtl,),
        ],
      ),
    );
  }
}