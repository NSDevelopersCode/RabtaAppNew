import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raabta/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  // bool _isdark = false;
  ThemeData _theme = lightMode;

  ThemeData get theme => _theme;

  // bool get isdark => _isdark;
  set theme(ThemeData themeData) {
    _theme = themeData;
    // isdark = true;
    notifyListeners();
  }

  TextTheme get textThemeWithGoogleFonts {
    return GoogleFonts.nunitoTextTheme(_theme.textTheme);
    // Replace 'Roboto' with the desired Google Font
  }

  // void toggleTheme() {
  //   _isdark = !_isdark;
  //   theme = _isdark ? darkMode : lightMode;
  //   notifyListeners();
  // }
}
