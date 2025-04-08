class WeatherModel {
  final String city;
  final double temp;
  final double feels;
  final String icon;
  final double min;
  final double max;
  final double pressure;
  final double humidity;

  String conditon;

  WeatherModel({
    required this.min,
    required this.max,
    required this.icon,
    required this.city,
    required this.temp,
    required this.feels,
    required this.conditon,
    required this.humidity,
    required this.pressure,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        min: (json['main']['temp_min'] as num).toDouble(),
        max: (json['main']['temp_max'] as num).toDouble(),
        pressure: (json['main']['pressure'] as num).toDouble(),
        humidity: (json['main']['humidity'] as num).toDouble(),
        city: json['name'],
        temp: (json['main']['temp'] as num).toDouble(),
        feels: (json['main']['feels_like'] as num).toDouble(),
        icon: json['weather'][0]['icon'],
        conditon: json['weather'][0]['main']);
  }
}
