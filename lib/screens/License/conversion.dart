import 'package:flutter/material.dart';

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
      body: const SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 150, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DRIVING LICENSE CONVERSION',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Valid CNIC',
              ),
              Text(
                'Previous Driving License (MotorCycle / Motor Card + Jeep) in Original',
              ),
              Text('NOC From The Authority Who Issued Driving License'),
              Text(
                'Medical Certificate (By Authorized Medical Practitioner)',
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
