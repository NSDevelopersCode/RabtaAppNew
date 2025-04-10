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
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                color: Colors.grey.shade100,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 24.0, left: 16, right: 16),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.05),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Driving License for Pakistan National',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            letterSpacing: 0.3,
                            height: 1.4,
                            color: Theme.of(context).colorScheme.primary,
                          ),
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
                          text: 'Learner \nPermit',
                        ),
                        LiscenseCard(
                          onTap: () =>
                              Navigator.of(context).pushNamed(AppRouter.fresh),
                          imageColor: const Color.fromARGB(255, 1, 104, 188),
                          textColor: const Color.fromARGB(255, 1, 104, 188),
                          color: Colors.white,
                          image: 'assets/images/card.png',
                          text: 'Fresh \n License',
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
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.of(context)
                                .pushNamed(AppRouter.international),
                            child: Container(
                              margin: const EdgeInsets.all(12),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 154, 28, 176)
                                        .withOpacity(0.1),
                                    blurRadius: 15,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 154, 28, 176)
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        'assets/images/card.png',
                                        color:
                                            Color.fromARGB(255, 154, 28, 176),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Text(
                                      'International Permit',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 154, 28, 176),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
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
                    // Padding(
                    //   padding:
                    //       const EdgeInsets.only(top: 24.0, left: 16, right: 16),
                    //   child: Container(
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 12, vertical: 10),
                    //     decoration: BoxDecoration(
                    //       color: Theme.of(context)
                    //           .colorScheme
                    //           .primary
                    //           .withOpacity(0.05),
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //     child: Text(
                    //       'Driving License for Afghan National',
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.w600,
                    //         fontSize: 15,
                    //         letterSpacing: 0.3,
                    //         height: 1.4,
                    //         color: Theme.of(context).colorScheme.primary,
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.of(context)
                                .pushNamed(AppRouter.afghanlearnerpermit),
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.indigo.withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.indigo.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        'assets/images/card.png',
                                        color: Colors.indigo,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        'Driving License\nfor Afghan National',
                                        style: TextStyle(
                                          color: Colors.indigo,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Expanded(
                        //   child: LiscenseCard(
                        //     onTap: () => Navigator.of(context)
                        //         .pushNamed(AppRouter.afghandrivinglicense),
                        //     imageColor: Colors.teal,
                        //     textColor: Colors.teal,
                        //     color: Colors.white,
                        //     image: 'assets/images/card.png',
                        //     text: 'Driving License',
                        //   ),
                        // ),
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
                    // Padding(
                    //   padding:
                    //       const EdgeInsets.only(top: 24.0, left: 16, right: 16),
                    //   child: Container(
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 12, vertical: 10),
                    //     decoration: BoxDecoration(
                    //       color: Theme.of(context)
                    //           .colorScheme
                    //           .primary
                    //           .withOpacity(0.05),
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //     child: Text(
                    //       'Driving License for Diplomats and Embassy Officers/Officials',
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.w600,
                    //         fontSize: 15,
                    //         letterSpacing: 0.3,
                    //         height: 1.4,
                    //         color: Theme.of(context).colorScheme.primary,
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    const SizedBox(height: 10),
                    Row(
                      children: [
                        // Expanded(
                        //   child: LiscenseCard(
                        //     onTap: () => Navigator.of(context)
                        //         .pushNamed(AppRouter.internationalpermit),
                        //     imageColor: Colors.purple,
                        //     textColor: Colors.purple,
                        //     color: Colors.white,
                        //     image: 'assets/images/card.png',
                        //     text: 'Learner Permit',
                        //   ),
                        // ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.of(context)
                                .pushNamed(AppRouter.internationallicense),
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 199, 120, 1)
                                        .withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 199, 120, 1)
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        'assets/images/card.png',
                                        color: Color.fromARGB(255, 199, 120, 1),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        'Driving License for Diplomats and Embassy Officers/Officials',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 199, 120, 1),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 70),
              // Title for Diplomats
            ],
          ),
        ),
      ),
    );
  }
}
