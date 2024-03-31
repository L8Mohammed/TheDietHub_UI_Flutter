import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';
import 'package:thediet/screens/welcomescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          home: const WelcomeScreen(),
        );
      },
      //child: const HomePage(title: 'First Method'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});


  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedTab = 0;

  final List _pages = [
    const Center(
      child: Text("Home"),
    ),
    const Center(
      child: Text("About"),
    ),
    const Center(
      child: Text("Products"),
    ),
    const Center(
      child: Text("Contact"),
    ),
    const Center(
      child: Text("Settings"),
    ),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        useLegacyColorScheme: true,
        selectedLabelStyle: const TextStyle(color: Colors.green),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(icon: Icon(LineIcons.search), label: "More"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border_sharp), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: "Account"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "Bag"),
        ],
      ),
    );
  }
}
