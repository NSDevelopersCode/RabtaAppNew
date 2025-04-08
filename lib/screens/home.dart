import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raabta/controller/ui_controller.dart';
import 'package:raabta/screens/challan.dart';
import 'package:raabta/screens/dashboard.dart';
import 'package:raabta/screens/vehicle.dart';
import 'package:raabta/widgets/my_nav.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyNav(),
      body: Consumer<UIcontroller>(
        builder: (context, provider, child) {
          return WillPopScope(
            onWillPop: () async {
              log('this is executing');
              if (provider.currentIndex != 0) {
                // If not on the dashboard screen, navigate to the dashboard

                provider.changeindex(0);

                return false; // Prevent default back button behavior
              } else {
                // If on the dashboard screen, allow app to close
                return true; // Allow default back button behavior
              }
            },
            child: PageStorage(
              bucket: provider.pageStorageBucket,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: provider.pageController,
                onPageChanged: (value) {
                  // provider.changeindex(value);
                  log('page ${provider.currentIndex.toString()}');
                },
                children: const [
                  Dashboard(),
                  Challan(),
                  VehicleLicense(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
