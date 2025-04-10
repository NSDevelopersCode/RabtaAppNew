import 'package:flutter/material.dart';
import 'package:raabta/screens/License/tile_widget.dart';

class AfghanLearnerPermit extends StatelessWidget {
  const AfghanLearnerPermit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text(
          'Afghan Learner Permit',
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
                  'Fresh , Duplicate and Renewal of Driving License',
                  style: TextStyle(
                    fontSize: 20,
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
                //       'Must be at least 18 years old with a valid Afghan Citizen Card (Issued by NADRA).',
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
                  icon: Icons.credit_card,
                  text: 'Valid Afghan Citizen Card (Issued by NADRA).',
                ),
                RequirementItemTile(
                  icon: Icons.medical_services,
                  text:
                      'Medical Certificate (By Authorized Medical Practitioner).',
                ),
                RequirementItemTile(
                  icon: Icons.document_scanner,
                  text:
                      'Tenant Information Form (TIF) from the concerned Police Station along with the CNIC copy of the house owner.',
                ),
                RequirementItemTile(
                  icon: Icons.approval,
                  text:
                      'Copy of NOC from Afghan Refugees Commissionerate (ARC).',
                ),
                RequirementItemTile(
                  icon: Icons.payments,
                  text: 'Fee voucher of Rs. 250, from a designated bank.',
                ),

                // Additional Details Section
                SizedBox(height: 16),
                Text(
                  'Additional Requirements for Fresh, Duplicate, and Renewal of Driving License:',
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
                      'Letter from the organization in which the applicant is serving, addressed to the concerned DPOs/CTO (MLAs) for issuance or renewal of driving license. The address of the applicant should be mentioned.',
                ),
                RequirementItemTile(
                  icon: Icons.badge,
                  text:
                      'Visa valid for at least 06 months at the time of applying for a driving license.',
                ),
                RequirementItemTile(
                  icon: Icons.home,
                  text:
                      'Proof of residence (copy of Tenant Information Form from concerned PS) of the rented house with the copy of the house owner\'s CNIC.',
                ),
                RequirementItemTile(
                  icon: Icons.business_center,
                  text:
                      'Business Registration Certificate & FBR/SECP certificate if the applicant is running any business or working with any company/firm/NGO in Pakistan.',
                ),
                RequirementItemTile(
                  icon: Icons.school,
                  text:
                      'Letter from the educational institution if the applicant is studying, along with a copy of the student ID card.',
                ),
                RequirementItemTile(
                  icon: Icons.local_library,
                  text:
                      'Photocopy of the driving license issued by the respective country, along with the original license for verification.',
                ),
                RequirementItemTile(
                  icon: Icons.local_activity,
                  text:
                      'Original passport to be brought at the time of processing.',
                ),
                RequirementItemTile(
                  icon: Icons.access_time,
                  text: 'The validity of the driving license is 01 year.',
                ),
                RequirementItemTile(
                  icon: Icons.refresh,
                  text: 'Renewal follows the same pattern as mentioned above.',
                ),
                RequirementItemTile(
                  icon: Icons.access_alarm,
                  text:
                      'Temporary Driving License shall be mentioned on the card.',
                ),
                RequirementItemTile(
                  icon: Icons.person_add,
                  text:
                      'Applicant will appear in person before the concerned MLA and will also appear for theory & practical driving tests after completing all codal formalities.',
                ),
                RequirementItemTile(
                  icon: Icons.cancel_outlined,
                  text:
                      'The driving license cannot be used for purposes like Passport/CNIC.',
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

// import 'package:flutter/material.dart';

// class AfghanLearnerPermit extends StatelessWidget {
//   const AfghanLearnerPermit({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.primary,
//         foregroundColor: Colors.white,
//         title: const Text(
//           'Afghan Learner Permit',
//           style: TextStyle(),
//         ),
//       ),
//       body: const SizedBox(
//         width: double.infinity,
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 150, horizontal: 30),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'AFGHAN LEARNER PERMIT',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 'Valid Afghan Citizen Card (Issued by NADRA)',
//               ),
//               Text(
//                 'Medical Certificate (By Authorized Medical Practitioner)',
//               ),
//               Text(
//                 'Tenant information From (TIF) Of Concerned Police Station Alongwith CNIC Copy Of House Owner',
//               ),
//               Text(
//                 'Copy Of NOC From Afghan Refugees Commissionerate (ARC)',
//               ),
//               Text(
//                 'Fee Voucher Of Rs. 250, From A Designated Bank',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
