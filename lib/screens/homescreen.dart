import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:thediet/constant/myconstant.dart';
import 'package:thediet/screens/restaurant/rhomescreen.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final controller = PageController(viewportFraction: 1, keepPage: true);
  List<Widget> pages = [
    Container(
      height: heightD * 0.15,
      width: widthD * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/test.jpg")
        )
      ),
    ),
    Container(
      height: heightD * 0.15,
      width: widthD * 0.85,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade300,
          image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/test.jpg")
          )
      ),
    ),
    Container(
      height: heightD * 0.15,
      width: widthD * 0.85,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade300,
          image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/test.jpg")
          )
      ),
    ),
  ];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
       appBar: AppBar(
         toolbarHeight: 75.h,
         backgroundColor: greenC,
         title: Image.asset("assets/images/logowhite.png",width: 65.w),
         centerTitle: true,
         actions: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Transform.rotate(
                 angle: -pi/2,
             child:  const Icon(LineIcons.search,color: Colors.white,size: 30,)
             ),
           ),
         ],
         leading: IconButton(
           icon: const Icon(LineIcons.arrowLeft,color: Colors.white,size: 30,),
           onPressed: (){
             Navigator.pop(context);
           },
         )
       ),
      body: Container(
          width: widthD,
          height: heightD,
          //padding: const EdgeInsets.symmetric(vertical: 10),
          color: greenLightC,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  SingleChildScrollView(
                    child: SizedBox(
                      height: heightD * 0.15,
                      width: widthD * 0.85,
                      child: PageView.builder(
                        controller: controller,
                        // itemCount: pages.length,
                        itemBuilder: (_, index) {
                          return pages[index % pages.length];
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  SmoothPageIndicator(
                    controller: controller,
                    count: pages.length,
                    effect: const WormEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      activeDotColor: greenC,
                      dotColor: whiteC,
                      type: WormType.thinUnderground,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.h,),
              Column(
                children: [
                  Text("إختر من التالي لإستكمال تصفح",style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 15.sp),),
                  SizedBox(height: 10.h,),
                  Text("التطبيق بكل سهولة وأمان",style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 15.sp),),
                ],
              ),
              Container(
                height: 120.h,
                width: widthD * 0.95,
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.leftToRight,
                        alignment: Alignment.center,
                        curve: Curves.ease,

                        duration: const Duration(milliseconds: 400),
                        child: const RHomeScreen(),
                      ),
                    );
                     //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  RHomeScreen()));
                  },
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: widthD * 0.015),
                    surfaceTintColor: greenC,
                    color: greenC,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("مطاعم",style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 25.sp,color: whiteC),textDirection: TextDirection.rtl,),
                            SizedBox(height: 5.h,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: Icon(LineIcons.arrowLeft,color: whiteC,weight: 50,),
                                ),
                                Text("أفضل الوجبات المتاحة لجميع  \n الفئات في كل المطاعم",style: GoogleFonts.cairo(fontWeight: FontWeight.w600,),textDirection: TextDirection.rtl,),
                              ],
                            )
                          ],
                        ),
                       SvgPicture.asset(
                       "assets/icons/mataim.svg",
                        width: 80.w,
                         color: whiteC,
                      )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 120.h,
                width: widthD * 0.95,
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: widthD * 0.015),
                  surfaceTintColor: greenC,
                  color: greenC,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("مكملات غذائية",style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 25.sp,color: whiteC),textDirection: TextDirection.rtl,),
                          SizedBox(height: 5.h,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top: 10.h),
                                child:   Icon(LineIcons.arrowLeft,color: whiteC,weight: 50,),
                              ),
                              Text("  جميع أنواع المكملات الغذائية \n المتاحة في جميع المتاجر",style: GoogleFonts.cairo(fontWeight: FontWeight.w600,),textDirection: TextDirection.rtl,),
                            ],
                          )
                        ],
                      ),
                      SvgPicture.asset(
                        "assets/icons/mokamilat.svg",
                        width: 80.w,
                        color: whiteC,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
