import 'package:flutter/material.dart';

class UIcontroller extends ChangeNotifier {
  late int currentIndex = 0;
  late PageController pageController;

  late PageStorageBucket pageStorageBucket;
  UIcontroller() {
    // Initialize the PageController in the constructor
    pageController = PageController(initialPage: 0);
    pageStorageBucket = PageStorageBucket();
  }

  void changeindex(int index) {
    currentIndex = index;
    pageController.jumpToPage(
      currentIndex,
      // duration: const Duration(milliseconds: 10),
      // curve: Curves.easeIn,
    );
    notifyListeners();
  }
}
