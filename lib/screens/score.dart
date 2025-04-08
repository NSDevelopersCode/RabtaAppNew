import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raabta/controller/score.dart';
import 'package:raabta/screens/challan.dart';
import 'package:raabta/widgets/app_button.dart';

class Score extends StatefulWidget {
  const Score({super.key});

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  void initState() {
    super.initState();
    // Load the scores from SharedPreferences when the screen is initialized
    Provider.of<TotalScore>(context, listen: false)
        .loadScoresFromSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text('My Scores'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog.adaptive(
                      title: Center(
                        child: Image.asset(
                          'assets/images/crisis.png',
                          height: 100,
                        ),
                      ),
                      content:
                          const Text('Are You Sure? To Delete Quiz History'),
                      actions: [
                        AppButton(
                            ontap: () {
                              Navigator.pop(context);
                              context.read<TotalScore>().removeScoreList();
                            },
                            isEnable: true,
                            text: 'Delete',
                            color: Colors.red.shade600)
                      ],
                    );
                  },
                );
              },
              child: Image.asset(
                'assets/images/clean.png',
                height: 30,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Consumer<TotalScore>(
            builder: (context, value, child) {
              return value.scoresList.isNotEmpty
                  ? ListView.builder(
                      itemCount: value.scoresList.length,
                      itemBuilder: (context, index) {
                        final eachScore = value.scoresList[index];
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.green.shade50,
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                ),
                                child: ListTile(
                                  contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  leading: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      child: Text(
                                        eachScore.catagory,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      )),
                                  title: const Text('Score'),
                                  subtitle: Text(
                                      '${eachScore.score.toString()} / 20'),
                                  trailing: Text(eachScore.date.myDate),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        'No Results Attempt\n Quiz First',
                        textAlign: TextAlign.center,
                      ),
                    );
            },
          ),
          // Align(
          //   alignment: const Alignment(0, 0.75),
          //   child: AppButton(
          //     color: Theme.of(context).colorScheme.primary,
          //     isEnable: true,
          //     ontap: () {
          //       showDialog(
          //           context: context,
          //           builder: (context) {
          //             return AlertDialog(
          //               content: const Text('Are You Sure ?'),
          //               actions: [
          //                 TextButton(
          //                   onPressed: () {
          //                     Navigator.pop(context);
          //                   },
          //                   child: const Text('Cancel '),
          //                 ),
          //                 TextButton(
          //                     onPressed: () {
          //                       Provider.of<TotalScore>(context, listen: false)
          //                           .removeScoreList();
          //                       Navigator.pop(context);
          //                     },
          //                     child: const Text('Yes Do '))
          //               ],
          //             );
          //           });
          //     },
          //     text: 'Clear',
          //   ),
          // )
        ],
      ),
    );
  }
}
