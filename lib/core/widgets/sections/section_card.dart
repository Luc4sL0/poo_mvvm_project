import 'package:flutter/material.dart';

import '../../style/general_styles.dart';

class SectionCard extends StatelessWidget {

  // Parâmetros a serem passados para o widget.
  IconData icon;
  String title;
  Color mainColor;

  // Construtor do widget.
  SectionCard({
    this.icon = Icons.info,
    this.title = ':)',
    this.mainColor = GeneralStyle.themeMainColor,
    super.key
  });

  // Recursos de interface
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: mainColor,
              size: 30,
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: GeneralStyle.smallHeadingTextStyle,
            ),
          ],
        ),
        Icon(
          Icons.keyboard_arrow_down_rounded,
          color: mainColor,
          size: 30,
        ),
      ],
    );
  }
}
