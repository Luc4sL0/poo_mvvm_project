import 'package:flutter/material.dart';

import '../../style/general_styles.dart';



class FeatureCard extends StatelessWidget {

  // Variáveis que são passadas como parâmetro para o widget
  IconData icon;
  String title;
  TextStyle titleStyle;
  Color iconColor;
  Color boxColor;

  // Construtor do widget
  FeatureCard({
    this.icon = Icons.info,
    this.title = ':)',
    this.titleStyle = const TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
    this.iconColor = Colors.white,
    this.boxColor = GeneralStyle.themeSecondaryColor,
    super.key
  });

  // Recursos de interface
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 30,
            ),
            const SizedBox(width: 10),
            Text(
              title.length > 20
                  ? '${title.substring(0, 20)}...'
                  : title,
              style: titleStyle,
            ),
          ],
        ),
      ),
    );
  }
}
