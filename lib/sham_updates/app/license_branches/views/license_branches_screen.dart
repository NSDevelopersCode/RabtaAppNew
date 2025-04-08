import 'package:flutter/material.dart';
import 'package:raabta/generic_webview.dart';
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 223, 223),
      appBar: AppBar(
        elevation: 0,
        title: InkWell(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => GenericWebViewPage(
            //         url:
            //             'https://ttmswebview.a2z.care/RaabtaApp/DLBranchesIndex',
            //         title: 'License Branches',
            //       ),
            //     ));
          },
          child: const Text(
            'License Branches',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              onChanged: _filterTable,
              style: TextStyle(color: Colors.green),
              decoration: InputDecoration(
                hintText: "Search by District, Location, or Contact...",
                hintStyle:
                    TextStyle(color: const Color.fromARGB(255, 80, 80, 80)),
                prefixIcon: Icon(Icons.search,
                    color: const Color.fromARGB(255, 10, 109, 1)),
                filled: true,
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // 📊 DataTable with Scrollable View
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26, blurRadius: 10, spreadRadius: 2),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SingleChildScrollView(
                    child: DataTable(
                      dataRowHeight: 60,
                      headingRowHeight: 55,
                      columnSpacing: 15,
                      dividerThickness: 1,
                      headingTextStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                      headingRowColor:
                          WidgetStateProperty.all(Colors.green[800]),
                      columns: [
                        DataColumn(label: Text("District")),
                        DataColumn(label: Text("Location")),
                        DataColumn(label: Text("Contact")),
                      ],
                      rows: filteredData.asMap().entries.map(
                        (entry) {
                          int index = entry.key;
                          var item = entry.value;
                          return DataRow(
                            color: WidgetStateProperty.all(
                              index % 2 == 0
                                  ? Colors.green.shade400
                                  : Colors
                                      .green.shade600, // Alternating row colors
                            ),
                            cells: [
                              DataCell(Text(item["District"]!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white))),
                              DataCell(Text(item["Location"]!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white))),
                              DataCell(Text(item["Contact"]!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white))),
                            ],
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
