import 'package:flutter/material.dart';

import '../../style/general_styles.dart';

class DrawerCard extends StatefulWidget {

  // Variáveis que são passadas como parâmetro para o widget
  IconData icon;
  String title;
  String description;
  Widget content;
  bool isInitialVisible;

  // Contrutor do widget
  DrawerCard({
    this.icon = Icons.info,
    this.title = ':)',
    required this.content,
    this.description = '',
    this.isInitialVisible = false,
    super.key
  });

  @override
  State<DrawerCard> createState() => _DrawerCardState();
}

class _DrawerCardState extends State<DrawerCard> with SingleTickerProviderStateMixin{

  late AnimationController _iconAnimcontroller;
  bool contentIsVisible = false;
  AnimatedIconData animIcon = AnimatedIcons.menu_close;

  // Função executada apenas uma vez antes do build()
  @override
  void initState() {
    contentIsVisible =  widget.isInitialVisible;
    animIcon = contentIsVisible ? AnimatedIcons.close_menu : AnimatedIcons.menu_close;
    _iconAnimcontroller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  // Recursos de interface
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: GeneralStyle.themeLayer02BackgroundColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: GeneralStyle.themeLayer0BackgroundColor.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 3,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    contentIsVisible = !contentIsVisible;
                    if(contentIsVisible){
                      if(widget.isInitialVisible){
                        _iconAnimcontroller.reverse();
                      }
                      else{
                        _iconAnimcontroller.forward();
                      }
                    }
                    else{
                      if(widget.isInitialVisible){
                        _iconAnimcontroller.forward();
                      }
                      else{
                        _iconAnimcontroller.reverse();
                      }
                    }
                  });
                },
                child: Row(
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
                                const SizedBox(height: 5),
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
                    AnimatedIcon(
                      icon: animIcon,
                      color: GeneralStyle.themeMainColor,
                      progress: _iconAnimcontroller,
                      size: 40,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: contentIsVisible,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Divider(),
                    ),
                    widget.content,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
