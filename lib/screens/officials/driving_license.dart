import 'package:flutter/material.dart';

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
      body: const SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 80, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'INTERNATIONAL DRIVING LICENSE',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('Learner Permit of Atleast 45 Days'),
              Text(
                'Letter From Ministry of Foreign Affairs (MOFA),  Alongwith Letter Of Embassy Addressed To The Concerned DPO/CTO (MLAs) For Issuance / Renewal Of Driving License',
              ),
              Text(
                'Photo Copy Of Diplomant / Non-diplomant card Issued From MOFA',
              ),
              Text('Photo Copy Of Passport'),
              Text(
                'Visa Valid For 6-Months on The Date of Applying For Driving Liscense Process',
              ),
              Text(
                'Medical Certificate (By Authorized Medical Practitioner)',
              ),
              Text(
                'Original Passport Will Also Be Produced At The Time Of Process',
              ),
              Text(
                'Fee Voucher Of Rs. 250, For A Driving Test',
              ),
              Text(
                'Fee Voucher Of Rs. 1000, For A Driving License Card',
              ),
              Text(
                'The Validity Of The Driving Liscense Shall be According To The Length Of Applicant Visa',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
