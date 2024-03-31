import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:thediet/constant/myconstant.dart';
import 'package:thediet/screens/restaurant/restaurantsearchscreen.dart';

class AppBarRestaurant extends StatelessWidget implements PreferredSizeWidget {
  const AppBarRestaurant({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 75.h,
        backgroundColor: greenC,
        title:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("مطاعم",style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
            const SizedBox(width: 10,),
            SvgPicture.asset("assets/icons/mataim.svg",width: 40.w,color: Colors.white),
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Transform.rotate(
                angle: -pi/2,
                child:  IconButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const RestaurantSearchScreen()));
                  },
                  icon: const Icon(LineIcons.search,color: Colors.white,size: 30,),
                )
            ),
          ),
        ],
        leading: IconButton(
          icon: const Icon(LineIcons.arrowLeft,color: Colors.white,size: 30,),
          onPressed: (){
            Navigator.pop(context);
          },
        )
    );
  }

}