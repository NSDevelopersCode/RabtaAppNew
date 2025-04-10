import 'package:flutter/material.dart';
import 'package:raabta/screens/License/tile_widget.dart';

class LicenseEndoresment extends StatelessWidget {
  const LicenseEndoresment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text(
          'Driving License Endorsement',
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
                  'ENDORSEMENT OF DRIVING LICENSE',
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
                  text: "Previous Driving License.",
                ),
                RequirementItemTile(
                  icon: Icons.perm_identity,
                  text: "Valid CNIC.",
                ),
                RequirementItemTile(
                  icon: Icons.book,
                  text: "Learner's Permit of at least 45 days.",
                ),
                RequirementItemTile(
                  icon: Icons.medical_information,
                  text: "Medical Certificate.",
                ),
                RequirementItemTile(
                  icon: Icons.payments,
                  text: "Fee voucher of Rs. 500 for the driving test.",
                ),

                SizedBox(height: 30),

                // Section: Procedure
                Text(
                  'Procedure:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16),
                RequirementItemTile(
                  icon: Icons.directions_car,
                  text:
                      "Pass the Traffic Signs Test and Physical Driving Test.",
                ),
                RequirementItemTile(
                  icon: Icons.payment,
                  text:
                      "Submit a fee voucher of Rs. 2,000 for the updated Driving License card.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
