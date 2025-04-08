import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raabta/controller/slider_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget buildImage(String images, int index, String data) => Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text(error.toString()),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  } else {
                    return child;
                  }
                },
                image: NetworkImage(images),
              ),
              // Image.memory(
              //   images,

              // ),
            ),
          ),
        ),
        Text(data),
      ],
    );
Widget buildindicator(List values) => Consumer<SliderController>(
      builder: (context, sliderController, child) {
        print('Active Index: ${sliderController.activeIndex}');
        print('Values Length: ${values.length}');
        return AnimatedSmoothIndicator(
          activeIndex: sliderController.activeIndex,
          count: values.isNotEmpty ? values.length : 1,
          effect: JumpingDotEffect(
            dotWidth: 24,
            dotColor: Colors.grey.shade200,
            activeDotColor: Theme.of(context).colorScheme.primary,
            dotHeight: 4,
          ),
        );
      },
    );
