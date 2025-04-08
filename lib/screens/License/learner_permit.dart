import 'package:flutter/material.dart';

class LearnerPermit extends StatelessWidget {
  const LearnerPermit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text('LEARNER PERMIT'),
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
                'LEARNER PERMIT',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Valid CNIC (Min 18 Year Age)',
              ),
              Text(
                'Medical Certificate (By Authorized Medical Practitioner)',
              ),
              Text(
                'Application Has To Visit In Person To License Branch',
              ),
              Text(
                'Personal Data Entry Along With Picture',
              ),
              Text(
                'Learner Will Be Issued Which will Mature In 45 Days',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
