import 'package:flutter/material.dart';

class LiscenseCard extends StatelessWidget {
  const LiscenseCard({
    super.key,
    required this.color,
    required this.image,
    required this.text,
    required this.textColor,
    this.imageColor,
    this.onTap,
  });
  final Color color;
  final String image;
  final String text;
  final Color textColor;
  final Color? imageColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(

      child: SizedBox(
        // height: 180,
        child: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Card(
              elevation: 2,
              // color: Colors.blue.shade100,

              color: color,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      image,
                      color: imageColor,
                      height: 60,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
