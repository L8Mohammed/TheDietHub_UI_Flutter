import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/myconstant.dart';
import '../models/category.dart';

class CategoryItemUi extends StatelessWidget{
  // data variable
  Category c;
  // 
  int index;

  CategoryItemUi({super.key,required this.c, required this.index});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: 105.w,
      height: 45.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: index == c.index ? greenC : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), //color of shadow
            spreadRadius: 0, //spread radius
            blurRadius: 2, // blur radius
            offset: const Offset(0, 2), // changes position of shadow
          )
        ],
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(c.name,style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 12.sp,color: index == c.index ? Colors.white : Colors.black),textDirection: TextDirection.rtl,),
          SvgPicture.asset(
            c.icon,
            width: 25.w,
            color: index == c.index ? Colors.white : Colors.black,
          )
        ],
      ),
    );
  }

}