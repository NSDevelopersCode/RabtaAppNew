import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:raabta/model/offense_model.dart';

class OffenseList extends StatefulWidget {
  const OffenseList({super.key});

  @override
  State<OffenseList> createState() => _OffenseListState();
}

class _OffenseListState extends State<OffenseList> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> offenseDataList = [];
  List<dynamic> filteredDataList = [];
  bool isloading = true;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<Offense> getData() async {
    final Map<String, dynamic> bodyMap = {
      "TicketObject": null,
      "TicketViolationsObject": null,
      "AuthenticationObject": {
        "UserName": 0,
        "Password": 0,
        "TokenNumber": "38BB1880-30DB-435F-A413-3D2DCA62EEB5",
        "DeviceSerial": "",
        "ApplicationVersion": 0.0,
        "ApplicationName": "",
        "APIVersion": 0.0,
        "UserTypeID": 0,
        "FcmToken": null
      },
      "ProductObject": {"ProductCode": "3", "ActionType": "1"},
      "Input1": [],
      "Input2": []
    };
    final bodyString = jsonEncode(bodyMap);
    final response =
        await http.post(Uri.parse('https://demokpservice.a2z.care/api/Process'),
            headers: {
              'Content-Type':
                  'application/json', // Set the content type to JSON
            },
            body: bodyString);

    if (response.statusCode == 200) {
      log('message');
      Map<String, dynamic> jsonMap = json.decode(response.body.toString());
      log('message');
      Offense offenseModel = Offense.fromJson(jsonMap);
      offenseDataList = jsonDecode(offenseModel.output);
      log(offenseDataList.toString());
      filteredDataList = List.from(offenseDataList);
      setState(() {
        isloading = false;
      });
      print("Message: ${offenseModel.responseObject.statusDetails}");
      print("Status: ${offenseModel.responseObject.status}");
      print("Data:");

      log('valid');

      return offenseModel;
    } else {
      print('object');
      throw Exception('Failed to load Data');
    }
  }

  void _filterData(String query) {
    if (offenseDataList.isEmpty) {
      log('offenseDataList is empty'); // Debug log
      return; // Prevent filtering if the data is not fetched
    }

    log('Filtering data for query: $query'); // Debugging the query

    setState(() {
      if (query.isEmpty) {
        filteredDataList = List.from(offenseDataList);
      } else {
        log(offenseDataList.length.toString());
        filteredDataList = offenseDataList.where((offense) {
          // Check if 'ViolationID' exists and is not null
          final violationID = offense['ViolationID']?.toString() ?? '';
          return violationID.toLowerCase().contains(query.toLowerCase());
        }).toList();

        log('Filtered list length: ${filteredDataList.length}'); // Debugging filtered list
      }
    });
  }

  Future<bool> _onWillPop() async {
    final currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      // If a field is focused, unfocus and prevent back navigation
      currentFocus.unfocus();
      return false;
    }

    // Allow back navigation if nothing is focused
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
            title: const Text('OFFENSE LIST'),
          ),
          body: isloading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _searchController,
                        decoration: InputDecoration(
                          labelText: 'Search by Violation ID',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onChanged:
                            _filterData, // Call filter logic when text changes
                      ),
                    ),
                    Expanded(
                      // child: FutureBuilder(
                      //   future: getData(),
                      // builder: (context, snapshot) {
                      //   if (snapshot.connectionState ==
                      //       ConnectionState.waiting) {
                      //     return const Center(
                      //         child: CircularProgressIndicator());
                      //   } else if (snapshot.hasError) {
                      //     return Text('Error: ${snapshot.error}');
                      //   }
                      //   if (filteredDataList.isEmpty) {
                      //     return const Center(child: Text('No results found'));
                      //   }
                      // final List<dynamic> offenseDataList =
                      //     jsonDecode(snapshot.data!.output);
                      // log(offenseDataList.toString())x;
                      child: filteredDataList.isEmpty
                          ? const Center(child: Text('No results found'))
                          : ListView.builder(
                              itemCount: filteredDataList.length,
                              itemBuilder: (context, index) {
                                // log(filteredDataList.length.toString());
                                final Map<String, dynamic> offenseData =
                                    filteredDataList[index];
                                return Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Card(
                                      elevation: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Violation Code ',
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        97, 97, 97, 1),
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                Text(
                                                  offenseData['ViolationID']
                                                      .toString(),
                                                  style: TextStyle(
                                                      color:
                                                          Colors.grey.shade700,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    offenseData['eng_title'] ??
                                                        '',
                                                    textAlign: TextAlign.start,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    offenseData['urd_title'],
                                                    textAlign: TextAlign.end,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      // mainAxisSize: MainAxisSize.min,

                                                      children: [
                                                        const Text(
                                                            'MoterCycle : '),
                                                        Text(
                                                          offenseData[
                                                                  'MotorCycle']
                                                              .toString(),
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Text(
                                                            'Car/Jeep : '),
                                                        Text(
                                                          offenseData[
                                                                  'Car_Jeep']
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Text(
                                                            'PSV/LTV : '),
                                                        Text(
                                                          offenseData['LTV']
                                                              .toString(),
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Text('HTV : '),
                                                        Text(
                                                          offenseData['PSV_HTV']
                                                              .toString(),
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),

                                            // ElevatedButton(onPressed: () {}, child: const Text('kamal'))
                                          ],
                                        ),
                                      ),
                                    )
                                    // .animate()
                                    // .slideX(delay: const Duration(milliseconds: 400))
                                    // .fade(),
                                    );
                              }),
                    ),
                  ],
                )),
    );
  }
}
