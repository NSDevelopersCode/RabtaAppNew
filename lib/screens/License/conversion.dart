import 'package:flutter/material.dart';
import 'package:raabta/screens/License/tile_widget.dart';

class LicenseConversion extends StatelessWidget {
  const LicenseConversion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text(
          'Driving License Conversion',
          style: TextStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: const SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DRIVING LICENSE CONVERSION',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 30),
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
                  icon: Icons.person,
                  text: 'Valid CNIC ',
                ),
                RequirementItemTile(
                  icon: Icons.credit_card,
                  text:
                      'Original previous driving license (Motorcycle/Motor Car + Jeep etc).',
                ),
                RequirementItemTile(
                  icon: Icons.document_scanner,
                  text:
                      'No Objection Certificate (NOC) from the authority that issued the previous license.',
                ),
                RequirementItemTile(
                  icon: Icons.medical_services_rounded,
                  text: 'Medical fitness certificate.',
                ),
                RequirementItemTile(
                  icon: Icons.payments_sharp,
                  text:
                      'Fee voucher of Rs. 2,500 for the Driving License card (valid for 5 years).',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
