import 'package:flutter/material.dart';

import '../../style/general_styles.dart';
import '../info/detailFeature_card.dart';

class ParameterProductCard extends StatelessWidget {

  // Variáveis a serem passadas para o widget
  final String question;
  final List<String> answers;

  // Construtor do widget
  const ParameterProductCard({
    required this.question,
    required this.answers,
    super.key
  });

  // Recursos de interface
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.question_mark,
                  color: GeneralStyle.themeMainColor,
                  size: 30,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    question,
                    style: GeneralStyle.smallHeadingTextStyle,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: answers.length,
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      const SizedBox(height: 7.5),
                      DetailFeatureCard(
                        icon: Icons.person,
                        content: answers[index],
                        backgroundColor: GeneralStyle.themeMainColor.withOpacity(0.25),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
