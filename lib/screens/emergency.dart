import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:raabta/widgets/dashboard_widgets/emergency_tile.dart';

class EmergencyNumbers extends StatefulWidget {
  const EmergencyNumbers({super.key});

  @override
  State<EmergencyNumbers> createState() => _EmergencyNumbersState();
}

class _EmergencyNumbersState extends State<EmergencyNumbers> {
  // Data for each tab
  List<Map<String, dynamic>> cmComplaintCellData = [
    {
      "image": "1",
      "subtitle": "091-9222460",
      "title": "Chief Minister Complaint Cell",
    },
    {
      "image": "2",
      "subtitle": "0331-8596062",
      "title": "Chairman CM KP Complaint Cell",
    },
    {
      "image": "3",
      "subtitle": "0314-9044205",
      "title": "Chairman Peshawar District Complaint Cell",
    },
    {
      "image": "4",
      "subtitle": "8855",
      "title": "Police Complaint Cell",
    },
    {
      "image": "5",
      "subtitle": "8889",
      "title": "Schools & Teacher Complaint Cell",
    },
    {
      "image": "6",
      "subtitle": "091-9210553",
      "title": "Tehsil Dar Complaint Cell",
    },
    {
      "image": "7",
      "subtitle": "0321-9347630",
      "title": "Transport & Transporters",
    },
    {
      "image": "8",
      "subtitle": "8333",
      "title": "Traffic Police Complaint Cell",
    },
    {
      "image": "9",
      "subtitle": "091-9216922",
      "title":
          "Illegal Clinics & Unregistered Drug Store & Laboratories Complaint Cell",
    },
    {
      "image": "10",
      "subtitle": "080057784",
      "title": "Khyber Pakhtunkhwa Terror Complaint Cell",
    },
    {
      "image": "11",
      "subtitle": "0346-9048844",
      "title": "Secretary Peshawar District Compliant Cell",
    },
    {
      "image": "12",
      "subtitle": "080091133",
      "title": "Commissioner Peshawar District Complaint Cell",
    },
    {
      "image": "13",
      "subtitle": "8333",
      "title": "Complaint on Shopkeepers & Milk Sellers",
    },
  ];

  List<Map<String, dynamic>> policeEmergencyData = [
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "091-2264224-25",
      "title": "Rescue 1122 Peshawar HQrs",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "0937-9230770",
      "title": "Rescue 1122 Mardan",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "091-9212534",
      "title": "Fire Brigade Cantt:",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "091-2566666",
      "title": "Fire Brigade City",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "091-9212222",
      "title": "Police Emergency",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "091-2214575",
      "title": "Edhi Ambulance",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "091-2210836",
      "title": "Red Crescent Ambulance",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "091-2590846",
      "title": "Emergency Ambulance",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "091-9212176",
      "title": "Civil Defence, Peshawar",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "091-9211430",
      "title": "Lady Reading Hospital, Peshawar",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "091-9217140-46",
      "title": "Hayatabad Medical Complex, Peshawar",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "091-9216340-8",
      "title": "Khyber Teaching Hospital, Peshawar",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "091-9216115",
      "title": "Irnam Hospital, Peshawar",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "091-2212371",
      "title": "Mission Hospital, Peshawar",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "091-2215945",
      "title": "Al-Khidmat Hospital, Peshawar",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "091-9212771-4",
      "title": "Fauji Foundation Hospital, Peshawar",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "091-5703463",
      "title": "Frontier Foundation Blood Services, Peshawar",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "091-5841632",
      "title": "Hamza Foundation, Peshawar",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "091-9213016",
      "title": "Sui Gas, Peshawar",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "091-9212041",
      "title": "WAPDA Complaint Office Shami Road, Peshawar",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "091-9213351       111-768-786 (UAN)",
      "title": "PIA, Peshawar",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "114",
      "title": "Airport Inquiry",
    },
    {
      "image": "assets/images/KP_logo.png",
      "subtitle": "117",
      "title": "Railway Inquiry",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Emergency Numbers',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            const TabBar(
              padding: EdgeInsets.only(bottom: 5),
              dividerColor: Colors.transparent,
              tabs: [
                Tab(text: "Emergency Numbers"),
                Tab(text: "Complaint Cell"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Tab 1 content
                  SlidableAutoCloseBehavior(
                    child: ListView.builder(
                      itemCount: policeEmergencyData.length,
                      itemBuilder: (context, index) {
                        final myData = policeEmergencyData[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: EmergencyTile(
                            image: 'assets/images/KP_logo.png',
                            subtitle: myData['subtitle'],
                            title: myData['title'],
                            onTap: () {
                              debugPrint("Tapped on ${myData['title']}");
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  // Tab 2 content
                  ListView.builder(
                    itemCount: cmComplaintCellData.length,
                    itemBuilder: (context, index) {
                      final myData = cmComplaintCellData[index];
                      return EmergencyTile(
                        image: 'assets/images/KP_logo.png',
                        subtitle: myData['subtitle'],
                        title: myData['title'],
                        onTap: () {
                          debugPrint("Tapped on ${myData['title']}");
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
