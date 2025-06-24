import 'package:flutter/material.dart';

import '../../style/general_styles.dart';

class ImageInfoCard extends StatelessWidget {

  // Parâmetros a serem passados para o widget.
  final dynamic content;
  final int index;

  // Construtor do widget.
  const ImageInfoCard({required this.content, required this.index, super.key});

  // Recursos de interface
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag:'hero-${content.title}-$index',
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              image: DecorationImage(
                image: NetworkImage(content.imageURL),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.grey[700]?.withOpacity(0.8),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(50.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          content.title,
                          style: GeneralStyle.buttonHeadingTextStyle,
                        ),
                      ),
                      const SizedBox(width: 10),
                      if(content.hasPrice)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if(content.isPromotionalPrice)
                              Text(
                                'R\$ ${(content.originalPrice! / 100).toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: GeneralStyle.themeLayer01BackgroundColor,
                                  fontSize: 16,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            Text(
                              'R\$ ${(content.price! / 100).toStringAsFixed(2)}',
                              style: GeneralStyle.buttonHeadingTextStyle,
                            ),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    content.description,
                    style: GeneralStyle.lightSmallDescriptionTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
