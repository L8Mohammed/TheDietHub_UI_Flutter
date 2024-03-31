import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:thediet/controller/basketcontroller.dart';
import 'package:thediet/controller/restaumenucontroller.dart';
import 'package:thediet/screens/restaurant/basketscreen.dart';
import 'package:thediet/screens/restaurant/restaurantfavoritescreen.dart';
import 'package:thediet/screens/restaurant/restaurantlistscreen.dart';
import 'package:thediet/screens/restaurant/restaurantsearchscreen.dart';
import 'package:thediet/ui/appbarrestaurant.dart';

import '../../constant/myconstant.dart';

class RHomeScreen extends StatefulWidget{
  const RHomeScreen({super.key});

  @override
  State<RHomeScreen> createState() => _RHomeScreenState();
}

class _RHomeScreenState extends State<RHomeScreen> {

  int _selectedTab = 0;
  final BasketController c = Get.put(BasketController());
  final List _pages = [
    const RestaurantListScreen(),
    const RestaurantFavoriteScreen(),
     const Center(
       child: Text("My Account"),
     ),
     BasketScreen(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }


  @override
  void initState() {
    super.initState();
    if(c.goToBasket.value){
      _selectedTab = 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: whiteC,
      appBar: AppBarRestaurant(),
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectedTab,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        useLegacyColorScheme: false,
        selectedLabelStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold,color: Colors.black),
        unselectedLabelStyle: GoogleFonts.cairo(color: Colors.black),
        onTap: (index) => _changeTab(index),
        selectedItemColor: greenC,
        unselectedItemColor: greenC.withOpacity(0.5),
        items: const [
          BottomNavigationBarItem(icon: Icon(LineIcons.store), label: "الرئيسية"),
          BottomNavigationBarItem(icon: Icon(LineIcons.heart), label: "المفضلة"),
          BottomNavigationBarItem(icon: Icon(LineIcons.userCircle), label: "حسابي"),
          BottomNavigationBarItem(icon: Icon(LineIcons.shoppingBag), label: "السلة"),
        ],
      ),
    );
  }
}
