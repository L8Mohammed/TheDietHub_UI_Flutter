import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:thediet/constant/myconstant.dart';
import 'package:thediet/controller/basketcontroller.dart';
import 'package:thediet/models/order.dart';
import 'package:thediet/ui/dishcardui.dart';

class BasketScreen extends StatelessWidget{
  BasketScreen({super.key});

  final BasketController c = Get.put(BasketController());

  @override
  Widget build(BuildContext context) {
    late List<Order> orders = c.basket.value.orders;
    return SafeArea(
      child: orders.isEmpty
      ? basketIsEmptyUI()
      : Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                color: Colors.white,
                height: heightD-75.h-80.h-85.h,
                child: ListView.builder(
                  itemCount: orders.length,
                    itemBuilder: (context, index) {
                      return DishCardUi(dish: orders[index].dish, numDish: orders[index].quantity,);
                    },
                ),
              )
          ),
          Align(
            alignment: Alignment.bottomCenter,
              child: Container(
                height: 85.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), //color of shadow
                      spreadRadius: 2, //spread radius
                      blurRadius: 5, // blur radius
                      offset: const Offset(0, 0), // changes position of shadow
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Obx(() => Text(" ر.س ${c.basket.value.priceTotal}",style: GoogleFonts.cairo(fontWeight: FontWeight.w500,fontSize: 18.sp,color: greenC),),),
                          SizedBox(width: 10.w,),
                          Obx(() => Text("الإجمالي( ${c.basket.value.dishTotal}وجبة)",style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 15.sp,),),),
                        ],
                      ),
                    ),
                    //SizedBox(height: 5.h,),
                    SizedBox(
                      height: 45.h,
                      width: widthD * 0.6,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: greenC,
                          ),
                          onPressed: c.basket.value.dishTotal == 0 ? null : (){
                          },
                          child: Text("الدفع",style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 20.sp,color: Colors.white),)
                      ),
                    ),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }

  Widget basketIsEmptyUI(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/animations/emptybasket.json",height: 100.h,width: 100.w),
          Text("السلة فارغة",style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 20.sp))
        ],
      ),
    );
  }

}