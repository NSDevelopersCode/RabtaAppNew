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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Define responsive text styles
    final TextStyle headerStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: screenWidth * 0.04, // Adjust font size based on screen width
    );

    final TextStyle cellStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: screenWidth * 0.035, // Adjust font size based on screen width
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Traffic Training Schools KP',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
      ),
      backgroundColor: Colors.green.shade100,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Search bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
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

            // ListView for vertical scrolling
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
                    child: Column(
                      children: filteredSchools.map((school) {
                        int index = filteredSchools.indexOf(school);
                        return Container(
                          margin: EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? Color.fromARGB(255, 92, 190, 97)
                                : Color.fromARGB(255, 231, 255, 234),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                _buildCell(school['District']!, cellStyle),
                                _buildCell(school['Location']!, cellStyle),
                                _buildCell(
                                    school['Contact']!,
                                    cellStyle.copyWith(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Helper function for creating cells
  Widget _buildCell(String value, TextStyle style) {
    return Expanded(
      child: Text(
        value,
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }
}
