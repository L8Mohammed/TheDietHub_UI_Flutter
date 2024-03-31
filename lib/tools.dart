import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tools{
  static svgToIcon(String path){
    return SvgPicture.asset(
        path,
        height: 12.h,
        color: Colors.white,
    );
  }
}