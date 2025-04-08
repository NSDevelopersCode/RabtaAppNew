import 'package:flutter/material.dart';
import 'package:raabta/generic_webview.dart';
import 'package:raabta/sham_updates/app/driving_license_fee/models/fee_list.dart';
import 'package:flutter/material.dart';
import 'package:raabta/generic_webview.dart';
import 'package:raabta/sham_updates/app/driving_license_fee/models/fee_list.dart';

class DrivingLicenseFeeScreen extends StatelessWidget {
  const DrivingLicenseFeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: InkWell(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const GenericWebViewPage(
            //         url: 'https://ttmswebview.a2z.care/RaabtaApp/DLFeeIndex',
            //         title: 'Driving License Fee',
            //       ),
            //     ));
          },
          child: Text("Driving License Fee"),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 30),
              ExpandedTile(title: "Motercar / Jeep", feeList: feeList1),
              SizedBox(height: 10),
              ExpandedTile(
                  title: "Motercycle / Motercar / Jeep", feeList: feeList2),
              SizedBox(height: 10),
              ExpandedTile(title: "Motercycle", feeList: feeList3),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandedTile extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> feeList;

  const ExpandedTile({required this.title, required this.feeList, Key? key})
      : super(key: key);

  @override
  _ExpandedTileState createState() => _ExpandedTileState();
}

class _ExpandedTileState extends State<ExpandedTile>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _iconRotation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _iconRotation = Tween<double>(begin: 0.0, end: 0.5).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  void _toggleExpansion(bool expanded) {
    setState(() {
      _isExpanded = expanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Colors.green,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            onExpansionChanged: _toggleExpansion,
            iconColor: Colors.lightGreen,
            collapsedIconColor: Colors.white,
            trailing: RotationTransition(
              turns: _iconRotation,
              child: Icon(Icons.expand_more, size: 30, color: Colors.white),
            ),
            title: Text(
              widget.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.lightGreen[100],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 163, 252, 155),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              spreadRadius: 2),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SingleChildScrollView(
                          child: DataTable(
                            border: TableBorder.all(
                                color: const Color.fromARGB(255, 0, 48, 12),
                                width: 0.2),
                            dataRowHeight: 72,
                            headingRowHeight: 55,
                            columnSpacing: 15,
                            dividerThickness: 1,
                            headingTextStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            headingRowColor:
                                WidgetStateProperty.all(Colors.green[800]),
                            columns: [
                              DataColumn(label: Text("Category")),
                              DataColumn(label: Text("Fee/Details")),
                            ],
                            rows: widget.feeList.asMap().entries.map(
                              (entry) {
                                int index = entry.key;
                                var item = entry.value;
                                return DataRow(
                                  color: WidgetStateProperty.all(
                                    index % 2 == 0
                                        ? Colors.green.shade400 // Even rows
                                        : Colors.green.shade600, // Odd rows
                                  ),
                                  cells: [
                                    DataCell(Text(item["Category"]!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white))),
                                    DataCell(
                                      item["Fee/Details"] is List
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: (item["Fee/Details"]
                                                      as List<dynamic>)
                                                  .map((e) => Text(e,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white)))
                                                  .toList(),
                                            )
                                          : Text(
                                              item["Fee/Details"].toString(),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                            ),
                                    ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
