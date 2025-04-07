import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raabta/controller/ui_controller.dart';
import 'package:raabta/routes/route.dart';
import 'package:raabta/screens/challan.dart';
import 'package:raabta/screens/liscense_procedure.dart';
import 'package:raabta/screens/offense_list.dart';
import 'package:raabta/screens/traffic_education/traffic_education.dart';
import 'package:raabta/screens/vehicle.dart';
import 'package:raabta/utils/media_query.dart';
import 'package:raabta/webview/website.dart';
import 'package:url_launcher/url_launcher.dart';

class SideBar extends StatefulWidget {
  const SideBar({
    super.key,
  });

  @override
  State<SideBar> createState() => _SideBarState();
}

final facebookUrl =
    Uri.parse('https://www.facebook.com/CityTrafficPolicePeshawar');

final youtubeUrl =
    Uri.parse('https://www.youtube.com/CityTrafficPolicePeshawar');
Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 245, 247, 245),
      key: widget.key,
      width: screenwidth(context) * 0.65,
      // backgroundColor: Colors.white.shade300,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              tileColor: Colors.white,
              splashColor: Colors.blue.shade100,
              onTap: () {
                if (mounted) {
                  context.read<UIcontroller>().changeindex(0);
                  Navigator.of(context).pushReplacementNamed(AppRouter.home);
                }
              },
              leading: Image.asset(
                'assets/images/home.png',
                height: 30,
              ),
              title: const Text('Home'),
            ),
            const SizedBox(
              height: 3,
            ),
            ListTile(
              tileColor: Colors.white,
              splashColor: Colors.blue.shade100,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const KPKTraffic()));
              },
              leading: Image.asset(
                'assets/images/earth.png',
                height: 30,
              ),
              title: const Text('KP Website'),
            ),
            const SizedBox(
              height: 3,
            ),
            ListTile(
              tileColor: Colors.white,
              splashColor: Colors.blue.shade100,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OffenseList()));
              },
              leading: Image.asset(
                'assets/images/list.png',
                height: 30,
              ),
              title: const Text('Offense List'),
            ),
            const SizedBox(
              height: 3,
            ),
            ListTile(
              tileColor: Colors.white,
              splashColor: Colors.blue.shade100,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LiscenseProcedure()));
              },
              leading: Image.asset(
                'assets/images/card.png',
                height: 30,
              ),
              title: const Text('License Procedure'),
            ),
            const SizedBox(
              height: 3,
            ),
            ListTile(
              tileColor: Colors.white,
              splashColor: Colors.blue.shade100,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TrafficEducation()));
              },
              leading: Image.asset(
                'assets/images/crisis.png',
                height: 30,
              ),
              title: const Text('Traffic Education'),
            ),
            const SizedBox(
              height: 3,
            ),
            ListTile(
              tileColor: Colors.white,
              splashColor: Colors.blue.shade100,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Challan()));
              },
              leading: Image.asset(
                'assets/images/invoice.png',
                height: 30,
              ),
              title: const Text('Challan Verify'),
            ),
            const SizedBox(
              height: 3,
            ),
            ListTile(
              tileColor: Colors.white,
              splashColor: Colors.blue.shade100,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VehicleLicense()));
              },
              leading: Image.asset(
                'assets/images/invoice.png',
                height: 30,
              ),
              title: const Text('Vehicle Verify'),
            ),
            const SizedBox(
              height: 3,
            ),
            ListTile(
              tileColor: Colors.white,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        width: screenwidth(context) * 0.3,
                        child: AlertDialog(
                          surfaceTintColor: Colors.green.shade200,
                          content: SizedBox(
                            height: screenheight(context) * 0.42,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Call 24/7',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: const TextSpan(children: [
                                        TextSpan(
                                            text:
                                                'Traffic Updates Via SMS : Send PT to ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black)),
                                        TextSpan(
                                            text: '8583',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                      ]),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 30, sigmaY: 30),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color:
                                                Colors.white.withOpacity(0.7),
                                            border: Border.all(
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                            ),
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              launchUrl(Uri(
                                                  scheme: 'tel',
                                                  path: '091 – 9225356'));
                                            },
                                            child: ListTile(
                                              leading: Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/telephone.png',
                                                  height: 25,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              title: const Text(
                                                  "DIG TRAFFIC POLICE"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.white.withOpacity(0.7),
                                          border: Border.all(
                                            color:
                                                Colors.white.withOpacity(0.7),
                                          ),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            launchUrl(Uri(
                                                scheme: 'tel', path: '1915'));
                                          },
                                          child: ListTile(
                                            leading: Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                              child: Image.asset(
                                                'assets/images/telephone.png',
                                                height: 25,
                                                color: Colors.white,
                                              ),
                                            ),
                                            title: const Text("HELP LINE"),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            _launchUrl(youtubeUrl);
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white
                                                      .withOpacity(0.4),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.white)),
                                              padding: const EdgeInsets.all(12),
                                              child: Image.asset(
                                                'assets/images/youtube.png',
                                                height: 30,
                                              )),
                                        ),
                                        // Container(
                                        //     decoration: BoxDecoration(
                                        //         borderRadius:
                                        //             BorderRadius.circular(10),
                                        //         color: Colors.white
                                        //             .withOpacity(0.4),
                                        //         border: Border.all(
                                        //             width: 1,
                                        //             color: Colors.white)),
                                        //     padding: const EdgeInsets.all(12),
                                        //     child: Image.asset(
                                        //       'assets/images/twitter.png',
                                        //       height: 30,
                                        //     )),
                                        GestureDetector(
                                          onTap: () {
                                            _launchUrl(facebookUrl);
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white
                                                      .withOpacity(0.4),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.white)),
                                              padding: const EdgeInsets.all(12),
                                              child: Image.asset(
                                                'assets/images/facebook.png',
                                                height: 30,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              leading: Image.asset(
                'assets/images/phone.png',
                height: 35,
              ),
              title: const Text('Contact Us'),
            ),
          ],
        ),
      ),
    );
  }
}
