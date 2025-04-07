import 'package:flutter/material.dart';
import 'package:raabta/routes/route.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(AppRouter.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 180,
              ),
              Column(
                children: [
                  Text(
                    'RAABTA',
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  const Text(
                    'PUBLIC TRAFFIC APPLICATION',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 250,
              // ),

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(10),
                      backgroundColor: Colors.green.shade50,
                      valueColor: AlwaysStoppedAnimation(
                          Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Powered by \n National Software Developers',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
