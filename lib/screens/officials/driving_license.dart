import 'package:flutter/material.dart';
import 'package:raabta/screens/License/tile_widget.dart';

class InternationalDrivingLicense extends StatelessWidget {
  const InternationalDrivingLicense({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text(
          'International Driving License',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'INTERNATIONAL DRIVING LICENSE',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

                // Eligibility Section
                // Text(
                //   'Eligibility:',
                //   style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.w600,
                //     color: Colors.black87,
                //   ),
                // ),
                // SizedBox(height: 16),
                // RequirementItemTile(
                //   icon: Icons.check_circle_outline,
                //   text:
                //       'Must have a valid visa for 6-months on the date of applying for a Driving License.',
                // ),

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
                  icon: Icons.business,
                  text:
                      'A Letter from the Ministry of Foreign Affairs along with a letter from the embassy addressed to the concerned DPO/CTO (MLAs) for issuance/renewal of driving license.',
                ),
                RequirementItemTile(
                  icon: Icons.document_scanner,
                  text:
                      'Photocopy of diplomatic/Non-diplomatic card issued by the Ministry of Foreign Affairs (MOFA).',
                ),
                RequirementItemTile(
                  icon: Icons.photo_camera,
                  text: 'Photocopy of passport.',
                ),
                RequirementItemTile(
                  icon: Icons.accessibility_new,
                  text:
                      'Medical fitness certificate on form-C from a Medical Officer of a Government Hospital as per rules.',
                ),
                RequirementItemTile(
                  icon: Icons.check_box,
                  text:
                      'In case of non-availability of Driving License, pass the obligatory signal and driving test along with all other codal formalities.',
                ),
                RequirementItemTile(
                  icon: Icons.schedule,
                  text:
                      'The validity of the driving license shall be according to the length of the applicant’s visa.',
                ),
                RequirementItemTile(
                  icon: Icons.local_activity,
                  text:
                      'Original passport will also be produced at the time of processing.',
                ),

                // Fee Section
                SizedBox(height: 16),
                Text(
                  'Fees:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16),
                RequirementItemTile(
                  icon: Icons.payments,
                  text: 'Fee voucher of Rs. 250 for the driving test.',
                ),
                RequirementItemTile(
                  icon: Icons.payments,
                  text: 'Fee voucher of Rs. 1000 for the driving license card.',
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
