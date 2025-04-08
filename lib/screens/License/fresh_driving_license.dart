import 'package:flutter/material.dart';

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
      body: const SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 150, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FRESH DRIVING LICENSE',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'After 45 Days of Issuance Of Learner The Application Has To Visit Again Driving License Branch',
              ),
              Text(
                'Valid CNIC',
              ),
              Text(
                'Medical Certificate (By Authorized Medical Practitioner)',
              ),
              Text(
                'Fee Voucher Of Rs. 250, For A Driving Test',
              ),
              Text(
                'An Applicant Has To Pass Traffic Signs Text and Physical Driving Test',
              ),
              Text(
                'Fee Voucher Of Rs. 1000, For A Driving License Card (Validity 5 Years)',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
