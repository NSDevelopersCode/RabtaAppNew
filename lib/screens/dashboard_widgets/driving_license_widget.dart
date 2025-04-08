import 'package:flutter/material.dart';
import 'package:raabta/generic_webview.dart';
import 'package:raabta/routes/route.dart';
import 'package:raabta/screens/dashboard.dart';
import 'package:raabta/screens/vehicle.dart';
import 'package:raabta/sham_updates/app/driving_license_fee/views/driving_license_fee_screen.dart';
import 'package:raabta/sham_updates/app/license_branches/views/license_branches_screen.dart';

class DrivingLicenseWidget extends StatelessWidget {
  const DrivingLicenseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blueGrey.shade50,
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16), // Added padding for better spacing
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align title to the left
        //     CrossAxisAlignment.center, // Align title to the left
        children: [
          Row(
            children: [
              Text(
                'Driving License',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade800,
                  letterSpacing: 1.2,
                ),
              ),
              Spacer(),
              // GestureDetector(
              //   onTap: () {},
              //   child: Text(
              //     'View all',
              //     style: TextStyle(
              //       fontSize: 12,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.blueGrey.shade800,
              //       letterSpacing: 1.2,
              //     ),
              //   ),
              // ),
            ],
          ),
          // const SizedBox(height: 08), // Space between title and cards
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //BTNS
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VehicleLicense()));
                    },
                    child: Main_Fun_btn_widget(
                      title: "License\nVerification",
                      icon: "assets/images/lv.png",
                    ),
                  ),
                ),

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const DrivingLicenseFeeScreen(),
                          ));
                    },
                    child: Main_Fun_btn_widget(
                      title: "Driving License\nFee",
                      icon: "assets/images/fees.png",
                    ),
                  ),
                ),

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRouter.liscense);
                    },
                    child: Main_Fun_btn_widget(
                      title: "License\nProcedure",
                      icon: "assets/images/id-card.png",
                      iconColor: Colors.teal,
                    ),
                  ),
                ),

                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) =>
                //             const GenericWebViewPage(
                //           url:
                //               'https://ttmswebview.a2z.care/RaabtaApp/DLFeeIndex',
                //           title: 'Driving License Fee',
                //         ),
                //       ),
                //     );
                //   },
                //   color: Colors.white.withOpacity(0.8),
                //   image: 'assets/images/fees.png',
                //   text: 'Driving License Fee',
                //   textColor: Colors.teal,
                // ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LicenseBranchesScreen(),
                        ),
                      );
                    },
                    child: Main_Fun_btn_widget(
                      title: "License\nBranches",
                      icon: "assets/images/drivers-license.png",
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GenericWebViewPage(
                                  url: 'https://ptpkp.gov.pk/driving-elicense/',
                                  title: 'Get E-License',
                                )),
                      );
                    },
                    child: Main_Fun_btn_widget(
                      title: "Get\nE-License",
                      icon: "assets/images/e-li.png",
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GenericWebViewPage(
                                  url:
                                      'https://dlfee.a2z.care/onlineuser/register',
                                  title: 'Apply for Learner & Duplicate',
                                )),
                      );
                    },
                    child: Main_Fun_btn_widget(
                      title: "Learner & Duplicate",
                      icon: "assets/images/get-e.png",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
