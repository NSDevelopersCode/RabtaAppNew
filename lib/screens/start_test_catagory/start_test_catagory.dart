import 'package:flutter/material.dart';
import 'package:raabta/screens/random_test/random_test.dart';
import 'package:raabta/screens/sign_test/sign_test.dart';
import 'package:raabta/screens/theory_test/theory_test.dart';
import 'package:raabta/utils/media_query.dart';
import 'package:raabta/widgets/license_test_widgets/license_test_card.dart';
import 'package:raabta/widgets/license_test_widgets/traffic_test_top_card.dart';
import 'package:raabta/widgets/side_bar.dart';

class StartTestCatagory extends StatelessWidget {
  const StartTestCatagory({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.primary,
      //   foregroundColor: Colors.white,
      // ),
      // drawer: const SideBar(),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TrafficSignTopContainer(scaffoldKey: scaffoldKey, text: 'START TEST'),
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
                        builder: (context) => const RandomTest(),
                      ),
                    );
                  },
                  textColor: const Color.fromARGB(255, 144, 88, 3),
                  borderColor: const Color.fromARGB(255, 171, 104, 3),
                  containerColor: Colors.orange.shade100,
                  image: 'assets/images/student.jpeg',
                  text: '   Random Questions',
                  urduText: 'بے ترتیب سوال   ',
                ),
                LicenseTestCard(
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignTest()));
                    },
                    textColor: const Color.fromARGB(255, 135, 36, 29),
                    image: 'assets/images/traffic.jpeg',
                    borderColor: const Color.fromARGB(255, 162, 44, 35),
                    containerColor: Colors.red.shade100,
                    text: '   Sign Test',
                    urduText: 'سائن ٹیسٹ   '),
                LicenseTestCard(
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TheoryTest(),
                        ),
                      );
                    },
                    textColor: const Color.fromARGB(255, 0, 121, 109),
                    image: 'assets/images/test.jpeg',
                    borderColor: const Color.fromARGB(255, 0, 121, 109),
                    containerColor: Colors.teal.shade100,
                    text: '   Theory Test',
                    urduText: ' تھیوری ٹیسٹ   '),
              ],
            ),
          )
        ],
      ),
    );
  }
}
