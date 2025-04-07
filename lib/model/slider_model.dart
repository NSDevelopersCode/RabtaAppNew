class SliderModel {
  final String message;
  final bool status;
  final List<Data>? sliderModel;

  SliderModel({
    required this.message,
    required this.status,
    required this.sliderModel,
  });

  factory SliderModel.fromJosn(Map<String, dynamic> json) {
    return SliderModel(
        message: json['message'],
        status: json['status'],
        sliderModel:
            List<Data>.from(json['data'].map((e) => Data.fromJson(e))));
  }
}

class Data {
  final String id;
  final String title;
  final String image;

  Data({
    required this.id,
    required this.image,
    required this.title,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      image: json['image'],
      title: json['title'],
    );
  }
}
