import 'package:flutter/material.dart';
import 'package:raabta/screens/License/tile_widget.dart';

class InternationalPermit extends StatelessWidget {
  const InternationalPermit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text(
          'International Driving Permit',
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
                  'INTERNATIONAL DRIVING PERMIT',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 30),

                // Section: Required Documents
                Text(
                  'Required Documents:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16),
                RequirementItemTile(
                  icon: Icons.credit_card,
                  text: "Valid Driving License of the concerned district.",
                ),
                RequirementItemTile(
                  icon: Icons.perm_identity,
                  text: "Valid CNIC.",
                ),
                RequirementItemTile(
                  icon: Icons.medical_services,
                  text: "Medical fitness Certificate.",
                ),
                RequirementItemTile(
                  icon: Icons.book_rounded,
                  text: "Valid Passport.",
                ),
                RequirementItemTile(
                  icon: Icons.airplanemode_active,
                  text: "Valid Visa.",
                ),
                RequirementItemTile(
                  icon: Icons.payments,
                  text:
                      "Fee voucher of Rs. 10,000 for the International Driving License card (valid 1 year).",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
