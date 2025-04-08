import 'package:flutter/material.dart';
import 'package:raabta/utils/app_color.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: const Color(0xFFFFFFFF),
    primary: Colors.green.shade900,
    secondary: AppColor.white,
  ),
);
// ThemeData darkMode = ThemeData(
//   brightness: Brightness.dark,
//   colorScheme: const ColorScheme.dark(
//     background: Color.fromARGB(255, 112, 110, 110),
//     primary: Color.fromARGB(255, 29, 29, 29),
//     secondary: AppColor.white,
//   ),
// );
