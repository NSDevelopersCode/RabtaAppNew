import 'package:flutter/material.dart';
import 'package:raabta/routes/route.dart';
import 'package:raabta/widgets/liscense_widgets/liscense_card.dart';

class LiscenseProcedure extends StatelessWidget {
  const LiscenseProcedure({super.key});
  @override
  Widget build(BuildContext context) {
    // final ScrollController scrollController = ScrollController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text('License Procedure'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                color: Colors.grey.shade100,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),

                      child: Text(
                        'DRIVING LICENSE FOR PAKISTAN NATIONAL',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Row 1
                    Row(
                      children: [
                        LiscenseCard(
                          onTap: () =>
                              Navigator.of(context).pushNamed(AppRouter.permit),
                          imageColor: const Color.fromARGB(255, 240, 31, 16),
                          textColor: const Color.fromARGB(255, 240, 31, 16),
                          color: Colors.white,
                          image: 'assets/images/card.png',
                          text: 'Learner Permit',
                        ),
                        LiscenseCard(
                          onTap: () =>
                              Navigator.of(context).pushNamed(AppRouter.fresh),
                          imageColor: const Color.fromARGB(255, 1, 104, 188),
                          textColor: const Color.fromARGB(255, 1, 104, 188),
                          color: Colors.white,
                          image: 'assets/images/card.png',
                          text: 'Fresh License',
                        ),
                        LiscenseCard(
                          onTap: () => Navigator.of(context)
                              .pushNamed(AppRouter.conversion),
                          imageColor: const Color.fromARGB(255, 25, 90, 27),
                          textColor: const Color.fromARGB(255, 25, 90, 27),
                          color: Colors.white,
                          image: 'assets/images/card.png',
                          text: 'Conversion Of License',
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Row 2
                    Row(
                      children: [
                        LiscenseCard(
                          onTap: () => Navigator.of(context)
                              .pushNamed(AppRouter.dublicate),
                          imageColor: const Color.fromARGB(255, 2, 127, 115),
                          textColor: const Color.fromARGB(255, 2, 98, 88),
                          color: Colors.white,
                          image: 'assets/images/card.png',
                          text: 'Duplicate License',
                        ),
                        LiscenseCard(
                          onTap: () => Navigator.of(context)
                              .pushNamed(AppRouter.endoresement),
                          imageColor: const Color.fromARGB(255, 110, 66, 49),
                          textColor: const Color.fromARGB(255, 110, 66, 49),
                          color: Colors.white,
                          image: 'assets/images/card.png',
                          text: 'License Endorsement',
                        ),
                        LiscenseCard(
                          onTap: () => Navigator.of(context)
                              .pushNamed(AppRouter.renewal),
                          imageColor: const Color.fromARGB(255, 3, 124, 140),
                          textColor: const Color.fromARGB(255, 3, 124, 140),
                          color: Colors.white,
                          image: 'assets/images/card.png',
                          text: 'Renewal Of License',
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Row 3
                    Row(
                      children: [
                        LiscenseCard(
                          onTap: () => Navigator.of(context)
                              .pushNamed(AppRouter.international),
                          imageColor: const Color.fromARGB(255, 154, 28, 176),
                          textColor: const Color.fromARGB(255, 154, 28, 176),
                          color: Colors.white,
                          image: 'assets/images/card.png',
                          text: 'International Permit',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              // Title for Pakistan National
              SizedBox(
                height: 10,
              ),
              // Title for Afghan National
              Container(
                color: Colors.grey.shade100,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text(
                        'DRIVING LICENSE FOR AFGHAN NATIONAL',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: LiscenseCard(
                            onTap: () => Navigator.of(context)
                                .pushNamed(AppRouter.afghanlearnerpermit),
                            imageColor: Colors.indigo,
                            textColor: Colors.indigo,
                            color: Colors.white,
                            image: 'assets/images/card.png',
                            text: 'Learner Permit',
                          ),
                        ),
                        Expanded(
                          child: LiscenseCard(
                            onTap: () => Navigator.of(context)
                                .pushNamed(AppRouter.afghandrivinglicense),
                            imageColor: Colors.teal,
                            textColor: Colors.teal,
                            color: Colors.white,
                            image: 'assets/images/card.png',
                            text: 'Driving License',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                color: Colors.grey.shade100,
                child: Column(
                  children: [
                    Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                      child: Text(
                        'DRIVING LICENSE FOR DIPLOMATS AND EMBASSY OFFICERS/OFFICIALS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: LiscenseCard(
                            onTap: () => Navigator.of(context)
                                .pushNamed(AppRouter.internationalpermit),
                            imageColor: Colors.purple,
                            textColor: Colors.purple,
                            color: Colors.white,
                            image: 'assets/images/card.png',
                            text: 'Learner Permit',
                          ),
                        ),
                        Expanded(
                          child: LiscenseCard(
                            onTap: () => Navigator.of(context)
                                .pushNamed(AppRouter.internationallicense),
                            imageColor: const Color.fromARGB(255, 199, 120, 1),
                            textColor: const Color.fromARGB(255, 199, 120, 1),
                            color: Colors.white,
                            image: 'assets/images/card.png',
                            text: 'Driving License',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )

              // Title for Diplomats
            ],
          ),
        ),
      ),
    );
  }
}
