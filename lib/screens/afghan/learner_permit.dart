import 'package:flutter/material.dart';

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
      body: const SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 150, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AFGHAN LEARNER PERMIT',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
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
                'Copy Of NOC From Afghan Refugees Commissionerate (ARC)',
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
