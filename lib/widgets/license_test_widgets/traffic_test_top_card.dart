import 'package:flutter/material.dart';
import 'package:raabta/utils/media_query.dart';

class TrafficSignTopContainer extends StatelessWidget {
  const TrafficSignTopContainer({
    super.key,
    required this.text,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      width: double.infinity,
      height: screenheight(context) * 0.32,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 40,
                      width: 45,
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     print('object');
                  //     scaffoldKey.currentState!.openDrawer();
                  //   },
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: Colors.white.withOpacity(0.8),
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     height: 40,
                  //     width: 45,
                  //     child: Icon(
                  //       Icons.menu,
                  //       color: Theme.of(context).colorScheme.primary,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    width: 35,
                  )
                ],
              ),
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 130,
            )
          ],
        ),
      ),
    );
  }
}
