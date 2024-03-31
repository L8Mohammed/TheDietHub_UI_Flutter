import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:thediet/constant/myconstant.dart';
import 'package:thediet/screens/homescreen.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: whiteC,
      resizeToAvoidBottomInset : false,
      //appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.only(top: heightD*0.03),
            child: Center(child: Image.asset("assets/images/logogreen.png",width: 250.w)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("مرحبا بك",style: GoogleFonts.cairo(fontWeight: FontWeight.w700,fontSize: 26.sp),),
              const SizedBox(height: 25,),
              SizedBox(
                width: 250.w,
                height: 50.h,
                child: FilledButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.size,
                          alignment: Alignment.center,
                          curve: Curves.ease,

                          duration: const Duration(milliseconds: 300),
                          child: const HomeScreen(),
                        ),
                      );
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen()));
                    },
                    child: Text("تسجيل الدخول",style: GoogleFonts.cairo(fontWeight: FontWeight.bold,fontSize: 15.sp),)
                ),
              ),
              SizedBox(height: 13.h,),
              SizedBox(
                width: 250.w,
                height: 50.h,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.green
                    )
                  ),
                  onPressed: () {},
                  child:  Text('إنشاء حساب',style: GoogleFonts.cairo(fontWeight: FontWeight.bold,color: Colors.green,fontSize: 15.sp),),
                ),
              ),
              SizedBox(height: 15.h,),
              Container(
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(
                        color: Colors.black,
                        width: 1.5, // Underline thickness
                      ))
                  ),
                  child: Text("الدخول كضيف",style: GoogleFonts.cairo(fontWeight: FontWeight.w700,fontSize: 15.sp),)
              ),
            ],
          )
        ],
      ),
    );
  }

}
