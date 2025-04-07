import 'package:flutter/material.dart';

class LicenseRenewal extends StatelessWidget {
  const LicenseRenewal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text(
          'Renewal Driving License',
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
                'RENEWAL OF EXPIRED DRIVING LICENSE',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Original Previous Drivng License',
              ),
              Text(
                'Valid CNIC',
              ),
              Text(
                'Medical Certificate (By Authorized Medical Practitioner)',
              ),
              Text(
                'Fee Voucher Of  Driving License Card Of Rs. 1000 With In One Month Of Expiry',
              ),
              Text(
                'Fee Voucher Of Rs. 1500 After One month Of Expiry',
              ),
              Text(
                'Fee Voucher Of Rs. 3000 After three Years Of Expiry',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
