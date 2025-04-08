import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:raabta/model/traffic_model.dart';
import 'package:raabta/screens/traffic_education/image_education.dart';
import 'package:raabta/utils/media_query.dart';

class TrafficEducation extends StatefulWidget {
  const TrafficEducation({Key? key}) : super(key: key);

  @override
  State<TrafficEducation> createState() => _TrafficEducationState();
}

class _TrafficEducationState extends State<TrafficEducation> {
  List<TrafficModel>? trafficDataList;
  String baseUrl =
      'https://raabta.ptpkp.gov.pk/dashboard/uploads/traffic-education/';
  List<String>? imageUrls;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(
            'http://raabta.ptpkp.gov.pk/dashboard/traffic_education/getEducationSigns'),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body.toString());
        Traffic traffic = Traffic.fromJson(map);
        imageUrls = traffic.traffic!
            .map((trafficData) => baseUrl + trafficData.image)
            .toList();
        setState(() {
          trafficDataList = traffic.traffic!;
          log(trafficDataList!.first.imageTitle.toString());
          log(trafficDataList!.length.toString());
          log(imageUrls.toString());
        });
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text('Traffic Education'),
      ),
      body: imageUrls != null
          ? ListView.builder(
              itemCount: trafficDataList!.length,
              itemBuilder: (context, index) {
                print('1');
                final trafficData = trafficDataList![index];

                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    color: Colors.green.shade50,
                    elevation: 0,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageEducation(
                                trafficModel: trafficData,
                                image: imageUrls![index]),
                          ),
                        );
                      },
                      leading: CircleAvatar(
                        radius: 35.0,
                        backgroundColor: Colors.grey.shade100,

                        // ignore: sort_child_properties_last
                        child: Container(
                          height: screenheight(context),
                          width: screenwidth(context),
                          // margin: EdgeInsets.all(5),
                          // padding: EdgeInsets.all(5),
                          clipBehavior: Clip.antiAlias,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            cacheKey: imageUrls![index],
                            imageUrl: imageUrls![index],
                            placeholder: (context, url) => Container(
                              color: Colors.grey[200],
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(trafficData.imageTitle),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
