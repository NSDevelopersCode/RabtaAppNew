import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:raabta/model/license_model.dart';
import 'package:raabta/utils/media_query.dart';
import 'package:raabta/widgets/app_button.dart';

class VehicleLicense extends StatefulWidget {
  const VehicleLicense({super.key});

  @override
  State<VehicleLicense> createState() => _VehicleLicenseState();
}

class _VehicleLicenseState extends State<VehicleLicense> {
  final vehicleLicenseController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  LicenseModel? licenseModel;
  Map<String, dynamic>? licenseDataJson;
  bool isloading = false;

  Future<LicenseModel> getLicenseData() async {
    final response = await http.post(
      Uri.parse(
        'https://api.ptpkp.gov.pk/api.php?key=GMSlzJPqDzGgx1OsBC7B5YYTNh27eL9d&search=${vehicleLicenseController.text.trim()}',
      ),
    );

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body.toString());
      log('message');
      licenseModel = LicenseModel.fromJson(jsonMap);

      log('hi');
      if (jsonMap != null && jsonMap['LICENSE_DATA'] == "[]") {
        log('saqlain');

        licenseDataJson = null; // Set to null if it's a list
      } else {
        log('kamal');
        licenseDataJson = json.decode(jsonMap['LICENSE_DATA']);
      }

      print(licenseDataJson?['nic'].toString());
      return licenseModel!;
    } else {
      print('object');
      throw Exception('Failed to load Data');
    }
  }

  var maskFormatter = MaskTextInputFormatter(
    mask: '#####-#######-#',
    filter: {"#": RegExp(r'[0-9]')},
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const SideBar(),
      appBar: AppBar(
        title: const Text(
          'LICENSE VERIFICATION',
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
              licenseDataJson == null
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
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9]'),
                          ),
                        ],
                        maxLength: 13,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Provide Valid CNIC';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            label: const Text(
                              'Enter Cnic Number',
                              style: TextStyle(color: Colors.grey),
                            ),
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            hintText: '1234532334489',
                            prefixIcon: Icon(
                              Icons.generating_tokens,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary))),
                        controller: vehicleLicenseController,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  isloading
                      ? const Center(
                          child: CircularProgressIndicator(),
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
                              await getLicenseData();
                              setState(() {
                                FocusScope.of(context).unfocus();
                                isloading = false;
                                vehicleLicenseController.clear();
                              });
                              if (licenseModel!.error != '0') {
                                // ignore: use_build_context_synchronously
                                return showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text(
                                        licenseModel!.error.toString(),
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
              licenseDataJson != null
                  ? SizedBox(
                      height: screenheight(context) * 0.7,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Card(
                                elevation: 3,
                                color: Colors.white,
                                // surfaceTintColor: Colors.transparent,
                                child: VehicleTable(
                                  vehicle: licenseDataJson,
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

class VehicleTable extends StatelessWidget {
  final Map<String, dynamic>? vehicle;

  const VehicleTable({super.key, this.vehicle});

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
              vehicle != null ? vehicle!['name'].toString() : '',
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
        return 'Father Name';
      case 1:
        return 'CNIC';
      case 2:
        return 'License Number';
      case 3:
        return 'License Type';
      case 4:
        return 'Initial Issue Date';
      case 5:
        return 'Expiry Date';
      case 6:
        return 'District';

      default:
        return '';
    }
  }

  String _getValue(int index) {
    // Return the appropriate value based on row index
    switch (index) {
      case 0:
        return vehicle != null ? vehicle!['father_name'].toString() : '';
      case 1:
        return vehicle != null ? vehicle!['nic'].toString() : '';
      case 2:
        return vehicle != null ? vehicle!['license_no'] : '';
      case 3:
        return vehicle != null ? vehicle!['license_type'] : '';
      case 4:
        if (vehicle != null && vehicle!['initial_issue_date'] != null) {
          return vehicle!['initial_issue_date'];
        }
        return '';
      case 5:
        return vehicle != null ? vehicle!['expiry_date'] : '';
      case 6:
        return vehicle != null ? vehicle!['district'] : '';
      default:
        return '';
    }
  }
}
