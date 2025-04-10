import 'package:flutter/material.dart';
import 'package:raabta/screens/License/tile_widget.dart';

class FreshDrivingLicense extends StatelessWidget {
  const FreshDrivingLicense({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text(
          'Fresh Driving License',
          style: TextStyle(),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: const SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FRESH DRIVING \nLICENSE',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 20),

                // Added information after 45 days of Learner's Permit Issuance
                Text(
                  'After 45 Days of Learner\'s Permit Issuance:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16),

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
                  text: 'Valid CNIC.',
                ),
                RequirementItemTile(
                  icon: Icons.medical_services,
                  text:
                      'Medical Certificate from an authorized medical practitioner.',
                ),

                // Procedure Section
                SizedBox(height: 16),
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
                  icon: Icons.location_city,
                  text: 'Visit the Driving License Branch.',
                ),
                RequirementItemTile(
                  icon: Icons.payments,
                  text: 'Fee voucher of Rs. 500 for the driving test.',
                ),
                RequirementItemTile(
                  icon: Icons.drive_eta,
                  text:
                      'Pass the Computerized Traffic Signs Test and Physical Driving Test.',
                ),
                RequirementItemTile(
                  icon: Icons.check_circle_outline,
                  text:
                      'Upon passing, submit a fee voucher of Rs. 2,000 for the Driving License card (valid for 5 years).',
                ),
                RequirementItemTile(
                  icon: Icons.schedule,
                  text:
                      'The Driving License Card can be collected after three to seven days.',
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
