import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../style/general_styles.dart';
import 'myDivider_card.dart';
import 'section_card.dart';

class ImagesSection extends StatelessWidget {

  // Parâmetros a serem passados para o widget.
  final String title;
  final List<String> imagesURL;

  // Construtor do widget.
  const ImagesSection({required this.title, required this.imagesURL, super.key});

  // Recursos de interface
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyDividerCard(color: GeneralStyle.themeLayer04BackgroundColor),
        SectionCard(
          icon: Icons.image,
          title: title,
        ),
        const SizedBox(height: 15),
        CarouselSlider(
          options: CarouselOptions(
            height: 300.0,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlayInterval: const Duration(seconds: 3),
          ),
          items: imagesURL.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
