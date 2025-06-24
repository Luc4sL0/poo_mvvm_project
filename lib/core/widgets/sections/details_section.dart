import 'package:flutter/material.dart';

import '../../style/general_styles.dart';
import 'myDivider_card.dart';
import 'section_card.dart';
import '../info/detailFeature_card.dart';

class DetailsSection extends StatelessWidget {

  // Parâmetros a serem passados para o widget.
  IconData icon;
  String title;
  List<DetailsData> details;

  // Construtor do widget.
  DetailsSection({
    this.icon = Icons.star,
    required this.title,
    required this.details,
    super.key
  });

  // Recursos de interface
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyDividerCard(color: GeneralStyle.themeLayer04BackgroundColor),
        SectionCard(
          icon: icon,
          title: title,
        ),
        const SizedBox(height: 15),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: details.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(5),
              child: DetailFeatureCard(
                icon: details.elementAt(index).detailIcon,
                content: details.elementAt(index).detailContent,
                backgroundColor: GeneralStyle.themeLayer02BackgroundColor!,
              ),
            );
          },
        ),
      ],
    );
  }
}
