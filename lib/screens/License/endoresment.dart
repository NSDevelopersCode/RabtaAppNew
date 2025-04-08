import 'package:flutter/material.dart';

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
      body: const SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 150, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ENDORSEMENT OF DRIVING LICENSE',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Previous Driving License',
              ),
              Text(
                'Valid CNIC',
              ),
              Text('Learner Permit Of Atleat 45 Days'),
              Text(
                'Medical Certificate (By Authorized Medical Practitioner)',
              ),
              Text(
                'Fee Voucher Of Rs. 250, For A Driving Test',
              ),
              Text(
                'An Application Shall Pass Traffic Signs Test And Physical driving Test',
              ),
              Text(
                'Fee Voucher Of Rs. 1000, For Driving License Card',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
