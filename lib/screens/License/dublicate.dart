import 'package:flutter/material.dart';
import 'package:raabta/screens/License/tile_widget.dart';

class LicenseDublicate extends StatelessWidget {
  const LicenseDublicate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text(
          'Duplicate Driving License',
          style: TextStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: const SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DUPLICATE DRIVING LICENSE',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 30),
                RequirementItemTile(
                  icon: Icons.credit_card,
                  text: "Valid CNIC.",
                ),
                RequirementItemTile(
                  icon: Icons.report,
                  text:
                      "Roznamcha/ Daily Dairy Report from the Police Station.",
                ),
                RequirementItemTile(
                  icon: Icons.payments,
                  text:
                      "Fee voucher of Rs. 2,000 for the Driving License card.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
