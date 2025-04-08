import 'package:flutter/material.dart';

class LoadingController extends ChangeNotifier {
  bool isloading = false;

  startloading() {
    isloading = true;
    notifyListeners();
  }

  stopLoading() {
    isloading = false;
    notifyListeners();
  }
}
