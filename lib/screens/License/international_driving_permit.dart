import 'package:flutter/material.dart';

class InternationalPermit extends StatelessWidget {
  const InternationalPermit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text(
          'International Driving Permit',
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
                'INTERNATIONAL DRIVING PERMIT ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('Valid Driving License Of Concerned District'),
              Text(
                'Valid CNIC',
              ),
              Text(
                'Medical Certificate (By Authorized Medical Practitioner)',
              ),
              Text('Valid Passport'),
              Text('Valid Visa'),
              Text(
                'Fee Voucher Of Rs. 5000, For International Driving License Card (Validity 1 Years)',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
