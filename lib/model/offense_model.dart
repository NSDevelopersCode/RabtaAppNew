// class OffenseModel {
//   String message;
//   bool status;
//   List<Data>? data;

//   OffenseModel({
//     required this.message,
//     required this.status,
//     required this.data,
//   });

//   factory OffenseModel.fromJson(Map<String, dynamic> json) {
//     return OffenseModel(
//       message: json['message'],
//       status: json['status'],
//       data: List<Data>.from(json['data'].map((e) => Data.fromJson(e))),
//     );
//   }
// }

// class Data {
//   String? id;
//   String? offenceCodes;
//   String? engTitle;
//   String? urdTitle;
//   String? motorCycle;
//   String? carJeep;
//   String? ltv;
//   String? psvHtv;

//   Data({
//     required this.id,
//     required this.offenceCodes,
//     required this.engTitle,
//     required this.urdTitle,
//     required this.motorCycle,
//     required this.carJeep,
//     required this.ltv,
//     required this.psvHtv,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) {
//     return Data(
//         id: json['id'],
//         offenceCodes: json['offence_codes'],
//         engTitle: json['eng_title'],
//         urdTitle: json['urd_title'],
//         motorCycle: json['MotorCycle'],
//         carJeep: json['Car/Jeep'],
//         ltv: json['LTV'],
//         psvHtv: json['PSV/HTV']);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['offence_codes'] = offenceCodes;
//     data['eng_title'] = engTitle;
//     data['urd_title'] = urdTitle;
//     data['MotorCycle'] = motorCycle;
//     data['Car/Jeep'] = carJeep;
//     data['LTV'] = ltv;
//     data['PSV/HTV'] = psvHtv;
//     return data;
//   }
// }
class Offense {
  ResponseObject responseObject;
  String output;

  Offense({
    required this.responseObject,
    required this.output,
  });

  factory Offense.fromJson(Map<String, dynamic> json) {
    return Offense(
        responseObject: ResponseObject.fromJson(json['ResponseObject']),
        output: json['Output']);
    //   responseObject = json['ResponseObject'] != null
    //       ? ResponseObject.fromJson(json['ResponseObject'])
    //       : null;
    //   output = json['Output'];
  }
}

class ResponseObject {
  bool status;
  String statusDetails;
  bool isUpdateAvailable;
  int deviceTypeId;
  bool hasOfflineMode;
  int offlineAmountLimit;
  bool isLogoutRequired;
  bool isToast;

  ResponseObject({
    required this.status,
    required this.statusDetails,
    required this.isUpdateAvailable,
    required this.deviceTypeId,
    required this.hasOfflineMode,
    required this.offlineAmountLimit,
    required this.isLogoutRequired,
    required this.isToast,
  });

  factory ResponseObject.fromJson(Map<String, dynamic> json) {
    return ResponseObject(
        status: json['Status'],
        statusDetails: json['StatusDetails'],
        isUpdateAvailable: json['IsUpdateAvailable'],
        deviceTypeId: json['DeviceTypeID'],
        hasOfflineMode: json['HasOfflineMode'],
        offlineAmountLimit: json['OfflineAmountLimit'],
        isLogoutRequired: json['IsLogoutRequired'],
        isToast: json['IsToast']);
  }
}

class Output {}
