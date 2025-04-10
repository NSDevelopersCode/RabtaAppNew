import 'package:flutter/material.dart';
import 'package:raabta/sham_updates/app/license_branches/models/branches_list.dart';

class LicenseBranchesScreen extends StatefulWidget {
  const LicenseBranchesScreen({super.key});

  @override
  State<LicenseBranchesScreen> createState() => _LicenseBranchesScreenState();
}

class _LicenseBranchesScreenState extends State<LicenseBranchesScreen> {
  List<Map<String, String>> filteredData = [];

  @override
  void initState() {
    super.initState();
    filteredData = branchesList; // Initially, show all data
  }

  void _filterTable(String query) {
    setState(() {
      filteredData = branchesList
          .where((item) =>
              item["District"]!.toLowerCase().contains(query.toLowerCase()) ||
              item["Location"]!.toLowerCase().contains(query.toLowerCase()) ||
              item["Contact"]!.contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

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
      backgroundColor: const Color.fromARGB(255, 223, 223, 223),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'License Branches',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: _filterTable,
              style: const TextStyle(color: Colors.green),
              decoration: InputDecoration(
                hintText: "Search by District, Location, or Contact...",
                hintStyle:
                    const TextStyle(color: Color.fromARGB(255, 80, 80, 80)),
                prefixIcon: const Icon(Icons.search,
                    color: Color.fromARGB(255, 10, 109, 1)),
                filled: true,
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // 📊 Data List with Scrollable View
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 99, 190, 102),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26, blurRadius: 10, spreadRadius: 2),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SingleChildScrollView(
                    child: Column(
                      children: filteredData.map((item) {
                        int index = filteredData.indexOf(item);
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            color: index % 2 == 0
                                ? const Color.fromARGB(255, 92, 182, 96)
                                : const Color.fromARGB(255, 199, 255,
                                    202), // Alternating row colors
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                _buildCell(item["District"]!, cellStyle),
                                _buildCell(item["Location"]!, cellStyle),
                                _buildCell(
                                    item["Contact"]!,
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
          ),
          const SizedBox(height: 40),
        ],
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
