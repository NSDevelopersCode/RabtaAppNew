import 'package:flutter/material.dart';
import 'package:raabta/utils/media_query.dart';

class TestSelection extends StatelessWidget {
  const TestSelection({
    required this.alphabet,
    required this.option,
    required this.onTap,
    required this.value,
    required this.number,
    super.key,
  });
  final String alphabet;
  final String option;
  final int value;
  final int number;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenwidth(context) * 0.85,
        height: 60,
        decoration: BoxDecoration(
            color: number == value
                ? const Color.fromARGB(255, 136, 196, 215)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                width: 1, color: Theme.of(context).colorScheme.primary)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(
                alphabet,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                width: 30,
              ),
              Flexible(
                child: Text(
                  option,
                  style: const TextStyle(fontSize: 14),
                  overflow: TextOverflow.visible,
                  // Allow overflow
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
