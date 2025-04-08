import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:raabta/controller/slider_controller.dart';
import 'package:raabta/generic_webview.dart';
import 'package:raabta/model/slider_model.dart';
import 'package:raabta/routes/route.dart';
import 'package:raabta/screens/challan.dart';
import 'package:raabta/screens/dashboard_widgets/driving_license_widget.dart';
import 'package:raabta/screens/google_map.dart';
import 'package:raabta/screens/traffic_sign_test/traffic_sign_test.dart';
import 'package:raabta/screens/vehicle.dart';
import 'package:raabta/sham_updates/app/admission_procedure/views/adminission_procedure_screen.dart';
import 'package:raabta/sham_updates/app/driving_license_fee/views/driving_license_fee_screen.dart';
import 'package:raabta/sham_updates/app/driving_school/views/driving_school_screen.dart';
import 'package:raabta/utils/media_query.dart';
import 'package:raabta/widgets/build_image.dart';
import 'package:raabta/widgets/dashboard_widgets/dashboard_card.dart';
import 'package:raabta/widgets/side_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Data>? sliderDataList;
  String baseUrl = 'https://raabta.ptpkp.gov.pk/dashboard/uploads/slider/';

  Future<void> getSliderData() async {
    try {
      final response = await http.get(
        Uri.parse('https://raabta.ptpkp.gov.pk/dashboard/api/services/sliders'),
      );
      if (response.statusCode == 200) {
        log(response.body.toString());
        Map<String, dynamic> map = json.decode(response.body.toString());
        SliderModel sliderModel = SliderModel.fromJosn(map);
        setState(() {
          sliderDataList = sliderModel.sliderModel;
        });
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      log('error:::$e');
    }
  }

  @override
  void initState() {
    getSliderData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'R A A B T A',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      // drawer: Padding(
      //   padding: EdgeInsets.only(top: screenheight(context) * 0.1),
      //   child: const SideBar(),
      // ),
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          // Positioned(
          //   top: 100,
          //   right: 0,
          //   bottom: 0,
          //   left: 0,
          //   child: Image.asset(
          //     //   'assets/images/kpk.png',
          //     'assets/images/bg.png',
          //     //   height: 200,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  sliderDataList != null
                      ? CarouselSlider.builder(
                          itemCount: sliderDataList!.length,
                          itemBuilder: (context, index, realIndex) {
                            if (sliderDataList!.isEmpty) {
                              // Return a placeholder or loading indicator
                              return const Center(
                                  child:
                                      CircularProgressIndicator()); // Example: Loading indicator
                            }
                            final images = sliderDataList![index].image;
                            final text = sliderDataList![index].title;
                            final correctImage = baseUrl + images;
                            return buildImage(correctImage, index, text);
                          },
                          options: CarouselOptions(
                            aspectRatio: 13 / 6,
                            autoPlay: true,
                            // height: 270,
                            onPageChanged: (index, reason) {
                              // print(index);
                              context
                                  .read<SliderController>()
                                  .changeIndex(index);
                            },
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                colors: [
                                  const Color.fromARGB(255, 86, 194, 90),
                                  Colors.green.shade900,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/logo3.png',
                                    height: 200,
                                    width: 300,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  // Text(
                                  //   'RAABTA',
                                  //   style: TextStyle(
                                  //     fontSize: 25,
                                  //     fontWeight: FontWeight.bold,
                                  //     color: Colors.white,
                                  //     letterSpacing: 3,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                  // SizedBox(
                  //     height: screenheight(context) * 0.20,
                  //     child: const Center(
                  //       child: CircularProgressIndicator(),
                  //     ),
                  //   ),
                  buildindicator(sliderDataList ?? []),

                  DrivingLicenseWidget(),
                  //Driving License

                  Container(
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
                    padding: const EdgeInsets.all(
                        16), // Added padding for better spacing
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // Align title to the left
                      children: [
                        Text(
                          'Driving Schools',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade800,
                            letterSpacing: 1.2,
                          ),
                        ),
                        // const SizedBox(height: 08), // Space between title and cards
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DashboardCard(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AdminissionProcedureScreen(),
                                  ),
                                );

                                // Navigator.of(context).pushNamed(AppRouter.weather);
                              },
                              color: Colors.white.withOpacity(0.6),
                              image: 'assets/images/ap.png',
                              text: 'Admission Procedure',
                              textColor: Colors.blueAccent,
                            ),
                            DashboardCard(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TrafficTrainingSchoolsScreen(),
                                    // GenericWebViewPage(
                                    //     url:
                                    //         'https://ttmswebview.a2z.care/RaabtaApp/DrivingSchoolIndex',
                                    //     title: 'Driving Schools'),
                                  ),
                                );

                                // Navigator.of(context).pushNamed(AppRouter.weather);
                              },
                              color: Colors.white.withOpacity(0.6),
                              image: 'assets/images/car.png',
                              text: 'Driving Schools',
                              textColor: Colors.orange,
                            ),
                            DashboardCard(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GenericWebViewPage(
                                        url:
                                            'https://ttmswebview.a2z.care/raabtaApp/DrivingTestAppointment',
                                        title: 'Driving Test Appointment'),
                                  ),
                                );

                                // Navigator.of(context).pushNamed(AppRouter.weather);
                              },
                              color: Colors.white.withOpacity(0.6),
                              image: 'assets/images/appi.png',
                              text: 'Driving Test Appointment',
                              textColor: Colors.black,
                            ),
                          ],
                        ),
                        // const SizedBox(height: 16), // Space between rows
                      ],
                    ),
                  ),

                  Container(
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
                    padding: const EdgeInsets.all(
                        16), // Added padding for better spacing
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // Align title to the left
                      children: [
                        Text(
                          'Traffic Offense',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade800,
                            letterSpacing: 1.2,
                          ),
                        ),
                        // const SizedBox(height: 08), // Space between title and cards
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DashboardCard(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        // builder: (context) => const VehicleLicense()));
                                        builder: (context) => const Challan()));
                              },
                              textColor: const Color.fromRGBO(24, 110, 180, 1),
                              color: Colors.white.withOpacity(0.8),
                              image: 'assets/images/cv.png',
                              text: 'Challan Verification',
                            ),
                            DashboardCard(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(AppRouter.offense);
                                },
                                textColor:
                                    const Color.fromRGBO(24, 110, 180, 1),
                                color: Colors.white.withOpacity(0.6),
                                image: 'assets/images/list.png',
                                text: 'Offense List'),
                          ],
                        ),
                        // const SizedBox(height: 16), // Space between rows
                      ],
                    ),
                  ),

                  Container(
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
                    padding: const EdgeInsets.all(
                        16), // Added padding for better spacing
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // Align title to the left
                      children: [
                        Text(
                          'Traffic Education',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade800,
                            letterSpacing: 1.2,
                          ),
                        ),
                        // const SizedBox(height: 08), // Space between title and cards
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DashboardCard(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(AppRouter.trafficeducation);
                              },
                              color: Colors.white.withOpacity(0.6),
                              image: 'assets/images/siren.png',
                              text: 'Traffic Education',
                              textColor: const Color.fromARGB(255, 162, 44, 35),
                            ),
                            DashboardCard(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TrafficSignTest()));
                              },
                              // imagecolors: const Color.fromARGB(255, 197, 120, 4),
                              color: Colors.white.withOpacity(0.6),
                              image: 'assets/images/checked.png',
                              text: 'Traffic Sign Test',
                              textColor: const Color.fromARGB(255, 197, 120, 4),
                            ),
                          ],
                        ),
                        // const SizedBox(height: 16), // Space between rows
                      ],
                    ),
                  ),

                  Container(
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
                    padding: const EdgeInsets.all(
                        16), // Added padding for better spacing
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // Align title to the left
                      children: [
                        Text(
                          'Other Services',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade800,
                            letterSpacing: 1.2,
                          ),
                        ),
                        // const SizedBox(height: 08), // Space between title and cards
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DashboardCard(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const GenericWebViewPage(
                                                url:
                                                    'https://ttmswebview.a2z.care/RaabtaApp/AddIncidentReport',
                                                title: 'Report Incident')));
                              },
                              color: Colors.white.withOpacity(0.6),
                              image: 'assets/images/report.png',
                              text: 'Report Incident',
                              textColor: const Color.fromARGB(255, 197, 120, 4),
                            ),
                            DashboardCard(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const GenericWebViewPage(
                                                url:
                                                    'https://ttmswebview.a2z.care/RaabtaApp/AddFeedBack',
                                                title: 'Feedback')));

                                // Navigator.of(context).pushNamed(AppRouter.weather);
                              },
                              color: Colors.white.withOpacity(0.6),
                              image: 'assets/images/feedback.png',
                              text: 'Feedback',
                              textColor: const Color.fromRGBO(24, 110, 180, 1),
                            ),
                            DashboardCard(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(AppRouter.emergencynumbers);
                                },
                                color: Colors.white.withOpacity(0.6),
                                image: 'assets/images/warn.png',
                                text: 'Emergency Numbers',
                                textColor: Colors.orange),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DashboardCard(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(AppRouter.weather);
                              },
                              color: Colors.white.withOpacity(0.6),
                              image: 'assets/images/cloudy.png',
                              text: 'Weather',
                              textColor: Colors.blueGrey.shade700,
                            ),
                            DashboardCard(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const GenericWebViewPage(
                                                url:
                                                    'https://ttmswebview.a2z.care/RaabtaApp/ImportantPlaces',
                                                title: 'Important Places')));

                                // Navigator.of(context).pushNamed(AppRouter.weather);
                              },
                              color: Colors.white.withOpacity(0.6),
                              image: 'assets/images/location-pin.png',
                              text: 'Important Places',
                              textColor: const Color.fromARGB(255, 162, 44, 35),
                            ),
                            DashboardCard(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SizedBox(
                                        width: screenwidth(context) * 0.3,
                                        child: AlertDialog(
                                          surfaceTintColor:
                                              Colors.green.shade200,
                                          content: SizedBox(
                                            height:
                                                screenheight(context) * 0.42,
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const Text(
                                                      'Call 24/7',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    RichText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: const TextSpan(
                                                          children: [
                                                            TextSpan(
                                                                text:
                                                                    'Traffic Updates Via SMS : Send PT to ',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .black)),
                                                            TextSpan(
                                                                text: '1915',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ]),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: BackdropFilter(
                                                        filter:
                                                            ImageFilter.blur(
                                                                sigmaX: 30,
                                                                sigmaY: 30),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.7),
                                                            border: Border.all(
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.7),
                                                            ),
                                                          ),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              launchUrl(Uri(
                                                                  scheme: 'tel',
                                                                  path:
                                                                      '091 – 9225356'));
                                                            },
                                                            child: ListTile(
                                                              leading:
                                                                  Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        10),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .primary,
                                                                ),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/telephone.png',
                                                                  height: 25,
                                                                  color: Colors
                                                                      .white,
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          color: Colors.white
                                                              .withOpacity(0.7),
                                                          border: Border.all(
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.7),
                                                          ),
                                                        ),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            launchUrl(Uri(
                                                                scheme: 'tel',
                                                                path: '1915'));
                                                          },
                                                          child: ListTile(
                                                            leading: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(10),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .primary,
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/telephone.png',
                                                                height: 25,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            title: const Text(
                                                                "HELP LINE"),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            _launchUrl(
                                                                youtubeUrl);
                                                          },
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          10),
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.4),
                                                                  border: Border.all(
                                                                      width: 1,
                                                                      color: Colors
                                                                          .white)),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(12),
                                                              child:
                                                                  Image.asset(
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
                                                            _launchUrl(
                                                                facebookUrl);
                                                          },
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          10),
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.4),
                                                                  border: Border.all(
                                                                      width: 1,
                                                                      color: Colors
                                                                          .white)),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(12),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/facebook.png',
                                                                height: 30,
                                                              )),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            _launchUrl(webUrl);
                                                          },
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          10),
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.4),
                                                                  border: Border.all(
                                                                      width: 1,
                                                                      color: Colors
                                                                          .white)),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(12),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/web.png',
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

                                // Navigator.of(context).pushNamed(AppRouter.weather);
                              },
                              color: Colors.white.withOpacity(0.6),
                              image: 'assets/images/phone.png',
                              text: 'Contact Us',
                              textColor: const Color.fromARGB(255, 162, 44, 35),
                            ),
                          ],
                        ),

                        // const SizedBox(height: 16), // Space between rows
                      ],
                    ),
                  ),

                  //
                  // Row(
                  //   children: [
                  //
                  //
                  //
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //
                  //
                  //   ],
                  // ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  final webUrl = Uri.parse('https://ptpkp.gov.pk/');
  final facebookUrl =
      Uri.parse('https://www.facebook.com/CityTrafficPolicePeshawar');

  final youtubeUrl =
      Uri.parse('https://www.youtube.com/CityTrafficPolicePeshawar');
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}

