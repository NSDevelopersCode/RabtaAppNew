import 'package:flutter/material.dart';
import 'package:raabta/utils/media_query.dart';

class Prepare extends StatefulWidget {
  const Prepare({super.key});

  @override
  State<Prepare> createState() => _PrepareState();
}

class _PrepareState extends State<Prepare> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFDFDFD),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Solved Questions',
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.green.shade100),
                height: screenheight(context) * 0.06,
                width: screenwidth(context) * 0.9,
                child: TabBar(
                  controller: tabController,
                  labelColor: Colors.white,
                  dividerColor: Colors.transparent,
                  // indicator: const BoxDecoration(color: Colors.red),
                  indicator: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(18)),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 0),
                  unselectedLabelColor: Theme.of(context).colorScheme.primary,
                  indicatorColor: Theme.of(context).colorScheme.secondary,

                  overlayColor: WidgetStateProperty.resolveWith<Color?>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.pressed)) {
                        return Colors.white;
                      }
                      return null;
                    },
                  ),
                  tabs: const [
                    Tab(
                      text: 'Theory Questions',
                    ),
                    Tab(
                      text: 'Sign Questions',
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: screenheight(context) * 0.79,
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    SingleChildScrollView(
                      child: TheoryQuestion(),
                    ),
                    SingleChildScrollView(
                      child: SignQuestions(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignQuestions extends StatelessWidget {
  const SignQuestions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CardWidget(
          totalQuestions: '20',
          questionNo: 1,
          selected: 2,
          image: 'assets/images/1.jpeg',
          question: 'What does this sign mean ?',
          options: [
            'Left stop',
            'No Right Turn',
            'Right Turn',
          ],
          // firstOption: 'When Engine heat up',
          // secondOption: 'After every 600 Km',
          // thirdOption: 'prior to Leaving for long journey',
        ),
        CardWidget(
          totalQuestions: '20',
          questionNo: 2,
          selected: 3,
          question: 'What does this sign mean ?',
          image: 'assets/images/2.jpeg',
          options: [
            'Airport',
            'Petrol Pump',
            'Strong cross wing',
          ],
        ),
        CardWidget(
          totalQuestions: '20',
          questionNo: 3,
          selected: 2,
          question: 'What does this sign mean ?',
          image: 'assets/images/3.jpeg',
          options: [
            'Passing Police Custom post without stopping',
            'Custom police Ahead',
            'Danger Ahead',
          ],
        ),
        CardWidget(
          totalQuestions: '20',
          questionNo: 4,
          selected: 1,
          question: 'What does this sign mean ?',
          image: 'assets/images/4.jpeg',
          options: [
            'No entry for vehicle Exceeding 6 ton weight on Axle',
            'No Entry for good Vehicles',
            'Height of The Bridge 6 feet',
          ],
        ),
        CardWidget(
          totalQuestions: '20',
          questionNo: 5,
          selected: 2,
          question: 'What does this sign mean ?',
          image: 'assets/images/5.jpeg',
          options: [
            'Crossing',
            'Stop Line',
            'Lines',
          ],
        ),
        CardWidget(
          totalQuestions: '20',
          questionNo: 6,
          selected: 2,
          question: 'What does this sign mean ?',
          image: 'assets/images/6.jpeg',
          options: [
            'Parking',
            'No Parking',
            'Stop',
          ],
        ),
        CardWidget(
          totalQuestions: '20',
          questionNo: 7,
          selected: 1,
          question: 'What does this sign mean ?',
          image: 'assets/images/7.jpeg',
          options: [
            'End of speed Limit Imposed',
            'Round About',
            'Road Closed',
          ],
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 8,
          selected: 1,
          question: 'What does this sign mean ?',
          image: 'assets/images/8.jpeg',
          options: [
            'Other Dangers',
            'Warning',
            'Road Closed',
          ],
        ),
        CardWidget(
          totalQuestions: '20',
          questionNo: 9,
          selected: 2,
          question: 'What does this sign mean ?',
          image: 'assets/images/9.jpeg',
          options: [
            'Animal Crossing',
            'Wild Animal Crossing',
            'Cattle Crossing',
          ],
        ),
        CardWidget(
          totalQuestions: '20',
          questionNo: 10,
          selected: 2,
          question: 'What does this sign mean ?',
          image: 'assets/images/10.jpeg',
          options: [
            'Red',
            'Hospital',
            'First Aid Centre',
          ],
        ),
        CardWidget(
          totalQuestions: '20',
          questionNo: 11,
          selected: 3,
          question: 'What does this sign mean ?',
          image: 'assets/images/11.jpeg',
          options: [
            'Restaurant',
            'Hospital',
            'Bus stop',
          ],
        ),
        CardWidget(
          totalQuestions: '20',
          questionNo: 12,
          selected: 2,
          question: 'What does this sign mean ?',
          image: 'assets/images/12.jpeg',
          options: [
            'No entry for cycle',
            'No entry for M. Cycle',
            'No entry',
          ],
        ),
        CardWidget(
          totalQuestions: '20',
          questionNo: 13,
          selected: 2,
          question: 'What does this sign mean ?',
          image: 'assets/images/13.jpeg',
          options: [
            'Un even Road',
            'Road Dips',
            'Slippery Road',
          ],
        ),
        CardWidget(
          totalQuestions: '20',
          questionNo: 14,
          selected: 3,
          question: 'What does this sign mean ?',
          image: 'assets/images/14.jpeg',
          options: [
            'Steep Ascent',
            'Dangerous Decent',
            'Slippery road',
          ],
        ),
        CardWidget(
          totalQuestions: '20',
          questionNo: 15,
          selected: 2,
          question: 'What does this sign mean ?',
          image: 'assets/images/15.jpeg',
          options: [
            'Level Crossing (with Gate)',
            'Level Crossing (without Gate)',
            'Train Engine',
          ],
        ),
        CardWidget(
          totalQuestions: '20',
          questionNo: 16,
          selected: 2,
          question: 'What does this sign mean ?',
          image: 'assets/images/16.jpeg',
          options: [
            'Children Crossing',
            'Pedestrian Crossing',
            'Bus Stop',
          ],
        ),
        CardWidget(
          totalQuestions: '20',
          questionNo: 17,
          selected: 2,
          question: 'What does this sign mean ?',
          image: 'assets/images/17.jpeg',
          options: [
            'Hand',
            'Stop',
            'Five fingers',
          ],
        ),
        CardWidget(
          totalQuestions: '20',
          questionNo: 18,
          selected: 2,
          question: 'What does this sign mean ?',
          image: 'assets/images/18.jpeg',
          options: [
            'Stop',
            'Slow',
            'Stop Ahead',
          ],
        ),
        CardWidget(
          totalQuestions: '20',
          questionNo: 19,
          selected: 1,
          question: 'What does this sign mean ?',
          image: 'assets/images/19.jpeg',
          options: [
            'Road is Closed Ahead',
            'Stop',
            'One Way',
          ],
        ),
        CardWidget(
          totalQuestions: '20',
          questionNo: 20,
          selected: 3,
          question: 'What does this sign mean ?',
          image: 'assets/images/20.jpeg',
          options: [
            'Keep Left',
            'Arrow',
            'One Way',
          ],
        ),
        // CardWidget(
        //   questionNo: 3,
        //   selected: 1,
        //   question: "What is the name of motorway Peashawar to Islamabad?",
        //   firstOption: 'M-2',
        //   secondOption: 'M-1',
        //   thirdOption: "M-3",
        // ),
        // CardWidget(
        //   questionNo: 3,
        //   selected: 1,
        //   question:
        //       "Always keep your vehicle journey which will helpful is case of accident ?",
        //   firstOption: 'Injection',
        //   secondOption: 'Cream',
        //   thirdOption: "First Aid Box",
        // ),
        // CardWidget(
        //   questionNo: 3,
        //   selected: 1,
        //   question: "Reduction of which oil cause accidents ?",
        //   firstOption: 'Fuel',
        //   secondOption: 'Engine oil',
        //   thirdOption: "Break oil",
        // ),
        // CardWidget(
        //   questionNo: 3,
        //   selected: 1,
        //   question: "The reaction of aged driver is ?",
        //   firstOption: 'Fast',
        //   secondOption: 'Medium',
        //   thirdOption: "Slow",
        // ),
        // CardWidget(
        //   questionNo: 3,
        //   selected: 1,
        //   question:
        //       "According to statistics mostly drivers of which are involved in fatal accidents ?",
        //   firstOption: '17 to 25 years',
        //   secondOption: '25 to 40 years',
        //   thirdOption: "40 to 50 years",
        // ),
        // CardWidget(
        //   questionNo: 3,
        //   selected: 1,
        //   question: "In which time honk is not allowed in residential areas ?",
        //   firstOption: '12:30 AM to 08:00 AM',
        //   secondOption: '11:30 AM to 07:00 AM',
        //   thirdOption: "01:00 AM to 09:00 AM",
        // ),
        // CardWidget(
        //   questionNo: 3,
        //   selected: 1,
        //   question:
        //       "A driver's eyesight must be able to read a vehicle number plate from a distance of ?",
        //   firstOption: 'From a distance of 35 feet',
        //   secondOption: 'From a distance of 40 feet',
        //   thirdOption: "From a distance of 67 feet",
        // ),
        // CardWidget(
        //   questionNo: 3,
        //   selected: 1,
        //   question: "Can you park your vehicle at bus stop ?",
        //   firstOption: "Don't Know",
        //   secondOption: 'Can park',
        //   thirdOption: "Not allowed",
        // ),
        // CardWidget(
        //   questionNo: 3,
        //   selected: 1,
        //   question: "Do you park vehicle at Motorway ?",
        //   firstOption: "Not allowed",
        //   secondOption: 'Allowed',
        //   thirdOption: "Don't Know",
        // ),
        // CardWidget(
        //   questionNo: 3,
        //   selected: 1,
        //   question: "In case of emergency you can stop your vehicle at ?",
        //   firstOption: "hard Shoulder",
        //   secondOption: 'Double yellow line',
        //   thirdOption: "Footpath",
        // ),
        // CardWidget(
        //   questionNo: 3,
        //   selected: 1,
        //   question: "Which of the following should you do before stopping ?",
        //   firstOption: "Use the mirrors",
        //   secondOption: 'Suddenly use the breaks',
        //   thirdOption: "Sound the horn",
        // ),
        // CardWidget(
        //   questionNo: 3,
        //   selected: 1,
        //   question: "When may you should sound the horn of you vehicle ?",
        //   firstOption: "As a warning of danger to any road user",
        //   secondOption: 'To signal the driver ahead to driver faster',
        //   thirdOption: "As a greeting to someone you know",
        // ),
        // CardWidget(
        //   questionNo: 3,
        //   selected: 1,
        //   question:
        //       "If there are no lanes marked on the road you should driver on which side ?",
        //   firstOption: "Any side of the road",
        //   secondOption: 'Middle of the road',
        //   thirdOption: "Left side of the road",
        // ),
        // CardWidget(
        //   questionNo: 3,
        //   selected: 1,
        //   question: "When there are three lanes on freeway ?",
        //   firstOption: "The right lane is reversedfor overtaking",
        //   secondOption: 'The right lane is for emergency vehicle only',
        //   thirdOption: "The right lane is for avoiding most traffic",
        // ),
        // CardWidget(
        //   questionNo: 3,
        //   selected: 1,
        //   question:
        //       "Are you allowed to use a hand-held mobile phone while driving a car ?",
        //   firstOption:
        //       "Yes but you must hold the steering wheel with at least one hand",
        //   secondOption: 'yes but only when you stop at intersection',
        //   thirdOption: "No",
        // ),
        // CardWidget(
        //   questionNo: 3,
        //   selected: 1,
        //   question:
        //       "Are you required to carry your driver's license with you every time you drive ?",
        //   firstOption: "Yes",
        //   secondOption: 'No its only needed on long trips',
        //   thirdOption: "No holding a license is enough",
        // ),
      ],
    );
  }
}

class TheoryQuestion extends StatelessWidget {
  const TheoryQuestion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CardWidget(
          totalQuestions: '62',
          questionNo: 1,
          selected: 3,
          question: 'When you will have to check Engine Oil of your vehicle ?',
          firstOption: 'When Engine heat up',
          secondOption: 'After every 600 Km',
          thirdOption: 'prior to Leaving for long journey',
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 2,
          selected: 2,
          question: 'Reduction level of ------ can cause accidents ?',
          firstOption: 'Water of Battery',
          secondOption: 'Brake fluid level',
          thirdOption: 'Radiators Walter',
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 3,
          selected: 3,
          question: 'Zebra Crossing is specified for ?',
          firstOption: 'Animals',
          secondOption: 'Zebras',
          thirdOption: 'Pedestrian',
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 4,
          selected: 2,
          question: 'You are allowed to overtake ?',
          firstOption: 'At main Crossing',
          secondOption: 'At broker center line',
          thirdOption: 'At bridge',
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 5,
          selected: 1,
          question: 'You should switch on your vehicle light after sun set ?',
          firstOption: '20 Minutes',
          secondOption: '30 Minutes',
          thirdOption: '40 Minutes',
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 6,
          selected: 1,
          question: 'which vehicle has the right of way at roundabout ?',
          firstOption: 'The traffic coming from the right side',
          secondOption: 'The traffic coming from the left side',
          thirdOption: 'None of them',
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 7,
          selected: 1,
          question: 'How much distance from intersection should be kept ?',
          firstOption: '10 Meter',
          secondOption: '20 Meter',
          thirdOption: '30 Meter',
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 8,
          selected: 3,
          question: 'What should you do on blind turn ?',
          firstOption: 'Use the back Mirrors',
          secondOption: 'Use the horn',
          thirdOption: 'Slow down your speed',
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 9,
          selected: 1,
          question: 'Where do you see while changing the gear of the vehicle ?',
          firstOption: 'Straight',
          secondOption: 'See the gear',
          thirdOption: 'See the feet',
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 10,
          selected: 1,
          question: 'Which gear is powerful ?',
          firstOption: 'Reverse gear',
          secondOption: 'First gear',
          thirdOption: 'Fourth gear',
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 11,
          selected: 2,
          question: 'Which gear to use during turning ?',
          firstOption: 'First gear',
          secondOption: 'Second gear',
          thirdOption: 'Third gear',
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 12,
          selected: 2,
          question: 'Which sign board shows danger ?',
          firstOption: 'Mandatory',
          secondOption: 'Warning',
          thirdOption: 'Informatory',
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 13,
          selected: 3,
          question: 'On which speed limit you have to fasten the seat belt ?',
          firstOption: '80Km',
          secondOption: '100Km',
          thirdOption: 'At any Speed limit',
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 14,
          selected: 3,
          question:
              'Which indicator will be used while overtaking in roundabout ?',
          firstOption: 'Right',
          secondOption: 'Left',
          thirdOption: 'Overtaking is not allowed',
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 15,
          selected: 2,
          question: 'What do you mean by double yellow line ?',
          firstOption: 'Can park vehicle',
          secondOption: 'Cannot stop',
          thirdOption: 'Give way to heavy vehicle',
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 16,
          selected: 1,
          question:
              'Is it necessary for deiver to keep driving license while driving ?',
          firstOption: 'Yes',
          secondOption: 'No',
          thirdOption: "Don't Know",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 17,
          selected: 3,
          question:
              'In which conditions a driver can park his vehicle on footpath ?',
          firstOption: 'Emergency',
          secondOption: 'Not availabiltiy of parking',
          thirdOption: "Not allowed in any case",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 18,
          selected: 3,
          question:
              'In which condition a public driver can cross the red signal ?',
          firstOption: 'Emergency',
          secondOption: 'While going to market',
          thirdOption: "Never",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 19,
          selected: 2,
          question: 'Can you park your car in front of closed gate ?',
          firstOption: 'Yes',
          secondOption: 'No',
          thirdOption: "Dont' Know",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 20,
          selected: 1,
          question:
              "If your vehicle's speed is 60Km/h you should keep how much distance from front vehicle ?",
          firstOption: '30 Meter',
          secondOption: '40 Meter',
          thirdOption: "50 Meter",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 21,
          selected: 3,
          question:
              "Who will responsible for not fastening seat belt by children ?",
          firstOption: 'Parents',
          secondOption: 'Children',
          thirdOption: "Driver",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 22,
          selected: 1,
          question: "What is the name of motorway Peashawar to Islamabad?",
          firstOption: 'M-2',
          secondOption: 'M-1',
          thirdOption: "M-3",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 23,
          selected: 3,
          question:
              "Always keep your vehicle journey which will helpful is case of accident ?",
          firstOption: 'Injection',
          secondOption: 'Cream',
          thirdOption: "First Aid Box",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 24,
          selected: 3,
          question: "Reduction of which oil cause accidents ?",
          firstOption: 'Fuel',
          secondOption: 'Engine oil',
          thirdOption: "Break oil",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 25,
          selected: 3,
          question: "The reaction of aged driver is ?",
          firstOption: 'Fast',
          secondOption: 'Medium',
          thirdOption: "Slow",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 26,
          selected: 1,
          question:
              "According to statistics mostly drivers of which are involved in fatal accidents ?",
          firstOption: '17 to 25 years',
          secondOption: '25 to 40 years',
          thirdOption: "40 to 50 years",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 27,
          selected: 3,
          question: "In which time honk is not allowed in residential areas ?",
          firstOption: '12:30 AM to 08:00 AM',
          secondOption: '11:30 AM to 07:00 AM',
          thirdOption: "01:00 AM to 09:00 AM",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 28,
          selected: 3,
          question:
              "A driver's eyesight must be able to read a vehicle number plate from a distance of ?",
          firstOption: 'From a distance of 35 feet',
          secondOption: 'From a distance of 40 feet',
          thirdOption: "From a distance of 67 feet",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 29,
          selected: 3,
          question: "Can you park your vehicle at bus stop ?",
          firstOption: "Don't Know",
          secondOption: 'Can park',
          thirdOption: "Not allowed",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 30,
          selected: 3,
          question: "Do you park vehicle at Motorway ?",
          firstOption: "Not allowed",
          secondOption: 'Allowed',
          thirdOption: "Don't Know",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 31,
          selected: 1,
          question: "In case of emergency you can stop your vehicle at ?",
          firstOption: "hard Shoulder",
          secondOption: 'Double yellow line',
          thirdOption: "Footpath",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 32,
          selected: 1,
          question: "Which of the following should you do before stopping ?",
          firstOption: "Use the mirrors",
          secondOption: 'Suddenly use the breaks',
          thirdOption: "Sound the horn",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 33,
          selected: 1,
          question: "When may you should sound the horn of you vehicle ?",
          firstOption: "As a warning of danger to any road user",
          secondOption: 'To signal the driver ahead to driver faster',
          thirdOption: "As a greeting to someone you know",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 34,
          selected: 3,
          question:
              "If there are no lanes marked on the road you should driver on which side ?",
          firstOption: "Any side of the road",
          secondOption: 'Middle of the road',
          thirdOption: "Left side of the road",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 35,
          selected: 1,
          question: "When there are three lanes on freeway ?",
          firstOption: "The right lane is reversed for overtaking",
          secondOption: 'The right lane is for emergency vehicle only',
          thirdOption: "The right lane is for avoiding most traffic",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 36,
          selected: 3,
          question:
              "Are you allowed to use a hand-held mobile phone while driving a car ?",
          firstOption:
              "Yes but you must hold the steering wheel with at least one hand",
          secondOption: 'yes but only when you stop at intersection',
          thirdOption: "No",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 37,
          selected: 1,
          question:
              "Are you required to carry your driver's license with you every time you drive ?",
          firstOption: "Yes",
          secondOption: 'No its only needed on long trips',
          thirdOption: "no holding a license is enough",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 38,
          selected: 3,
          question:
              "If you get sleepy while driving out of the following which is best to do ?",
          firstOption: "Turn On the Radio very loud",
          secondOption: 'Turn On the Heater',
          thirdOption: "Stop rest and change driver if possible",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 39,
          selected: 3,
          question: "The first thing you should do before overtakin is ?",
          firstOption: "Sound your horn",
          secondOption: 'Increase your speed',
          thirdOption:
              "Make sure it is safe and the way is clear of oncoming traffic",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 40,
          selected: 2,
          question: "How can we use mobile phone while driving ?",
          firstOption: "By reducing the speed of vehicle",
          secondOption: 'By stopping the vehicle off the road',
          thirdOption: "By using hands free",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 41,
          selected: 1,
          question: "What do you mean by yellow light ?",
          firstOption: "To stop",
          secondOption: 'Warning',
          thirdOption: "Must stop",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 42,
          selected: 1,
          question: "Your attention can divert if you would use ?",
          firstOption: "Mobile phone",
          secondOption: 'Air conditioner',
          thirdOption: "To see the doors",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 43,
          selected: 3,
          question: "What type of motorcycle is allowed on motorway ?",
          firstOption: "125 CC",
          secondOption: '250 CC',
          thirdOption: "Not Allowed",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 44,
          selected: 1,
          question: "In round about which will be chosen first ?",
          firstOption: "lane",
          secondOption: 'Line',
          thirdOption: "Indicators",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 45,
          selected: 1,
          question: "Which entering round about you have to choose?",
          firstOption: "First Lane",
          secondOption: 'Second Lane',
          thirdOption: "Third Lane",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 46,
          selected: 1,
          question: "How much distance you have to keep while overtaking?",
          firstOption: "2 Seconds",
          secondOption: '5 Seconds',
          thirdOption: "10 Seconds",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 47,
          selected: 2,
          question: "Can you park on zebra or overtake on the Zebra Crossing?",
          firstOption: "Yes",
          secondOption: 'No',
          thirdOption: "Some time",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 48,
          selected: 2,
          question: "When you should avoid overtaking?",
          firstOption: "On bridge",
          secondOption: 'On two way road',
          thirdOption: "on broken center line",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 49,
          selected: 3,
          question:
              "A learner of driver should get training from a driver having experience with driving license ?",
          firstOption: "Two years",
          secondOption: 'One year',
          thirdOption: "Three years",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 50,
          selected: 3,
          question: "Why you use dimmer ?",
          firstOption: "To proceed ahead",
          secondOption: 'To stop',
          thirdOption: "To show your presence",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 51,
          selected: 1,
          question:
              "Is it necessary for driver to keep the high way code book in his vehicle ?",
          firstOption: "Yes",
          secondOption: 'No',
          thirdOption: "Don't Know",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 52,
          selected: 1,
          question:
              "According to the law nobody is allowed to drive until and unless his age is ?",
          firstOption: "Above 18 years",
          secondOption: 'Above 17 years',
          thirdOption: "Above 19 years",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 53,
          selected: 3,
          question: "Fastening of seat belt provides safety to the driver ?",
          firstOption: "Don't Know",
          secondOption: 'No',
          thirdOption: "Yes",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 54,
          selected: 1,
          question: "In which desease a person is not allowed to drive ?",
          firstOption: "Deafness",
          secondOption: 'Cancer',
          thirdOption: "T.B",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 55,
          selected: 2,
          question:
              "During driving at night high beam cannot be used continously ?",
          firstOption: "Yes",
          secondOption: 'No',
          thirdOption: "Don't Know",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 56,
          selected: 2,
          question: "What is the shape of informatory sign ?",
          firstOption: "Circle",
          secondOption: 'Rectangle',
          thirdOption: "Triangle",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 57,
          selected: 3,
          question: "What do you mean by give way sign ?",
          firstOption: "Give way to the traffic coming from back",
          secondOption: 'Give way to the traffic approaching from left side',
          thirdOption: "Give way to the traffic approaching from right side",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 58,
          selected: 2,
          question: "You must walk on motorway ?",
          firstOption: "Yes",
          secondOption: 'No',
          thirdOption: "Don't Know",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 59,
          selected: 1,
          question:
              "Over 90% of accidents are caused by driver or rider's mistake?",
          firstOption: "Yes",
          secondOption: 'No',
          thirdOption: "Don't Know",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 60,
          selected: 3,
          question: "What is the shape of warning signs?",
          firstOption: "Circle",
          secondOption: 'Rectangle',
          thirdOption: "Triangle",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 61,
          selected: 1,
          question: "Not fastening the seat belt is traffic violation ?",
          firstOption: "Yes",
          secondOption: 'No',
          thirdOption: "Don't Know",
        ),
        CardWidget(
          totalQuestions: '62',
          questionNo: 62,
          selected: 2,
          question: "Where you will apply the " "The Rule of Two Second " " ?",
          firstOption: "Restarting the engine",
          secondOption: 'For adequate from front vehicle',
          thirdOption: "During cloudy weather",
        ),
      ],
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key,
      required this.question,
      required this.questionNo,
      this.firstOption,
      this.secondOption,
      this.thirdOption,
      required this.selected,
      this.image,
      this.options,
      required this.totalQuestions});
  final int questionNo;
  final String question;
  final String? firstOption;
  final String? secondOption;
  final String? thirdOption;
  final int selected;
  final String? image;
  final List<String>? options;
  final String totalQuestions;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          elevation: 12,
          surfaceTintColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            child: Column(
              children: [
                Text('Question $questionNo of $totalQuestions'),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                image != null
                    ? Image.asset(
                        image!,
                        height: 80,
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: screenwidth(context) * 0.75,
                  height: screenheight(context) * 0.16,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      selected == 1
                          ? Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                width: screenwidth(context) * 0.7,
                                child: firstOption != null
                                    ? Text(
                                        'A. $firstOption',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            overflow: TextOverflow.ellipsis),
                                      )
                                    : Text(
                                        'A. ${options?[0]}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                              ),
                            )
                          : Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: firstOption != null
                                    ? Text(
                                        'A. $firstOption',
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis),
                                      )
                                    : Text(
                                        'A. ${options?[0]}',
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis),
                                      ),
                              ),
                            ),
                      selected == 2
                          ? Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                width: screenwidth(context) * 0.7,
                                child: secondOption != null
                                    ? Text(
                                        'B. $secondOption',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            overflow: TextOverflow.ellipsis),
                                      )
                                    : Text(
                                        'B. ${options?[1]}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                              ),
                            )
                          : Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: secondOption != null
                                    ? Text(
                                        'B. $secondOption',
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis),
                                      )
                                    : Text(
                                        'B. ${options?[1]}',
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis),
                                      ),
                              ),
                            ),
                      selected == 3
                          ? Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                width: screenwidth(context) * 0.7,
                                child: thirdOption != null
                                    ? Text(
                                        'C. $thirdOption',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            overflow: TextOverflow.ellipsis),
                                      )
                                    : Text(
                                        'C. ${options?[2]}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                              ),
                            )
                          : Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: thirdOption != null
                                    ? Text(
                                        'C. $thirdOption',
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis),
                                      )
                                    : Text(
                                        'C. ${options?[2]}',
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis),
                                      ),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
