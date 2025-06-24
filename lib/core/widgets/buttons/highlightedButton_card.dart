import 'package:flutter/material.dart';
import '../../style/general_styles.dart';

class HighlightedButtonCard extends StatelessWidget {

  IconData icon;
  String title;
  Widget destinyScreen;

  // Construtor do widget
  HighlightedButtonCard({
    this.icon = Icons.info,
    required this.title,
    required this.destinyScreen,
    super.key
  });

  // Recursos de inteface
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => destinyScreen));
        },
        child: Container(
          decoration: BoxDecoration(
            color: GeneralStyle.themeMainColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(width: 15),
                    Text(
                      title,
                      style: GeneralStyle.buttonHeadingTextStyle,
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}