class Main_Fun_btn_widget extends StatelessWidget {
  final String title;
  final String icon;
  var iconColor;

  Main_Fun_btn_widget({
    required this.title,
    required this.icon,
    this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                '$icon',
                height: 40,
                color: iconColor,
                fit: BoxFit.cover,
              ),
            )),
        SizedBox(height: 5),
        Text(
          '$title',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.blueGrey.shade800,
          ),
          textAlign: TextAlign.center,
        )
            .animate()
            .slideX(
                delay: const Duration(milliseconds: 200),
                duration: const Duration(milliseconds: 200))
            .fade(),
      ],
    );
  }
}

class LicenseScreen extends StatefulWidget {
  @override
  _LicenseScreenState createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {
  bool showAll = false; // State to track whether to show all buttons

  final List<Map<String, dynamic>> buttons = [
    {
      "title": "License\nVerification",
      "icon": "assets/images/lv.png",
      "route": VehicleLicense()
    },
    {
      "title": "Driving License\nFee",
      "icon": "assets/images/fees.png",
      "url": 'https://ttmswebview.a2z.care/RaabtaApp/DLFeeIndex'
    },
    {
      "title": "License\nProcedure",
      "icon": "assets/images/id-card.png",
      "route": AppRouter.liscense,
      "iconColor": Colors.teal
    },
    {
      "title": "License\nBranches",
      "icon": "assets/images/drivers-license.png",
      "url": 'https://ttmswebview.a2z.care/RaabtaApp/DLBranchesIndex'
    },
    {"title": "Test Button", "icon": "assets/images/test.png", "route": ""},
    {"title": "More License", "icon": "assets/images/more.png", "route": ""},
    {"title": "Renew License", "icon": "assets/images/renew.png", "route": ""},
    {"title": "Lost License", "icon": "assets/images/lost.png", "route": ""},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueGrey.shade50, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    showAll =
                        !showAll; // Toggle the state to show/hide all buttons
                  });
                },
                child: Text(
                  showAll ? 'Show Less' : 'View All',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey.shade800,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // 4 buttons per row
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1.1,
            ),
            itemCount:
                showAll ? buttons.length : 4, // Show all buttons if expanded
            itemBuilder: (context, index) {
              final item = buttons[index];
              return GestureDetector(
                onTap: () {
                  if (item["route"] != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => item["route"]));
                  } else if (item["url"] != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenericWebViewPage(
                          url: item["url"],
                          title: item["title"],
                        ),
                      ),
                    );
                  }
                },
                child: Main_Fun_btn_widget(
                  title: item["title"],
                  icon: item["icon"],
                  iconColor: item["iconColor"] ?? Colors.black,
                ),
              );
            },
          ),
          // SizedBox(height: 50),
        ],
      ),
    );
  }
}
