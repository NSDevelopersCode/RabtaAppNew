class Traffic {
  final String message;
  final bool status;
  final List<TrafficModel>? traffic;

  Traffic({
    required this.message,
    required this.status,
    required this.traffic,
  });

  factory Traffic.fromJson(Map<String, dynamic> json) {
    return Traffic(
      message: json['message'],
      status: json['status'],
      traffic: List<TrafficModel>.from(
        json['data'].map((e) => TrafficModel.fromJson(e)),
      ),
    );
  }
}

class TrafficModel {
  String trafficEducationId;
  String image;
  String imageTitle;
  String imageDescriptionEng;
  String imageDescriptionUrdu;

  TrafficModel({
    required this.trafficEducationId,
    required this.image,
    required this.imageTitle,
    required this.imageDescriptionEng,
    required this.imageDescriptionUrdu,
  });

  factory TrafficModel.fromJson(Map<String, dynamic> json) {
    return TrafficModel(
      trafficEducationId: json['traffic_education_id'],
      image: json['image'],
      imageTitle: json['image_title'],
      imageDescriptionEng: json['image_description_eng'],
      imageDescriptionUrdu: json['image_description_urdu'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'traffic_education_id': trafficEducationId,
      'image': image,
      'image_title': imageTitle,
      'image_description_eng': imageDescriptionEng,
      'image_description_urdu': imageDescriptionUrdu,
    };
  }
}
