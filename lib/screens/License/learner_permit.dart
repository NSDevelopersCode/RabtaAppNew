import 'package:flutter/material.dart';
import 'package:raabta/screens/License/tile_widget.dart';

class LearnerPermit extends StatelessWidget {
  const LearnerPermit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text('LEARNER PERMIT'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: const SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LEARNER PERMIT',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 20),

                // Eligibility Section
                Text(
                  'Eligibility:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16),
                RequirementItemTile(
                  icon: Icons.check_circle_outline,
                  text:
                      'Must be at least 18 years old with a valid Computerized National Identity Card (CNIC).',
                ),

                // Required Documents Section
                SizedBox(height: 16),
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
                  text: 'Original CNIC.',
                ),
                RequirementItemTile(
                  icon: Icons.medical_services,
                  text:
                      'Medical Certificate from an authorized medical practitioner.',
                ),
                RequirementItemTile(
                  icon: Icons.payments,
                  text:
                      'Fee voucher of Rs. 1000, obtainable from a designated bank or franchise.',
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
                  text: 'Visit the local License Branch in person.',
                ),
                RequirementItemTile(
                  icon: Icons.document_scanner,
                  text: 'Submit the required documents.',
                ),
                RequirementItemTile(
                  icon: Icons.photo_camera,
                  text: 'Your personal data and photograph will be recorded.',
                ),
                RequirementItemTile(
                  icon: Icons.schedule,
                  text:
                      'A Learner\'s Permit will be issued, which matures in 45 days.',
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
