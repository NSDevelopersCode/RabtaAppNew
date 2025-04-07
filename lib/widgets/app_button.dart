import 'package:flutter/material.dart';
import 'package:raabta/utils/media_query.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.ontap,
    super.key,
    required this.isEnable,
    required this.text,
    required this.color,
  });
  final bool isEnable;
  final Function()? ontap;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnable ? ontap : null,
      child: Card(
        elevation: 5,
        child: Container(
          width: screenwidth(context) * 0.65,
          height: 50,
          decoration: BoxDecoration(
              color: isEnable ? color : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
