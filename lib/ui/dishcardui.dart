import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:thediet/controller/basketcontroller.dart';
import 'package:thediet/controller/favoritecontroller.dart';
import 'package:thediet/controller/restaumenucontroller.dart';
import 'package:thediet/models/dish.dart';
import 'package:thediet/models/order.dart';

import '../constant/myconstant.dart';
import '../screens/restaurant/dishdetailscreen.dart';

class DishCardUi extends StatefulWidget{
  late Dish dish;
  late int numDish;

  DishCardUi({super.key, required this.dish, required this.numDish});
  @override
  State<DishCardUi> createState() => _DishCardUiState();
}

class _DishCardUiState extends State<DishCardUi> {
  late bool isInFavList = false;
  final BasketController c = Get.put(BasketController());
  final FavoriteController favoriteController = Get.put(FavoriteController());
  @override
  Widget build(BuildContext context) {
    isInFavList = favoriteController.checkDInFavList(widget.dish);
     return SizedBox(
       height: 115.h,
       child: InkWell(
         onTap: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  DishDetailScreen()));
         },
         child: Card(
           surfaceTintColor: whiteC,
           color: whiteC,
           elevation: 5,
           child: Stack(
             children: [
               Align(
                 alignment: Alignment.bottomLeft,
                 child: Padding(
                   padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 10.w),
                   child: SizedBox(
                     width: 80.w,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         CircleAvatar(
                           backgroundColor: greenC,
                           radius: 12,
                           child: IconButton(
                             padding: EdgeInsets.zero,
                             icon:  const Icon(Icons.add),
                             color: Colors.white,
                             onPressed: (){
                                setState(() {
                                  widget.numDish++;
                                });
                                c.increment(widget.dish.price);
                                c.addOrder(Order(widget.dish, widget.numDish));
                             },
                           ),
                         ),
                         Text("${widget.numDish}",style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 22.sp),),
                         CircleAvatar(
                           backgroundColor: greenC,
                           radius: 12,
                           child: IconButton(
                             padding: EdgeInsets.zero,
                             icon: const Icon(Icons.remove),
                             color: Colors.white,
                             onPressed: () {
                               if(widget.numDish != 0){
                                 setState(() {
                                   widget.numDish--;
                                 });
                                 c.decrement(widget.dish.price);
                                 c.removeOrder(Order(widget.dish, widget.numDish));
                               }
                             },
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(widget.dish.name,style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 17.sp),),
                         Text(widget.dish.description,style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 10.sp,color: Colors.grey.shade500),),
                         Text(" ر.س${widget.dish.price}",style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 17,color: greenC),),
                         Text.rich(
                           TextSpan(
                             style: GoogleFonts.cairo(fontWeight: FontWeight.w400,fontSize: 13.sp),
                             children:  [
                               TextSpan(
                                 text: widget.dish.rating,
                               ),
                                WidgetSpan(
                                 child: Icon(Icons.star_border,size: 20.sp,),
                               ),
                             ],
                           ),
                         ),
                         Text.rich(
                           TextSpan(
                             style: GoogleFonts.cairo(fontWeight: FontWeight.w400,fontSize: 13.sp),
                             children:  [
                               TextSpan(
                                 text: ' ك${widget.dish.calories}',
                               ),
                                WidgetSpan(
                                 child: Icon(LineIcons.burn,size: 20.sp,),
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                     SizedBox(width: 15.w,),
                     ClipRRect(
                         borderRadius: const BorderRadius.only(topRight:  Radius.circular(13), bottomRight: Radius.circular(13)),
                         child: Image.asset(widget.dish.imgSrc,width: 120.w,height: 115.h, fit: BoxFit.fill,)
                     )
                   ],
                 ),
               ),
               Align(
                 alignment: Alignment.topLeft,
                 child: Padding(
                   padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 1.w),
                   child: IconButton(
                       onPressed: (){
                         favoriteController.addOrRemoveDFromFavList(widget.dish);
                         setState(() {
                           isInFavList = favoriteController.checkDInFavList(widget.dish);
                         });
                       },
                       icon: Icon(
                         isInFavList ? Icons.favorite : Icons.favorite_border_sharp,
                         color: greenC,
                       )
                   ),
                 ),
               ),
             ],
           ),
         ),
       ),
     );
  }
}