import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:raabta/model/traffic_model.dart';
import 'package:raabta/utils/media_query.dart';

class ImageEducation extends StatelessWidget {
  const ImageEducation({
    super.key,
    required this.trafficModel,
    required this.image,
  });

  final TrafficModel trafficModel;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: CachedNetworkImage(
                  height: screenheight(context) * 0.5,
                  width: screenwidth(context) * 0.85,
                  imageUrl: image,
                  placeholder: (context, url) {
                    return Center(
                        child: Container(
                      color: Colors.white,
                    ));
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.fill),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  trafficModel.imageTitle,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        trafficModel.trafficEducationId,
                        style: const TextStyle(color: Colors.white),
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                        trafficModel.imageDescriptionEng.replaceAll('\n', '')),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        trafficModel.imageDescriptionUrdu.trim(),
                        textAlign: TextAlign.end,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
