import '../../style/general_styles.dart';
import 'package:flutter/material.dart';

// Organiza o conteúdo de um detalhe
class DetailsData{
  IconData detailIcon;
  String detailContent;

  DetailsData({
    this.detailIcon = Icons.info,
    required this.detailContent,
  });
}

class DetailFeatureCard extends StatelessWidget {

  // Variáveis que são passadas como parâmetro para o widget
  final IconData icon;
  final String content;
  final Color backgroundColor;

  // Construtor do widget
  const DetailFeatureCard({
    required this.icon,
    required this.content,
    required this.backgroundColor,
    super.key
  });

  // Recursos de interface
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          const SizedBox(width: 15),
          Icon(
            icon,
            color: GeneralStyle.themeMainColor,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              content,
              style: GeneralStyle.descriptionTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
