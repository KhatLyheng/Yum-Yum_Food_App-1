import 'package:assignment_yum_yum_app/Pages/accountScreen.dart';
import 'package:assignment_yum_yum_app/Pages/cartScreen.dart';
import 'package:assignment_yum_yum_app/Pages/favoriteScreen.dart';
import 'package:assignment_yum_yum_app/Pages/homeScreen.dart';
import 'package:assignment_yum_yum_app/const_Colors/const.dart';
import 'package:flutter/material.dart';

import 'AppbarScreen.dart';

class MainScreenApp extends StatefulWidget {
  const MainScreenApp({super.key});

  @override
  State<MainScreenApp> createState() => _MainScreenAppState();
}
int _currentIndex = 0;

final List<Widget> _screens = [
  Homescreen(),
  CartScreen(),
  FavoriteScreen(),
  AccountScreen()

];
class _MainScreenAppState extends State<MainScreenApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppbarScreen(),
        backgroundColor: kbackgroundColor,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index){
          setState(() {
            _currentIndex = index;
          });
          },
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: ""),
      ]),
    );
  }
}


