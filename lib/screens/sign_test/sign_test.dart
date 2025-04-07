import 'dart:developer';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:raabta/controller/score.dart';
import 'package:raabta/model/score_model.dart';
import 'package:raabta/widgets/app_button.dart';
import 'package:raabta/widgets/test_selection.dart';

class SignTest extends StatefulWidget {
  const SignTest({Key? key}) : super(key: key);

  @override
  State<SignTest> createState() => _SignTestState();
}

bool isShow = false;

class _SignTestState extends State<SignTest> {
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
    {'question': 'What does this sign mean?', 'image': 'assets/images/1.jpeg'},
    {'question': 'What does this sign mean?', 'image': 'assets/images/2.jpeg'},
    {'question': 'What does this sign mean?', 'image': 'assets/images/3.jpeg'},
    {'question': 'What does this sign mean?', 'image': 'assets/images/4.jpeg'},
    {'question': 'What does this sign mean?', 'image': 'assets/images/5.jpeg'},
    {'question': 'What does this sign mean?', 'image': 'assets/images/6.jpeg'},
    {'question': 'What does this sign mean?', 'image': 'assets/images/7.jpeg'},
    {'question': 'What does this sign mean?', 'image': 'assets/images/8.jpeg'},
    {'question': 'What does this sign mean?', 'image': 'assets/images/9.jpeg'},
    {'question': 'What does this sign mean?', 'image': 'assets/images/10.jpeg'},
    {'question': 'What does this sign mean?', 'image': 'assets/images/11.jpeg'},
    {'question': 'What does this sign mean?', 'image': 'assets/images/12.jpeg'},
    {'question': 'What does this sign mean?', 'image': 'assets/images/13.jpeg'},
    {'question': 'What does this sign mean?', 'image': 'assets/images/14.jpeg'},
    {'question': 'What does this sign mean?', 'image': 'assets/images/15.jpeg'},
    {'question': 'What does this sign mean?', 'image': 'assets/images/16.jpeg'},
    {'question': 'What does this sign mean?', 'image': 'assets/images/17.jpeg'},
    {'question': 'What does this sign mean?', 'image': 'assets/images/18.jpeg'},
    {'question': 'What does this sign mean?', 'image': 'assets/images/19.jpeg'},
    {'question': 'What does this sign mean?', 'image': 'assets/images/20.jpeg'},
    // 'What does this sign mean?',
    // 'What does this sign mean?',
    // 'What does this sign mean?',
    // 'What does this sign mean?',
    // 'What does this sign mean?',
    // 'What does this sign mean?',
    // 'What does this sign mean?',
    // 'What does this sign mean?',
    // 'What does this sign mean?',
    // 'What does this sign mean?',
    // 'What does this sign mean?',
    // 'What does this sign mean?',
    // 'What does this sign mean?',
    // 'What does this sign mean?',
    // 'What does this sign mean?',
    // 'What does this sign mean?',
    // 'What does this sign mean?',
    // 'What does this sign mean?',
    // 'What does this sign mean?',
  ];
  final List<List<String>> optionsList = [
    [
      'Left stop',
      'No Right Turn',
      'Right Turn',
    ],
    [
      'Airport',
      'Petrol Pump',
      'Strong cross wing',
    ],
    [
      'Passing Police Custom post without stopping',
      'Custom police Ahead',
      'Danger Ahead',
    ],
    [
      'No entry for vehicle Exceeding 6 ton weight on Axle',
      'No Entry for good Vehicles',
      'Height of The Bridge 6 feet',
    ],
    [
      'Crossing',
      'Stop Line',
      'Lines',
    ],
    [
      'Parking',
      'No Parking',
      'Stop',
    ],
    [
      'End of speed Limit Imposed',
      'Round About',
      'Road Closed',
    ],
    // // [
    // //   'Speed Limit 50km',
    // //   'Speed Limit 5 KM',
    // //   'End of speed Limit Imposed',
    // ],
    [
      'Other Dangers',
      'Warning',
      'Road Closed',
    ],
    [
      'Animal Crossing',
      'Wild Animal Crossing',
      'Cattle Crossing',
    ],
    [
      'Red',
      'Hospital',
      'First Aid Centre',
    ],
    [
      'Restaurant',
      'Hospital',
      'Bus stop',
    ],
    [
      'No entry for cycle',
      'No entry for M. Cycle',
      'No entry',
    ],
    [
      'Un even Road',
      'Road Dips',
      'Slippery Road',
    ],
    [
      'Steep Ascent',
      'Dangerous Decent',
      'Slippery road',
    ],
    [
      'Level Crossing (with Gate)',
      'Level Crossing (without Gate)',
      'Train Engine',
    ],
    [
      'Children Crossing',
      'Pedestrian Crossing',
      'Bus Stop',
    ],
    [
      'Hand',
      'Stop',
      'Five fingers',
    ],
    [
      'Stop',
      'Slow',
      'Stop Ahead',
    ],
    [
      'Road is Closed Ahead',
      'Stop',
      'One Way',
    ],
    [
      'Keep Left',
      'Arrow',
      'One Way',
    ],
  ];
  final List<String> correctAnswers = [
    'No Right Turn',
    'Strong cross wing',
    'Custom police Ahead',
    'No entry for vehicle Exceeding 6 ton weight on Axle',
    'Stop Line',
    'No Parking',
    'End of speed Limit Imposed',

    'Other Dangers',
    'Wild Animal Crossing',
    'First Aid Centre',
    'Bus stop',
    'No entry for M. Cycle',
    'Road Dips',
    'Steep Ascent',
    'Level Crossing (without Gate)',
    'Pedestrian Crossing',
    'Stop',
    'Slow',
    'Road is Closed Ahead',
    'One Way Road',
    // 'Parking Place Indicated',
    // 'Facility indicated',
    // 'No Entry for Motor Vehicle',
    // 'No Entry for Cycle',
    // 'Dual Carriage Way Ahead',
    // 'Do Not Know',
    // 'Give Way',
    // 'Junction Box',
    // 'No U-Turn',
    // 'No Entry',
    // 'No Left Turn',
    // 'Low Flying Craft',
    // 'Triangle',
    // 'Dangerous Descent',
    // 'Danger Ahead',
    // 'turn Left',
    // 'Overtaking By Goods Vehicles Prohibited',
    // 'No Entry fir Vehicles Exceeding 10 meter in length',
    // 'Double Bend on the Road',
    // 'Filling Station',
    // 'No Entry for Animal Drawn Vehicles',
    // 'No Entry for Agriculture Vehicle',
    // 'Two Way Traffic Crosses One Way Road',
    // 'Draw Bridge',
    // 'Centre Line No Overtaking Zone',
    // 'Overtaking Not Allowed',
    // 'Telephone Facility',
    // 'No Entry for Goods Vehicle',
    // 'No Entry for Pedestrian',
    // 'End of Prohibition of Overtaking',
    // 'Turn to the Left',
    // 'Go Straight Ahead',
    // 'Soft Verges',
    // 'Road Works',
    // 'Parking',
    // 'Hospital',
    // 'Rectangle',
    // 'Give Way to the Traffic Appraoching From Right Side',
    // 'After 100 M Motor Way Exit',
    // 'After 200 M Motor Way Exit',
    // 'After 300 M Motor Way Exit',
    // 'Start of Motor Way',
    // 'End of Motor Way',
    // 'No Horn',
    // 'Cross Roads Give Way to the Traffic Coming From Right Side',
    // 'National Speed Limit Applies',
    // 'Stop Line',
    // 'Give Way',
    // 'Level Crossing With Gate',
    // 'Lose Gravel',
    // 'Restaurant',
    // 'Sharp Deviation of Route Left',
    // 'No',
  ];

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
                              // Text('${(percent * 100).toStringAsFixed(0)} %'),
                              currentQuestionIndex == questions.length
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
                    currentQuestionIndex == questions.length
                        ? const Text(
                            '',
                            style: TextStyle(fontSize: 18),
                          )
                        : Text(
                            'Question : ${questions[point]['question'].toString()}      ${point + 1}/${questions.length}'),
                    const SizedBox(
                      height: 15,
                    ),
                    currentQuestionIndex == questions.length
                        ? const Text('')
                        : Image.asset(
                            questions[point]['image'],
                            height: 100,
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    currentQuestionIndex == questions.length
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
                            option: optionsList[optionPoint][0],
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    currentQuestionIndex == questions.length
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
                            option: optionsList[optionPoint][1],
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    currentQuestionIndex == questions.length
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
                            option: optionsList[optionPoint][2],
                          ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                currentQuestionIndex != questions.length
                    ? AppButton(
                        color: color ?? Theme.of(context).colorScheme.primary,
                        text: text,
                        isEnable: isOptionSelected,
                        ontap: isOptionSelected && percent <= 1.0000000000000002
                            ? () {
                                setState(() {
                                  percent = percent + 0.05;
                                  print(optionsList[optionPoint]
                                      [selectedValue - 1]);
                                  print([percent]);
                                  if (percent <= 1.0000000000000002) {
                                    print('inside');
                                    checkAnswer(optionsList[optionPoint]
                                        [selectedValue - 1]);
                                    log(optionsList[optionPoint]
                                        [selectedValue - 1]);

                                    color =
                                        Theme.of(context).colorScheme.primary;

                                    selectedValue = 0;
                                    // point = (point + 1) % questions.length;
                                    point = point < questions.length - 1
                                        ? (point + 1) % questions.length
                                        : point + 1;

                                    log(point.toString());
                                    optionPoint =
                                        (optionPoint + 1) % optionsList.length;
                                    isOptionSelected = false;
                                    // Reset option selection
                                  }
                                });
                              }
                            : null,
                      )
                    : const Text(''),
                currentQuestionIndex == questions.length
                    ? AppButton(
                        ontap: () async {
                          !isPlayedOnce
                              ? context.read<TotalScore>().addScoreToList(
                                    ScoreDate(
                                        score: score,
                                        date: DateTime.now(),
                                        catagory: 'Sign Quiz'),
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
                                      'Obtained Score is : ${score.toString()} / ${questions.length}',
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

  void checkAnswer(String selectedAnswer) {
    // Get the correct answer for the current question
    String correctAnswer = correctAnswers[currentQuestionIndex];

    // Check if the selected answer matches the correct answer
    if (selectedAnswer == correctAnswer) {
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
