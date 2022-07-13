// ignore_for_file: prefer_const_constructors, duplicate_ignore, unnecessary_import
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageHelpersFormateur with ChangeNotifier {
  Widget bottomNavBaar(int index, PageController pageController) {
    return CustomNavigationBar(
        currentIndex: index,
        bubbleCurve: Curves.bounceIn,
        scaleCurve: Curves.decelerate,
        selectedColor: Color.fromARGB(255, 183, 134, 223),
        unSelectedColor: Colors.white,
        strokeColor: Color.fromARGB(255, 134, 72, 158),
        scaleFactor: 0.5,
        iconSize: 30.0,
        onTap: (val) {
          index = val;
          pageController.jumpToPage(val);
          notifyListeners();
        },
        backgroundColor: Color.fromARGB(255, 15, 15, 15),
        items: [
          CustomNavigationBarItem(icon: Icon(Icons.home)),
          CustomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
              //  size: 80,
            ),
          ),

          //CustomNavigationBarItem(icon: Icon(Icons.message_rounded)),
          CustomNavigationBarItem(icon: Icon(Icons.account_circle)),
        ]);
  }
}
