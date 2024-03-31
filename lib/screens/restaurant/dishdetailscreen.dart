import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:thediet/ui/appbarrestaurant.dart';

import '../../constant/myconstant.dart';

class DishDetailScreen extends StatefulWidget{
  @override
  State<DishDetailScreen> createState() => _DishDetailScreenState();
}

class _DishDetailScreenState extends State<DishDetailScreen> {

  final controller = PageController(viewportFraction: 1, keepPage: true);
  List<Widget> pages = [
    Image.asset("assets/images/fish.jpg",fit: BoxFit.cover,width: widthD * 0.8,
      height: heightD * 0.25,),
    Image.asset("assets/images/dish1.jpeg",fit: BoxFit.cover,width: widthD * 0.8,
      height: heightD * 0.25,),
    Image.asset("assets/images/dish2.jpg",fit: BoxFit.cover,width: widthD * 0.8,
      height: heightD * 0.25,),
  ];
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     resizeToAvoidBottomInset : false,
     backgroundColor: whiteC,
     appBar: const AppBarRestaurant(),
     body: SafeArea(
       child: Stack(
         children: [
           Align(
             alignment: Alignment.bottomCenter,
             child: Container(
               height: heightD * 0.7,
               decoration: const BoxDecoration(
                 borderRadius: BorderRadius.only(topLeft: Radius.circular(200)),
                 color: greenLightC,
               ),
             ),
           ),
           Center(
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 SizedBox(height: heightD * 0.04,),
                 SizedBox(
                   width: widthD * 0.8,
                   height: heightD * 0.25,
                   child: Center(
                     child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: Colors.white,
                         boxShadow: [
                           BoxShadow(
                             color: Colors.grey.withOpacity(0.5), //color of shadow
                             spreadRadius: 0, //spread radius
                             blurRadius: 2, // blur radius
                             offset: const Offset(0, 2), // changes position of shadow
                           )
                         ],
                       ),
                       child: Stack(
                         children: [
                           Align(
                             alignment: Alignment.center,
                             child:  SizedBox(
                               width: widthD * 0.8,
                               height: heightD * 0.25,
                               child: ClipRRect(
                                 borderRadius: BorderRadius.circular(20.0),
                                 child: PageView.builder(
                                   controller: controller,
                                   // itemCount: pages.length,
                                   itemBuilder: (_, index) {
                                     return pages[index % pages.length];
                                   },
                                 ),
                               ),
                             ),
                           ),
                           Align(
                             alignment: Alignment.centerRight,
                             child: Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 8.0),
                               child: CircleAvatar(
                                 backgroundColor: greenC,
                                 radius: 20,
                                 child: IconButton(
                                   padding: EdgeInsets.zero,
                                   icon:  const Icon(Icons.arrow_forward_ios_sharp),
                                   color: Colors.white,
                                   onPressed: (){
                                     setState(() {
                                         controller.animateToPage(controller.page!.toInt() + 1,
                                             duration: const Duration(milliseconds: 400),
                                             curve: Curves.easeIn
                                         );
                                     });
                                   },
                                 ),
                               ),
                             ),
                           ),
                           Align(
                             alignment: Alignment.centerLeft,
                             child: Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 8.0),
                               child: CircleAvatar(
                                 backgroundColor: greenC,
                                 radius: 20,
                                 child: IconButton(
                                   padding: EdgeInsets.zero,
                                   icon:  const Icon(Icons.arrow_back_ios_new_sharp),
                                   color: Colors.white,
                                   onPressed: (){
                                     setState(() {
                                       controller.animateToPage(controller.page!.toInt() - 1,
                                           duration: const Duration(milliseconds: 400),
                                           curve: Curves.easeIn
                                       );
                                     });
                                   },
                                 ),
                               ),
                             ),
                           ),
                           const Align(
                             alignment: Alignment.topRight,
                             child: Padding(
                               padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
                               child: Icon(Icons.favorite_outline_sharp,color: greenC,size: 40,),
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
                 const SizedBox(height: 10,),
                 Text("سمك مشوي",style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 25.sp),),
                 Text("600 ر.س",style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 25.sp,color: greenC),),
                 const SizedBox(height: 5,),
                 Text.rich(
                   TextSpan(
                     style: GoogleFonts.cairo(fontWeight: FontWeight.w400,fontSize: 20.sp),
                     children: const [
                       TextSpan(
                         text: '4.6 (1022)',
                       ),
                       WidgetSpan(
                         child: Icon(Icons.star_outlined,size: 40),
                       ),
                     ],
                   ),
                 ),
                 //const SizedBox(height: 5,),
                 Text.rich(
                   TextSpan(
                     style: GoogleFonts.cairo(fontWeight: FontWeight.w400,fontSize: 20.sp),
                     children: const [
                       TextSpan(
                         text: '1000 ك',
                       ),
                       WidgetSpan(
                         child: Icon(Icons.local_fire_department_sharp,size: 40,),
                       ),
                     ],
                   ),
                 ),
                 SizedBox(height: 10.h,),
               ],
           ),
            ),
         ],
       ),
     ),
   );
  }
}
