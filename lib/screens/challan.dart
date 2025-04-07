import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:raabta/model/challan_model.dart';
import 'package:raabta/utils/media_query.dart';
import 'package:raabta/widgets/app_button.dart';

class Challan extends StatefulWidget {
  const Challan({super.key});

  @override
  State<Challan> createState() => _ChallanState();
}

class _ChallanState extends State<Challan> {
  final formKey = GlobalKey<FormState>();
  final challanController = TextEditingController();
  dynamic ticketData;
  List<dynamic>? ticketList;
  ChallanModel? challanModel;
  Map<String, dynamic> outputMap = {};
  bool isloading = false;
  Future<ChallanModel> getChallanData(
      {required TextEditingController ticketID}) async {
    final Map<String, dynamic> bodyMap = {
      "AuthenticationObject": {
        "UserName": "0000",
        "Password": "0000",
        "TokenNumber": "38BB1880-30DB-435F-A413-3D2DCA62EEB5",
        "DeviceSerial": "Rabta app",
        "ApplicationName": "KP TTMS"
      },
      "ProductObject": {"ProductCode": "1", "ActionType": "14"},
      "Input1": [ticketID.text.trim()]
    };
    final bodyString = jsonEncode(bodyMap);
    final response = await http.post(
      Uri.parse('https://demokpservice.a2z.care/api/Process'),
      headers: {
        'Content-Type': 'application/json', // Set the content type to JSON
      },
      body: bodyString,
    );

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body.toString());

      challanModel = ChallanModel.fromJson(jsonMap);
      print('status : ${challanModel!.responseObject!.status}');
      print('status : ${challanModel!.responseObject!.statusDetails}');

      if (challanModel!.responseObject!.status == true) {
        outputMap = jsonDecode(challanModel!.output.toString());
      }

// Access the 'Table' key from the map, which contains the list of ticket data
      setState(() {
        ticketList = outputMap['Table'];
      });

// Now you can access individual ticket data from the list
      // for (ticketData in ticketList) {
      //   print('Ticket ID: ${ticketData['TicketID']}');
      //   print('Ticket No: ${ticketData['TicketNo']}');
      //   print('Offender Name: ${ticketData['OffenderName']}');
      //   // Access other fields similarly
      // }
      return challanModel!;
    } else {
      print('object');
      throw Exception('Failed to load Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Padding(
      //   padding: EdgeInsets.only(top: screenheight(context) * 0.1),
      //   child: const SideBar(),
      // ),
      appBar: AppBar(
        title: const Text(
          'CHALLAN VERIFICATION',
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //   // Status bar color
        //   statusBarColor: Colors.red,

        //   // Status bar brightness (optional)
        //   statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        //   statusBarBrightness: Brightness.light, // For iOS (dark icons)
        // ),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 10,
              ),
              ticketList == null
                  ? Image.asset(
                      'assets/images/logo.png',
                      height: 120,
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: screenwidth(context) * 0.75,
                      child: TextFormField(
                        maxLength: 10,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9]'),
                          )
                        ],
                        validator: (value) {
                          // final RegExp specialCharPattern =
                          //     RegExp(r'[!@#\$&*~,.]');
                          if (value!.isEmpty) {
                            return 'Provide Valid Token';
                          }
                          // if (specialCharPattern.hasMatch(value)) {
                          //   return 'Token must contain at least one special character';
                          // }
                          return null;
                        },
                        keyboardType: const TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            hintText: 'Enter challan token',
                            prefixIcon: Icon(
                              Icons.generating_tokens,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.5,
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary))),
                        controller: challanController,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  isloading
                      ? const CircularProgressIndicator(
                          strokeCap: StrokeCap.round,
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              foregroundColor: Colors.white),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                isloading = true;
                              });
                              await getChallanData(ticketID: challanController);
                              setState(() {
                                FocusScope.of(context).unfocus();
                                isloading = false;
                                challanController.clear();
                              });
                              if (challanModel!.responseObject!.status ==
                                  false) {
                                // ignore: use_build_context_synchronously
                                return showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text(
                                        challanModel!
                                            .responseObject!.statusDetails
                                            .toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                      title: Image.asset(
                                        'assets/images/cross.png',
                                        height: 80,
                                      ),
                                      actions: [
                                        AppButton(
                                            ontap: () {
                                              Navigator.pop(context);
                                            },
                                            isEnable: true,
                                            text: 'Retry',
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary)
                                      ],
                                    );
                                  },
                                );
                              }
                            }
                          },
                          child: const Icon(
                            Icons.search,
                            size: 26,
                          ),
                        ),
                ],
              ),
              ticketList != null
                  ? SizedBox(
                      height: screenheight(context) * 0.7,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: ticketList!.length,
                        itemBuilder: (context, index) {
                          final ticket = ticketList?[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Card(
                                elevation: 4,
                                color: Colors.green.shade50,
                                // surfaceTintColor: Colors.transparent,
                                child: TicketTable(
                                  ticket: ticket,
                                )),
                          );
                        },
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class TicketTable extends StatelessWidget {
  final Map<String, dynamic>? ticket;

  const TicketTable({super.key, this.ticket});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: DataTable(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        headingRowColor: WidgetStatePropertyAll(Colors.green.shade800),
        dataRowMaxHeight: 50,
        columnSpacing: 40,
        dividerThickness: 0.01,
        columns: [
          const DataColumn(
            label: Text(
              'Name',
              style: TextStyle(color: Colors.white),
            ),
          ),
          DataColumn(
            label: Text(
              ticket != null ? ticket!['OffenderName'].toString() : '',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
        rows: List<DataRow>.generate(
          7, // Number of rows
          (index) {
            // Determine if the row index is even or odd for color purposes
            final isEvenRow = index % 2 == 0;

            // Define alternating row colors
            final rowColor = isEvenRow ? Colors.grey.shade200 : Colors.white;

            return DataRow(
              color: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) => rowColor,
              ),
              cells: [
                DataCell(
                  Text(
                    _getLabel(index),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataCell(
                  Text(_getValue(index)),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  String _getLabel(int index) {
    // Return the appropriate label based on row index
    switch (index) {
      case 0:
        return 'TO Name';
      case 1:
        return 'Ticket No';
      case 2:
        return 'Document Number';
      case 3:
        return 'District Name';
      case 4:
        return 'Issuance Date Time';
      case 5:
        return 'Info Message';
      case 6:
        return 'Ticket Status';
      default:
        return '';
    }
  }

  String _getValue(int index) {
    // Return the appropriate value based on row index
    switch (index) {
      case 0:
        return ticket != null ? ticket!['TOName'].toString() : '';
      case 1:
        return ticket != null ? ticket!['TicketNo'].toString() : '';
      case 2:
        return ticket != null ? ticket!['DocumentNumber'] : '';
      case 3:
        return ticket != null ? ticket!['DistrictName'] : '';
      case 4:
        if (ticket != null && ticket!['IssuanceDateTime'] != null) {
          DateTime issuanceDate = DateTime.parse(ticket!['IssuanceDateTime']);
          return issuanceDate.myDate;
        }
        return '';
      case 5:
        return ticket != null ? ticket!['InfoMessage'] : '';
      case 6:
        return ticket != null ? ticket!['TicketStatus'] : '';
      default:
        return '';
    }
  }
}

extension CustomDate on DateTime {
  String get myDate {
    final hour12 = hour % 12 == 0 ? 12 : hour % 12;
    final period = hour < 12 ? 'AM' : 'PM';
    return '$day/$month/$year $hour12:${minute.toString().padLeft(2, '0')} $period';
  }
}
