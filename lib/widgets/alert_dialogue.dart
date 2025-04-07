import 'package:flutter/material.dart';
import 'package:raabta/utils/media_query.dart';

class AlertDialogue extends StatelessWidget {
  const AlertDialogue({
    required this.content,
    required this.image,
    required this.title,
    this.onTap,
    this.number,
    super.key,
  });
  final String title;
  final String content;
  final String image;
  final void Function()? onTap;
  final String? number;
  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Image.asset(
        image,
        height: 60,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            content,
          ),
          // Text(title),
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenwidth(context) * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: TextButton(
                  onPressed: onTap,
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
