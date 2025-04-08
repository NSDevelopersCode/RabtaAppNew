import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raabta/controller/weather_controller.dart';
import 'package:raabta/utils/media_query.dart';

class WeatherIconContainer extends StatefulWidget {
  const WeatherIconContainer({
    super.key,
  });

  @override
  State<WeatherIconContainer> createState() => _WeatherIconContainerState();
}

class _WeatherIconContainerState extends State<WeatherIconContainer> {
  late List<ConnectivityResult> connectivityResult;
  bool isConnected = true;
  @override
  void initState() {
    checkInternet();
    super.initState();
  }

  checkInternet() async {
    connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      setState(() {
        isConnected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: screenwidth(context) * 0.32,
        height: 100,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: isConnected
              ? Image.network(
                  'http://openweathermap.org/img/w/${context.watch<WeatherController>().weatherModel?.icon}.png',
                )
              : Image.asset(
                  'assets/images/wifi-slash.png',
                  height: 50,
                ),
        ),

        // color: Colors.red,
      ),
    );
  }
}
