import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/constants/global_variables.dart';
import 'package:flutter/material.dart';

class SliderImages extends StatelessWidget {
  const SliderImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: GlobalVariables.carouselImages.map((e) {
          return Builder(
            builder: (BuildContext context) => Image.network(
              e,
              fit: BoxFit.cover,
              height: 200,
            ),
          );
        }).toList(),
        options: CarouselOptions(
          viewportFraction: 1,
          height: 200,
        ));
  }
}
