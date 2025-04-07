import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:raabta/controller/map_permission.dart';
import 'package:raabta/utils/media_query.dart';

class TrafficStatus extends StatefulWidget {
  const TrafficStatus({super.key});

  @override
  State<TrafficStatus> createState() => _TrafficStatusState();
}

class _TrafficStatusState extends State<TrafficStatus> {
  late GoogleMapController googlecontroller;
  static const LatLng _center =
      LatLng(37.77483, -122.41942); // Example coordinates (San Francisco)

  @override
  void initState() {
    context.read<GetPermissionLocation>().getPermission();
    super.initState();
  }

  // final CameraPosition _kGoogle = const CameraPosition(
  //   target: LatLng(20.42796133580664, 80.885749655962),
  //   zoom: 11.4746,
  // );
  @override
  Widget build(BuildContext context) {
    final currentPosition =
        context.watch<GetPermissionLocation>().currentPosition;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text(
          'TRAFFIC TRACKING',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // if (currentPosition != null) {
          log('kamal');
          await googlecontroller.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(target: currentPosition ?? _center, zoom: 14.0),
            ),
          );
          // }
          // googlecontroller
          //     .animateCamera(CameraUpdate.newCameraPosition(_kGoogle));
        },
        child: const Icon(Icons.center_focus_strong),
      ),
      body: Stack(
        children: [
          currentPosition == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GoogleMap(
                  markers: {
                    Marker(
                        markerId: const MarkerId('1'),
                        position: currentPosition),
                  },
                  zoomControlsEnabled: false,
                  onMapCreated: (controller) {
                    googlecontroller = controller;
                  },
                  trafficEnabled: true,
                  myLocationButtonEnabled: true,
                  initialCameraPosition: CameraPosition(
                    zoom: 12,
                    target: currentPosition ?? _center,
                  ),
                ),
          Positioned(
            top: 20,
            right: 10,
            child: SizedBox(
              width: screenwidth(context) * 0.58,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red,
                    ),
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: 30,
                    child: const Center(
                      child: Text(
                        'Heavy',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green,
                    ),
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: 30,
                    child: const Center(
                        child: Text(
                      'Normal',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.yellow,
                    ),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 30,
                    child: const Center(child: Text('Moderate')),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
