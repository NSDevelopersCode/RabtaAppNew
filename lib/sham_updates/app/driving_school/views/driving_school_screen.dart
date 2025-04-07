import 'package:flutter/material.dart';
import 'package:raabta/sham_updates/app/driving_school/models/school_list.dart';

class TrafficTrainingSchoolsScreen extends StatefulWidget {
  @override
  _TrafficTrainingSchoolsScreenState createState() =>
      _TrafficTrainingSchoolsScreenState();
}

class _TrafficTrainingSchoolsScreenState
    extends State<TrafficTrainingSchoolsScreen> {
  TextEditingController searchController = TextEditingController();

  List<Map<String, String>> filteredSchools = [];

  @override
  void initState() {
    super.initState();
    filteredSchools = schools;
  }

  void filterSearch(String query) {
    setState(() {
      filteredSchools = schools
          .where((school) =>
              school['District']!.toLowerCase().contains(query.toLowerCase()) ||
              school['Location']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Traffic Training Schools KP',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 3))
                ],
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search for districts or locations...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.green),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
                onChanged: filterSearch,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SingleChildScrollView(
                      child: DataTable(
                        columnSpacing: 25,
                        dataRowHeight: 80,
                        headingRowColor: WidgetStateProperty.resolveWith(
                            (states) => Colors.green.shade700),
                        columns: [
                          DataColumn(
                              label: Text('District',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Location',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Contact',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                        ],
                        rows: filteredSchools.asMap().entries.map((entry) {
                          int index = entry.key;
                          var school = entry.value;

                          return DataRow(
                            color: WidgetStateProperty.resolveWith(
                              (states) => index % 2 == 0
                                  ? Color.fromARGB(
                                      255, 86, 192, 91) // Even row color
                                  : Color.fromARGB(
                                      255, 50, 150, 55), // Odd row color
                            ),
                            cells: [
                              DataCell(Text(school['District']!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.white))),
                              DataCell(Text(school['Location']!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.white))),
                              DataCell(Text(school['Contact']!,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.green.shade100,
    );
  }
}
