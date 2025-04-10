import 'package:flutter/material.dart';
import 'package:raabta/screens/License/tile_widget.dart';

class LicenseRenewal extends StatelessWidget {
  const LicenseRenewal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text(
          'Renewal Driving License',
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
                  'RENEWAL OF EXPIRED DRIVING LICENSE',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 30),

                // Required Documents Section
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
                  text: "Original previous Driving License.",
                ),
                RequirementItemTile(
                  icon: Icons.perm_identity,
                  text: "Valid CNIC.",
                ),
                RequirementItemTile(
                  icon: Icons.medical_services,
                  text: "Medical fitness Certificate.",
                ),

                SizedBox(height: 30),

                // Fee Structure Section
                Text(
                  'Fee Structure:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16),
                RequirementItemTile(
                  icon: Icons.payments,
                  text: "Within one month of expiry: Rs. 2,500.",
                ),
                RequirementItemTile(
                  icon: Icons.payments_outlined,
                  text: "After one month to three months of expiry: Rs. 2,000.",
                ),
                RequirementItemTile(
                  icon: Icons.money_off_csred,
                  text: "After three years of expiry: Rs. 5,000.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
