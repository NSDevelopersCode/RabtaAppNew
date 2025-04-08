// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:raabta/controller/weather_controller.dart';
import 'package:raabta/utils/media_query.dart';
import 'package:raabta/widgets/alert_dialogue.dart';
import 'package:raabta/widgets/weather_container.dart';
import 'package:raabta/widgets/weather_icon_container.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final _formKey = GlobalKey<FormState>();
  bool isloading = false;
  bool _isMounted = true;
  String weatherCondition = '';
  final cityController = TextEditingController();

  @override
  void initState() {
    _isMounted = true; // Set the flag to true when the widget is mounted
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (_isMounted) {
        setState(() {
          isloading = true;
        });

        var connectivityResult = await Connectivity().checkConnectivity();
        log(connectivityResult.toString());
        if (connectivityResult.contains(ConnectivityResult.none)) {
          log('message');
          setState(() {
            isloading = false;
          });
          _showNoNetworkAlert('Network error');
          return;
        }

        final city = await context.read<WeatherController>().getCity();
        await context.read<WeatherController>().getWeather(city);
        if (_isMounted &&
            context.read<WeatherController>().weatherModel != null) {
          weatherCondition = context
              .read<WeatherController>()
              .getWeatherAnimation(
                  context.read<WeatherController>().weatherModel!.conditon);
        }

        log(context
            .read<WeatherController>()
            .weatherModel!
            .conditon
            .toString());

        if (_isMounted) {
          setState(() {
            isloading = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _isMounted = false; // Set the flag to false when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text('W E A T H E R'),
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenheight(context) * 0.85,
          child: Form(
            key: _formKey,
            child: Center(
              child: isloading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<WeatherController>(
                      builder: (context, value, child) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // TextFieldAndButton(
                            //     label: 'Enter City Name',
                            //     isloading: context
                            //         .watch<LoadingController>()
                            //         .isloading,
                            //     bordercolor:
                            //         Theme.of(context).colorScheme.primary,
                            //     hint: 'search other city',
                            //     hintcolor: Colors.grey.shade400,
                            //     controller: cityController,
                            //     onpressed: () async {
                            //       if (_formKey.currentState!.validate()) {
                            //         context
                            //             .read<LoadingController>()
                            //             .startloading();
                            //         try {
                            //           await context
                            //               .read<WeatherController>()
                            //               .getWeather(
                            //                   cityController.text.trim());
                            //           cityController.clear();
                            //           weatherCondition = context
                            //               .read<WeatherController>()
                            //               .getWeatherAnimation(context
                            //                   .read<WeatherController>()
                            //                   .weatherModel!
                            //                   .conditon);
                            //           log(context
                            //               .read<WeatherController>()
                            //               .weatherModel!
                            //               .conditon
                            //               .toString());
                            //           context
                            //               .read<LoadingController>()
                            //               .stopLoading();
                            //         } catch (e) {
                            //           String errorMessage =
                            //               e.toString().split("] ")[0];
                            //           context
                            //               .read<LoadingController>()
                            //               .stopLoading();
                            //           _showNoNetworkAlert(errorMessage);
                            //           log(e.toString());
                            //         } finally {
                            //           context
                            //               .read<LoadingController>()
                            //               .stopLoading();
                            //         }
                            //       }
                            //     }),

                            SizedBox(
                              width: screenwidth(context),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        value.weatherModel?.city
                                                .toString()
                                                .toUpperCase() ??
                                            'No Internet',
                                        style: myTextStyle(context, 30)),
                                    Text(
                                      '${value.weatherModel?.temp.round() ?? ''} \u00B0C',
                                      style: myTextStyle(context, 44),
                                    ),
                                    Text(value.weatherModel?.conditon ?? '',
                                        style: myTextStyle(context, 24)),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Visibility(
                                maintainSize: true,
                                maintainAnimation: true,
                                maintainState: true,
                                visible: weatherCondition.isNotEmpty,
                                child: Lottie.asset(
                                  weatherCondition,
                                  height: 220,
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                WeatherContainer(
                                  mainText:
                                      '${value.weatherModel?.feels.round() ?? '...'} \u00B0C',
                                  txt: 'Feels : ',
                                ),
                                // const WeatherIconContainer(),
                                WeatherContainer(
                                    mainText:
                                        '${value.weatherModel?.min.round() ?? '...'} \u00B0C',
                                    txt: 'Min : '),
                                WeatherContainer(
                                    mainText:
                                        '${value.weatherModel?.max.round() ?? '...'} \u00B0C',
                                    txt: 'Max : '),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                WeatherContainer(
                                    image: 'assets/images/thermometer.png',
                                    mainText:
                                        '${value.weatherModel?.pressure.round() ?? '...'} MB',
                                    txt: 'Pressure : '),
                                const WeatherIconContainer(),
                                WeatherContainer(
                                    image: 'assets/images/humidity.png',
                                    mainText:
                                        '${value.weatherModel?.humidity.round() ?? '...'}  %',
                                    txt: 'Humidity : ')
                              ],
                            )
                          ],
                        );
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle myTextStyle(BuildContext context, double value) {
    return TextStyle(
        fontSize: value,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary);
  }

  void _showNoNetworkAlert(String error) {
    log("Attempting to show No Network Alert");
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogue(
          content: error.toString(),
          image: 'assets/images/wifi-slash.png',
          title: 'No Network',
          onTap: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
