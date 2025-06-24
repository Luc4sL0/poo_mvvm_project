import 'package:flutter/material.dart';

import '../../style/general_styles.dart';

class DrawerButtonCard extends StatefulWidget {

  // Variáveis que são passadas como parâmetro para o widget
  Function onPressed;
  IconData icon;
  String title;
  String description;

  // Contrutor do widget
  DrawerButtonCard({
    required this.onPressed,
    this.icon = Icons.info,
    this.title = ':)',
    this.description = '',
    super.key
  });

  @override
  State<DrawerButtonCard> createState() => _DrawerButtonCardState();
}

class _DrawerButtonCardState extends State<DrawerButtonCard> {

  bool _isTapped = false;
  
  // Recursos de interface
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.5),
      child: InkWell(
        onTap: () async{
          setState(() {_isTapped = true;});
          await Future.delayed(const Duration(milliseconds: 500));
          setState(() {_isTapped = false;});
          widget.onPressed();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: GeneralStyle.themeLayer02BackgroundColor,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: _isTapped
                    ? GeneralStyle.themeLayer0BackgroundColor.withOpacity(0.75)
                    : GeneralStyle.themeLayer0BackgroundColor.withOpacity(0.5),
                spreadRadius: _isTapped ? 4 : 2,
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            widget.icon,
                            color: GeneralStyle.themeMainColor,
                            size: 35,
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.title,
                                  style: GeneralStyle.smallHeadingTextStyle,
                                ),
                                Visibility(
                                  visible: widget.description != '',
                                  child: const SizedBox(height: 2.5),
                                ),
                                Visibility(
                                  visible: widget.description != '',
                                  child: Text(
                                    widget.description,
                                    style: GeneralStyle.smallDescriptionTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.arrow_circle_right,
                      color: GeneralStyle.themeMainColor,
                      size: 20,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
