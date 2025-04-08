import 'dart:developer';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:raabta/controller/score.dart';
import 'package:raabta/model/score_model.dart';
import 'package:raabta/widgets/app_button.dart';
import 'package:raabta/widgets/test_selection.dart';

class RandomTest extends StatefulWidget {
  const RandomTest({Key? key}) : super(key: key);

  @override
  State<RandomTest> createState() => _SignTestState();
}

bool isShow = false;

class _SignTestState extends State<RandomTest> {
  int selectedValue = 0;
  double percent = 0;
  int score = 0;
  int currentQuestionIndex = 0;
  int point = 0;
  int optionPoint = 0;
  bool isEnable = false;
  bool isOptionSelected = false;
  bool isPlayedOnce = false;
  String text = 'Next';
  Color? color;
  final confettiController =
      ConfettiController(duration: const Duration(seconds: 3));

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What does this sign mean?',
      'image': 'assets/images/1.jpeg',
      'options': [
        [
          'Left stop',
          'No Right Turn',
          'Right Turn',
        ],
      ],
      'correct': 'No Right Turn',
    },
    {
      'question': 'What does this sign mean?',
      'image': 'assets/images/2.jpeg',
      'options': [
        [
          'Airport',
          'Petrol Pump',
          'Strong cross wing',
        ],
      ],
      'correct': 'Strong cross wing',
    },
    {
      'question': 'What does this sign mean?',
      'image': 'assets/images/3.jpeg',
      'options': [
        [
          'Passing Police Custom post without stopping',
          'Custom police Ahead',
          'Danger Ahead',
        ],
      ],
      'correct': 'Custom police Ahead',
    },
    {
      'question': 'What does this sign mean?',
      'image': 'assets/images/4.jpeg',
      'options': [
        [
          'No entry for vehicle Exceeding 6 ton weight on Axle',
          'No Entry for good Vehicles',
          'Height of The Bridge 6 feet',
        ],
      ],
      'correct': 'No entry for vehicle Exceeding 6 ton weight on Axle',
    },
    {
      'question': 'What does this sign mean?',
      'image': 'assets/images/5.jpeg',
      'options': [
        [
          'Crossing',
          'Stop Line',
          'Lines',
        ],
      ],
      'correct': 'Stop Line',
    },
    {
      'question': 'What does this sign mean?',
      'image': 'assets/images/6.jpeg',
      'options': [
        [
          'Parking',
          'No Parking',
          'Stop',
        ],
      ],
      'correct': 'No Parking',
    },
    {
      'question': 'What does this sign mean?',
      'image': 'assets/images/7.jpeg',
      'options': [
        [
          'End of speed Limit Imposed',
          'Round About',
          'Road Closed',
        ],
      ],
      'correct': 'End of speed Limit Imposed',
    },
    {
      'question': 'What does this sign mean?',
      'image': 'assets/images/8.jpeg',
      'options': [
        [
          'Other Dangers',
          'Warning',
          'Road Closed',
        ],
      ],
      'correct': 'Other Dangers',
    },
    {
      'question': 'What does this sign mean?',
      'image': 'assets/images/9.jpeg',
      'options': [
        [
          'Animal Crossing',
          'Wild Animal Crossing',
          'Cattle Crossing',
        ],
      ],
      'correct': 'Wild Animal Crossing',
    },
    {
      'question': 'What does this sign mean?',
      'image': 'assets/images/10.jpeg',
      'options': [
        [
          'Red',
          'Hospital',
          'First Aid Centre',
        ],
      ],
      'correct': 'Hospital',
    },
    {
      'question': 'What does this sign mean?',
      'image': 'assets/images/11.jpeg',
      'options': [
        [
          'Restaurant',
          'Hospital',
          'Bus stop',
        ],
      ],
      'correct': 'Bus stop',
    },
    {
      'question': 'What does this sign mean?',
      'image': 'assets/images/12.jpeg',
      'options': [
        [
          'No entry for cycle',
          'No entry for M. Cycle',
          'No entry',
        ],
      ],
      'correct': 'No entry for M. Cycle',
    },
    {
      'question': 'What does this sign mean?',
      'image': 'assets/images/13.jpeg',
      'options': [
        [
          'Un even Road',
          'Road Dips',
          'Slippery Road',
        ],
      ],
      'correct': 'Road Dips',
    },
    {
      'question': 'What does this sign mean?',
      'image': 'assets/images/14.jpeg',
      'options': [
        [
          'Steep Ascent',
          'Dangerous Decent',
          'Slippery road',
        ],
      ],
      'correct': ' Steep Ascent',
    },
    {
      'question': 'What does this sign mean?',
      'image': 'assets/images/15.jpeg',
      'options': [
        [
          'Level Crossing (with Gate)',
          'Level Crossing (without Gate)',
          'Train Engine',
        ],
      ],
      'correct': 'Level Crossing (without Gate)',
    },
    {
      'question': 'What does this sign mean?',
      'image': 'assets/images/16.jpeg',
      'options': [
        [
          'Children Crossing',
          'Pedestrian Crossing',
          'Bus Stop',
        ],
      ],
      'correct': 'Pedestrian Crossing',
    },
    {
      'question': 'What does this sign mean?',
      'image': 'assets/images/17.jpeg',
      'options': [
        [
          'Hand',
          'Stop',
          'Five fingers',
        ],
      ],
      'correct': 'Stop',
    },
    {
      'question': 'What does this sign mean?',
      'image': 'assets/images/18.jpeg',
      'options': [
        [
          'Stop',
          'Slow',
          'Stop Ahead',
        ],
      ],
      'correct': 'Slow',
    },
    {
      'question': 'What does this sign mean?',
      'image': 'assets/images/19.jpeg',
      'options': [
        [
          'Road is Closed Ahead',
          'Stop',
          'One Way',
        ],
      ],
      'correct': 'Road is Closed Ahead',
    },
    {
      'question': 'What does this sign mean?',
      'image': 'assets/images/20.jpeg',
      'options': [
        [
          'Keep Left',
          'Arrow',
          'One Way',
        ],
      ],
      'correct': 'One Way',
    },
    {
      'question': 'When you will have to check Engine Oil of your vehicle ?',
      'image': null,
      'options': [
        [
          'When Engine heat up',
          'After every 600 Km',
          'prior to Leaving for long journey',
        ],
      ],
      'correct': 'prior to Leaving for long journey',
    },
    {
      'question': 'Reduction level of ------ can cause accidents ?',
      'image': null,
      'options': [
        [
          'Water of Battery',
          'Brake fluid level',
          'Radiators Walter',
        ],
      ],
      'correct': 'Brake fluid level',
    },
    {
      'question': 'Zebra Crossing is specified for ?',
      'image': null,
      'options': [
        [
          'Animals',
          'Zebras',
          'Pedestrian',
        ],
      ],
      'correct': 'Pedestrian',
    },
    {
      'question': 'You are allowed to overtake ?',
      'image': null,
      'options': [
        [
          'At main Crossing',
          'At broker center line',
          'At bridge',
        ],
      ],
      'correct': 'At broker center line',
    },
    {
      'question': 'You should switch on your vehicle light after sun set ?',
      'image': null,
      'options': [
        [
          '20 Minutes',
          '30 Minutes',
          '40 Minutes',
        ],
      ],
      'correct': '20 Minutes',
    },
    {
      'question': 'which vehicle has the right of way at roundabout ?',
      'image': null,
      'options': [
        [
          'The traffic coming from the right side',
          'The traffic coming from the left side',
          'None of them',
        ],
      ],
      'correct': 'The traffic coming from the right side',
    },
    {
      'question': 'How much distance from intersection should be kept ?',
      'image': null,
      'options': [
        [
          '10 Meter',
          '30 Meter',
          '40 Meter',
        ],
      ],
      'correct': '10 Meter'
    },
    {
      'question': 'What should you do on blind turn ?',
      'image': null,
      'options': [
        [
          'Use the back Mirrors',
          'Use the horn',
          'Slow down your speed',
        ],
      ],
      'correct': 'Slow down your speed',
    },
    {
      'question': 'Where do you see while changing the gear of the vehicle ?',
      'image': null,
      'options': [
        [
          'Straight',
          'See the gear',
          'See the feet',
        ],
      ],
      'correct': 'Straight',
    },
    {
      'question': 'Which gear is powerful ?',
      'image': null,
      'options': [
        [
          'Reverse gear',
          'First gear',
          'Fourth gear',
        ],
      ],
      'correct': 'Reverse gear',
    },
    {
      'question': 'Which gear to use during turning ?',
      'image': null,
      'options': [
        [
          'First gear',
          'Second gear',
          'Third gear',
        ],
      ],
      'correct': 'Second gear',
    },
    {
      'question': 'Which sign board shows danger ?',
      'image': null,
      'options': [
        [
          'Mandatory',
          'Warning',
          'Informatory',
        ],
      ],
      'correct': 'Warning',
    },
    {
      'question': 'On which speed limit you have to fasten the seat belt ?',
      'image': null,
      'options': [
        [
          '80Km',
          '100Km',
          'At any Speed limit',
        ],
      ],
      'correct': 'At any Speed limit',
    },
    {
      'question':
          'Which indicator will be used while overtaking in roundabout ?',
      'image': null,
      'options': [
        [
          'Right',
          'Left',
          'Overtaking is not allowed',
        ],
      ],
      'correct': 'Overtaking is not allowed',
    },
    {
      'question': 'What do you mean by double yellow line ?',
      'image': null,
      'options': [
        [
          'Can park vehicle',
          'Cannot stop',
          "Give way to heavy vehicle",
        ],
      ],
      'correct': 'Cannot stop',
    },
    {
      'question':
          'Is it necessary for deiver to keep driving license while driving ?',
      'image': null,
      'options': [
        [
          'Yes',
          'No',
          "Don't Know",
        ],
      ],
      'correct': 'Yes',
    },
    {
      'question':
          'In which conditions a driver can park his vehicle on footpath ?',
      'image': null,
      'options': [
        [
          'Emergency',
          'Not availabiltiy of parking',
          'Not allowed in any case',
        ],
      ],
      'correct': 'Not allowed in any case',
    },
    {
      'question':
          'In which condition a public driver can cross the red signal ?',
      'image': null,
      'options': [
        [
          'Emergency',
          'While going to market',
          'Never',
        ],
      ],
      'correct': 'Never',
    },
    {
      'question': 'Can you park your car in front of closed gate ?',
      'image': null,
      'options': [
        [
          'Yes',
          'No',
          "Don't Know",
        ],
      ],
      'correct': 'No',
    },
    {
      'question':
          "If your vehicle's speed is 60Km/h you should keep how much distance from front vehicle ?",
      'image': null,
      'options': [
        [
          '30 Meter',
          '40 Meter',
          '50 Meter',
        ],
      ],
      'correct': '30 Meter',
    },
  ];
  @override
  void initState() {
    questions.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('T E S T'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !isShow
                    ? Center(
                        child: CircularPercentIndicator(
                          rotateLinearGradient: true,
                          animateFromLastPercent: true,
                          animationDuration: 200,
                          animation: true,
                          radius: 70,
                          lineWidth: 10,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          progressColor: Theme.of(context).colorScheme.primary,
                          percent: percent.clamp(0.0, 1.0),
                          circularStrokeCap: CircularStrokeCap.round,
                          center:
                              //\ Text('${(percent * 100).toStringAsFixed(0)} %'),
                              currentQuestionIndex == 20
                                  ? const Text('Completed')
                                  : const Text(''),
                        ),
                      )
                    : const Center(child: Text('Completed')),
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    currentQuestionIndex == 20
                        ? const Text(
                            '',
                            style: TextStyle(fontSize: 18),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              'Question : ${questions[point]['question'].toString()}      ${point + 1}/${20}',
                              textAlign: TextAlign.center,
                            ),
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    currentQuestionIndex == 20
                        ? const Text('')
                        : questions[point]['image'] != null
                            ? Image.asset(
                                questions[point]['image'],
                                height: 100,
                              )
                            : const SizedBox(),
                    const SizedBox(
                      height: 15,
                    ),
                    currentQuestionIndex == 20
                        ? const SizedBox()
                        : TestSelection(
                            number: 1,
                            value: selectedValue,
                            onTap: () {
                              setState(() {
                                selectedValue = 1;
                                isEnable = true;
                                isOptionSelected = true;
                              });
                              // checkAnswer(optionsList[optionPoint][0]);
                            },
                            alphabet: 'A.',
                            option: questions[point]['options'][optionPoint][0],
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    currentQuestionIndex == 20
                        ? const SizedBox()
                        : TestSelection(
                            number: 2,
                            value: selectedValue,
                            onTap: () {
                              setState(() {
                                selectedValue = 2;
                                isEnable = true;
                                isOptionSelected = true;
                              });
                              // checkAnswer(optionsList[optionPoint][1]);
                            },
                            alphabet: 'B.',
                            option: questions[point]['options'][optionPoint][1],
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    currentQuestionIndex == 20
                        ? const SizedBox()
                        : TestSelection(
                            number: 3,
                            onTap: () {
                              setState(() {
                                selectedValue = 3;
                                isEnable = true;
                                isOptionSelected = true;
                              });
                              // checkAnswer(optionsList[optionPoint][2]);
                            },
                            value: selectedValue,
                            alphabet: 'C.',
                            option: questions[point]['options'][optionPoint][2],
                          ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                currentQuestionIndex != 20
                    ? AppButton(
                        color: color ?? Theme.of(context).colorScheme.primary,
                        text: text,
                        isEnable: isOptionSelected,
                        ontap: isOptionSelected && percent <= 1.0000000000000002
                            ? () {
                                setState(() {
                                  percent = percent + 0.05;
                                  print([percent]);
                                  if (percent <= 1.0000000000000002) {
                                    print('inside');
                                    // Use point as the index to check the correct answer
                                    checkAnswer(
                                      questions[point]['options'][0]
                                          [selectedValue - 1],
                                      questions[point]['correct'],
                                    );
                                    color =
                                        Theme.of(context).colorScheme.primary;

                                    selectedValue = 0;
                                    // Increment point only if it's not the last question
                                    if (point < questions.length - 1) {
                                      point++;
                                    }

                                    log(point.toString());
                                    isOptionSelected =
                                        false; // Reset option selection
                                  }
                                });
                              }
                            : null,
                      )
                    : const Text(''),
                currentQuestionIndex == 20
                    ? AppButton(
                        ontap: () async {
                          !isPlayedOnce
                              ? context.read<TotalScore>().addScoreToList(
                                    ScoreDate(
                                        score: score,
                                        date: DateTime.now(),
                                        catagory: 'Random Quiz'),
                                  )
                              : const SizedBox();
                          score >= 10
                              ? !isPlayedOnce
                                  ? confettiController.play()
                                  : const SizedBox()
                              : const SizedBox();
                          setState(() {
                            isPlayedOnce = true;
                          });
                          // ignore: use_build_context_synchronously
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return AlertDialog.adaptive(
                                title: const Center(child: Text('RESULT')),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Correct Answers : $score'),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text('Wrong Answers : ${20 - score}'),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Obtained Score is : ${score.toString()} / ${20}',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    if (score < 10)
                                      const Column(
                                        children: [
                                          Text('Need More Practice  👎'),

                                          // Add more widgets as needed
                                        ],
                                      ),
                                    if (score >= 10 && score < 15)
                                      const Column(
                                        children: [
                                          Text('Good  👍'),

                                          // Add more widgets as needed
                                        ],
                                      ),
                                    if (score >= 15)
                                      const Column(
                                        children: [
                                          Text('Excellent 😍'),

                                          // Add more widgets as needed
                                        ],
                                      ),
                                  ],
                                ),
                                actions: [
                                  AppButton(
                                      ontap: () {
                                        // Navigator.pop(context);
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      isEnable: true,
                                      text: 'Done',
                                      color:
                                          Theme.of(context).colorScheme.primary)
                                ],
                              );
                            },
                          );
                        },
                        isEnable: isEnable,
                        text: 'Score',
                        color: Colors.teal)
                    : const Text(''),
              ],
            ),
          ),
          ConfettiWidget(
            confettiController: confettiController,
            shouldLoop: false,
          )
        ],
      ),
    );
  }

  void checkAnswer(String selectedAnswer, String correct) {
    // Get the correct answer for the current question
    // String correctAnswer = correctAnswers[currentQuestionIndex];

    // Check if the selected answer matches the correct answer
    if (selectedAnswer == correct) {
      log('true');
      // If correct, increment the score
      setState(() {
        score++;
      });
    }

    // Move to the next question
    setState(() {
      currentQuestionIndex++;
    });
    log('score : ${score.toString()}');
  }
}
