import 'package:flutter/material.dart';

class InternationalLearnerPermit extends StatelessWidget {
  const InternationalLearnerPermit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text(
          'International Learner Permit',
          style: TextStyle(),
        ),
      ),
      body: const SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'INTERNATIONAL LEARNER PERMIT',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Letter From Ministry of Foreign Affairs (MOFA),  Alongwith Letter Of Embassy Addressed To The Concerned DPO/CTO (MLAs) For Issuance / Renewal Of Driving License',
              ),
              Text('Photo Copy Of Passport'),
              Text(
                'Visa Valid For 6-Months on The Date of Applying For Driving Liscense Process',
              ),
              Text(
                'Medical Certificate (By Authorized Medical Practitioner)',
              ),
              Text(
                'Tenant information From (TIF) Of Concerned Police Station Alongwith CNIN Copy Of House Owner',
              ),
              Text(
                'Original Passport Will Also Be Produced At The Time Of Process',
              ),
              Text(
                'Fee Voucher Of Rs. 250, From A Designated Bank',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
