import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:raabta/controller/loading_controller.dart';
import 'package:raabta/controller/map_permission.dart';
import 'package:raabta/controller/score.dart';
import 'package:raabta/controller/slider_controller.dart';
import 'package:raabta/controller/ui_controller.dart';
import 'package:raabta/controller/weather_controller.dart';
import 'package:raabta/routes/route.dart';
import 'package:raabta/sham_updates/app/driving_license_fee/views/driving_license_fee_screen.dart';
import 'package:raabta/theme/theme_provider.dart';
import 'package:raabta/utils/app_color.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const RaabtaApp(),
    ),
  );
}

class RaabtaApp extends StatelessWidget {
  const RaabtaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => UIcontroller(),
          ),
          ChangeNotifierProvider(create: (context) => SliderController()),
          ChangeNotifierProvider(create: (context) => TotalScore()),
          ChangeNotifierProvider(create: (context) => GetPermissionLocation()),
          ChangeNotifierProvider(create: (context) => WeatherController()),
          ChangeNotifierProvider(create: (context) => LoadingController()),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, theme, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.light,
                colorScheme: ColorScheme.light(
                  surface: AppColor.white,
                  primary: Colors.green.shade800,
                  secondary: const Color.fromARGB(255, 194, 227, 237),
                ),
                textTheme:
                    GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
                // Other theme properties can be customized here if needed
              ),
              // theme: theme.theme.copyWith(
              //   // Use Google Fonts for the entire app text theme
              //   textTheme: theme.textThemeWithGoogleFonts,
              //   // You can customize other theme properties here if needed
              // ),
              // theme: ThemeData(

              //   // textTheme:
              //   //     GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
              // ),

              // home: DrivingLicenseFeeScreen(),
              onGenerateRoute: (settings) {
                return AppRouter.onGenerateRoute(settings);
              },
            );
          },
        ));
  }
}
