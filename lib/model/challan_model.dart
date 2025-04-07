class ChallanModel {
  ResponseObject? responseObject;
  String? output;

  ChallanModel({this.responseObject, this.output});

  ChallanModel.fromJson(Map<String, dynamic> json) {
    responseObject = json['ResponseObject'] != null
        ? ResponseObject.fromJson(json['ResponseObject'])
        : null;
    output = json['Output'] ?? '';
  }
}

class ResponseObject {
  bool? status;
  String? statusDetails;
  bool? isUpdateAvailable;
  int? deviceTypeID;
  bool? hasOfflineMode;
  int? offlineAmountLimit;
  bool? isLogoutRequired;
  bool? isToast;

  ResponseObject(
      {this.status,
      this.statusDetails,
      this.isUpdateAvailable,
      this.deviceTypeID,
      this.hasOfflineMode,
      this.offlineAmountLimit,
      this.isLogoutRequired,
      this.isToast});

  ResponseObject.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    statusDetails = json['StatusDetails'];
    isUpdateAvailable = json['IsUpdateAvailable'];
    deviceTypeID = json['DeviceTypeID'];
    hasOfflineMode = json['HasOfflineMode'];
    offlineAmountLimit = json['OfflineAmountLimit'];
    isLogoutRequired = json['IsLogoutRequired'];
    isToast = json['IsToast'];
  }
}
