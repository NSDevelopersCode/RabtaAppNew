class LicenseModel {
  String? data;
  String? error;

  LicenseModel({this.data, this.error});

  factory LicenseModel.fromJson(Map<String, dynamic> json) {
    return LicenseModel(
      data: json['LICENSE_DATA'],
      error: json['error'],
    );
  }
}
