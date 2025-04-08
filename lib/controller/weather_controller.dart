import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:raabta/model/weather_model.dart';

class WeatherController extends ChangeNotifier {
  static const url = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey = '405716f9fadc95c2fec53065ca559281';
  WeatherModel? weatherModel;
  Future<WeatherModel> getWeather(String cityName) async {
    try {
      final response = await http
          .get(Uri.parse('$url?q=$cityName&appid=$apiKey&units=metric'));
      if (response.statusCode == 200) {
        log(response.body);
        notifyListeners();

        weatherModel = WeatherModel.fromJson(jsonDecode(response.body));
        notifyListeners();
        return weatherModel!;
      } else {
        throw Exception('Failed to load');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      notifyListeners();
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    notifyListeners();
    log(placemark.toString());
    Placemark place = placemark[0];
    String? city = place.locality;

    return city ?? 'cannot find it';
  }

  String getWeatherAnimation(String condition) {
    switch (condition.toLowerCase()) {
      case 'clouds':
        weatherModel!.conditon = condition;
        notifyListeners();
        return 'assets/images/cloudy.json';

      case 'rain':
        weatherModel!.conditon = condition;
        notifyListeners();
        return 'assets/images/rain.json';

      case 'haze':
        weatherModel!.conditon = condition;
        notifyListeners();
        return 'assets/images/haze.json';

      case 'thunder':
        weatherModel!.conditon = condition;
        notifyListeners();
        return 'assets/images/thunder.json';
      case 'clear':
        weatherModel!.conditon = condition;
        notifyListeners();
        return 'assets/images/sun.json';
      case 'Partly cloudy':
        weatherModel!.conditon = condition;
        notifyListeners();
        return 'assets/images/cloudy.json';
      case 'mist':
        weatherModel!.conditon = condition;
        notifyListeners();
        return 'assets/images/haze.json';
      case 'smoke':
        weatherModel!.conditon = condition;
        notifyListeners();
        return 'assets/images/smoke.json';
      case 'snow':
        weatherModel!.conditon = condition;
        notifyListeners();
        return 'assets/images/snow.json';
      case 'fog':
        weatherModel!.conditon = condition;
        notifyListeners();
        return 'assets/images/smoke.json';
      default:
        weatherModel!.conditon = condition;
        notifyListeners();
        return 'assets/images/sun.json';
    }
  }
}
