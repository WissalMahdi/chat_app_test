// ignore_for_file: prefer_const_constructors

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePageHelpersFormateur with ChangeNotifier {
  Widget bottomNavBaar(int index, PageController pageController) {
    return CustomNavigationBar(
      currentIndex: index,
      bubbleCurve: Curves.bounceIn,
      scaleCurve: Curves.decelerate,
      onTap: (val) {
        index = val;
        pageController.jumpToPage(val);
        notifyListeners();
      },
      backgroundColor: Colors.amber,
      items: [
        CustomNavigationBarItem(icon: Icon(Icons.home)),
        CustomNavigationBarItem(icon: Icon(Icons.add_circle_outline)),
        CustomNavigationBarItem(icon: Icon(Icons.account_circle)),
      ],
    );
  }
}
