import 'package:flutter/material.dart';
import 'package:raabta/utils/media_query.dart';

class LicenseTestCard extends StatelessWidget {
  const LicenseTestCard({
    required this.borderColor,
    required this.containerColor,
    required this.image,
    required this.text,
    required this.urduText,
    required this.textColor,
    required this.ontap,
    super.key,
  });
  final Color containerColor;
  final String text;
  final String urduText;
  final Color borderColor;
  final String image;
  final Color textColor;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: ontap,
        child: Card(
          // shape:
          //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: EdgeInsets.zero,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.black.withOpacity(0.8),
          elevation: 9,
          child: Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 0.7, color: borderColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  height: screenheight(context) * 0.18,
                  width: screenwidth(context) * 0.55,
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            text,
                            style: TextStyle(fontSize: 17, color: textColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            urduText,
                            style: TextStyle(fontSize: 17, color: textColor),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    image,
                    height: 130,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
