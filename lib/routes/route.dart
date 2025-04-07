import 'package:flutter/material.dart';
import 'package:raabta/screens/License/conversion.dart';
import 'package:raabta/screens/License/dublicate.dart';
import 'package:raabta/screens/License/endoresment.dart';
import 'package:raabta/screens/License/fresh_driving_license.dart';
import 'package:raabta/screens/License/international_driving_permit.dart';
import 'package:raabta/screens/License/learner_permit.dart';
import 'package:raabta/screens/License/renewal.dart';
import 'package:raabta/screens/afghan/afghan_driving_license.dart';
import 'package:raabta/screens/afghan/learner_permit.dart';
import 'package:raabta/screens/dashboard.dart';
import 'package:raabta/screens/emergency.dart';
import 'package:raabta/screens/home.dart';
import 'package:raabta/screens/liscense_procedure.dart';
import 'package:raabta/screens/offense_list.dart';
import 'package:raabta/screens/officials/driving_license.dart';
import 'package:raabta/screens/officials/learner_permit.dart';
import 'package:raabta/screens/traffic_education/traffic_education.dart';
import 'package:raabta/screens/weather.dart';
import 'package:raabta/splash.dart';

class AppRouter {
  static const String splash = '/';
  static const String home = '/home';
  static const String offense = '/offense';
  static const String liscense = '/liscense';
  static const String permit = '/permit';
  static const String fresh = '/freshDrivingLicesne';
  static const String conversion = '/drivingConversion';
  static const String dublicate = '/drivingDublicate';
  static const String endoresement = '/endorsment';
  static const String renewal = '/renewal';
  static const String international = '/international';
  static const String afghanlearnerpermit = '/afghanlearnerpermit';
  static const String afghandrivinglicense = '/afghandrivinglicense';
  static const String internationalpermit = '/internationalpermit';
  static const String internationallicense = '/internationallicense';
  static const String trafficeducation = '/trafficeducation';
  static const String emergencynumbers = '/emergencynumbers';
  static const String weather = '/weather';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const Splash());

      case home:
        // return MaterialPageRoute(builder: (context) => const Home());
        return MaterialPageRoute(builder: (context) =>                    Dashboard(),
            );

      case offense:
        return MaterialPageRoute(builder: (context) => const OffenseList());
      case trafficeducation:
        return MaterialPageRoute(
            builder: (context) => const TrafficEducation());
      case emergencynumbers:
        return MaterialPageRoute(
            builder: (context) => const EmergencyNumbers());
      case weather:
        return MaterialPageRoute(builder: (context) => const Weather());

      case liscense:
        return MaterialPageRoute(
          builder: (context) => const LiscenseProcedure(),
        );
      case permit:
        return MaterialPageRoute(
          builder: (context) => const LearnerPermit(),
        );
      case fresh:
        return MaterialPageRoute(
          builder: (context) => const FreshDrivingLicense(),
        );
      case conversion:
        return MaterialPageRoute(
          builder: (context) => const LicenseConversion(),
        );
      case dublicate:
        return MaterialPageRoute(
          builder: (context) => const LicenseDublicate(),
        );
      case endoresement:
        return MaterialPageRoute(
          builder: (context) => const LicenseEndoresment(),
        );
      case renewal:
        return MaterialPageRoute(
          builder: (context) => const LicenseRenewal(),
        );
      case international:
        return MaterialPageRoute(
          builder: (context) => const InternationalPermit(),
        );
      case afghanlearnerpermit:
        return MaterialPageRoute(
          builder: (context) => const AfghanLearnerPermit(),
        );
      case afghandrivinglicense:
        return MaterialPageRoute(
          builder: (context) => const AfghanDrivingLicense(),
        );
      case internationalpermit:
        return MaterialPageRoute(
          builder: (context) => const InternationalLearnerPermit(),
        );
      case internationallicense:
        return MaterialPageRoute(
          builder: (context) => const InternationalDrivingLicense(),
        );
    }
    return null;
  }
}
