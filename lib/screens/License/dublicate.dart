import 'package:flutter/material.dart';

class LicenseDublicate extends StatelessWidget {
  const LicenseDublicate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text(
          'Dublicate Driving License',
          style: TextStyle(),
        ),
      ),
      body: const SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 180, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DUBLICATE DRIVING LICENSE',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Valid CNIC',
              ),
              Text('Roznamcha Report From Police Station'),
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
