import 'package:flutter/material.dart';
import 'package:raabta/generic_webview.dart';
import 'package:raabta/utils/media_query.dart';

class AdminissionProcedureScreen extends StatelessWidget {
  AdminissionProcedureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: InkWell(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const GenericWebViewPage(
              //             url:
              //                 'https://ttmswebview.a2z.care/Raabtaapp/DSAdmission',
              //             title: 'Admission Procedure')));
            },
            child: const Text(
              'Admission Procedure',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 221, 221, 221),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: const Text(
                  'DRIVING SCHOOL \nADMISSION',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 46, 126, 48),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(height: screenheight(context) * 0.55, child: Cont()),
              FeeStructureScreen(),
              const SizedBox(height: 10),
            ]),
          ),
        ));
  }
}

class Cont extends StatelessWidget {
  Cont({super.key});

  final List<Map<String, dynamic>> steps = [
    {"text": "Visit your district driving school.", "icon": Icons.location_on},
    {"text": "Age should be above 18 years.", "icon": Icons.cake},
    {"text": "Valid CNIC.", "icon": Icons.credit_card},
    {
      "text":
          "The school administration will issue you a Driving Learner Permit.",
      "icon": Icons.school
    },
    {
      "text": "Get admission for Motorcycle, Motorcar, or LTV.",
      "icon": Icons.directions_car
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 41, 151, 48),
            const Color.fromARGB(255, 40, 88, 43)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              " How to Take Admission? in Driving School",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(2, 4),
                        )
                      ],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green.shade700,
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(
                        steps[index]["text"],
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(
                        size: 30,
                        steps[index]["icon"],
                        color: Colors.green.shade700,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeeStructureScreen extends StatelessWidget {
  final List<Map<String, String>> feeList = [
    {"Course": "Short Course Motorcycle\n (Two Weeks)", "Fee": "Rs.3,000/-"},
    {"Course": "Short Course Motorcar\n (Two Weeks)", "Fee": "Rs.7,000/-"},
    {"Course": "Long Course LTV\n (Four Weeks)", "Fee": "Rs.10,000/-"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.green.shade900, Colors.green.shade500],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "📋 Fee Structure",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Fee schedule for driving training course:",
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(2, 4),
                    )
                  ],
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.green.shade700,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Course",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text("Fee",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                    ...feeList.map((item) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(item["Course"]!,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Text(item["Fee"]!,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green.shade800)),
                          ],
                        ),
                      );
                    }).toList(),
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
