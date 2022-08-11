// ignore_for_file: prefer_const_constructors, duplicate_ignore, unnecessary_import
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageHelpers with ChangeNotifier {
  Widget bottomNavBar(int index, PageController pageController) {
    return CustomNavigationBar(
        currentIndex: index,
        bubbleCurve: Curves.bounceIn,
        scaleCurve: Curves.decelerate,
        selectedColor: Color.fromARGB(255, 9, 17, 134),
        unSelectedColor: Colors.white,
        strokeColor: Color.fromARGB(255, 82, 55, 233),
        scaleFactor: 0.5,
        iconSize: 30.0,
        onTap: (val) {
          index = val;
          pageController.jumpToPage(val);
          notifyListeners();
        },
        backgroundColor: Color.fromARGB(255, 48, 117, 182),
        items: [
          CustomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
              )),
          CustomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
              ),
              title: Text(
                "Search",
                style: TextStyle(color: Colors.white),
              )),
          CustomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.white),
              )),
        ]);
  }
}
