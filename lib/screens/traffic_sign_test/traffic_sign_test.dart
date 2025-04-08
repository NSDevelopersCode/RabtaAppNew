import 'package:flutter/material.dart';
import 'package:raabta/screens/prepare.dart';
import 'package:raabta/screens/score.dart';
import 'package:raabta/screens/start_test_catagory/start_test_catagory.dart';
import 'package:raabta/utils/media_query.dart';
import 'package:raabta/widgets/license_test_widgets/license_test_card.dart';
import 'package:raabta/widgets/license_test_widgets/traffic_test_top_card.dart';

class TrafficSignTest extends StatelessWidget {
  const TrafficSignTest({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.primary,
      //   foregroundColor: Colors.white,
      // ),

      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TrafficSignTopContainer(
              scaffoldKey: scaffoldKey, text: 'LICENSE TEST'),
          SizedBox(
            height: screenheight(context) * 0.04,
          ),
          SizedBox(
            height: screenheight(context) * 0.60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LicenseTestCard(
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Prepare(),
                      ),
                    );
                  },
                  textColor: const Color.fromRGBO(16, 77, 128, 1),
                  borderColor: const Color.fromRGBO(16, 77, 128, 1),
                  containerColor: Colors.blue.shade100,
                  image: 'assets/images/student.jpeg',
                  text: '   Prepare Yourself',
                  urduText: 'اپنے آپ کو تیار کرو   ',
                ),
                LicenseTestCard(
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StartTestCatagory()));
                    },
                    textColor: const Color.fromARGB(255, 42, 107, 44),
                    image: 'assets/images/traffic.jpeg',
                    borderColor: const Color.fromARGB(255, 41, 103, 43),
                    containerColor: Colors.green.shade100,
                    text: '   Start Test',
                    urduText: 'ٹیسٹ شروع کریں   '),
                LicenseTestCard(
                    ontap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Score()));
                    },
                    textColor: const Color.fromARGB(255, 61, 34, 84),
                    image: 'assets/images/test.jpeg',
                    borderColor: const Color.fromARGB(255, 75, 41, 103),
                    containerColor: const Color.fromARGB(255, 242, 207, 248),
                    text: '   Score',
                    urduText: ' سکور   '),
              ],
            ),
          )
        ],
      ),
    );
  }
}
