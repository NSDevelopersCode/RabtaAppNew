import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:raabta/utils/media_query.dart';

class WeatherContainer extends StatelessWidget {
  final String mainText;
  final String txt;
  final String? image;

  const WeatherContainer({
    required this.mainText,
    required this.txt,
    this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10), // Rounded corners
      child: Material(
        elevation: 10,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect

          child: Container(
            width: screenwidth(context) * 0.32,
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.6),
                  Colors.white.withOpacity(0.6)
                ],
              ), // Semi-transparent white
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white.withOpacity(1), // Subtle border
                width: 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image != null
                    ? Image.asset(
                        image!,
                        height: 30,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : const SizedBox(),
                Text(
                  txt,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  mainText,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
