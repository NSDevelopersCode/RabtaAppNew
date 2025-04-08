import 'package:flutter/material.dart';

class AfghanDrivingLicense extends StatelessWidget {
  const AfghanDrivingLicense({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text(
          'Afghan Driving License',
          style: TextStyle(),
        ),
      ),
      body: const SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 150, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AFGHAN DRIVING LICENSE',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('Learner permit Of Atleast 45 Days'),
              Text(
                'Valid Afghan Citizen Card (Issued by NADRA)',
              ),
              Text(
                'Medical Certificate (By Authorized Medical Practitioner)',
              ),
              Text(
                'Tenant information From (TIF) Of Concerned Police Station Alongwith CNIC Copy Of House Owner',
              ),
              Text(
                'Original NOC From Afghan Refugees Commissionerate (ARC)',
              ),
              Text(
                'Fee Voucher Of Rs. 250, For A Driving Test',
              ),
              Text(
                'Fee Voucher Of Rs. 1000, For A Driving License Card (Validity 1 Year)',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
