import 'package:flutter/material.dart';

import '../../style/general_styles.dart';

class MyButtonCard extends StatefulWidget {

  // Parâmetros que o widget pode receber
  Function onPressedAction;
  IconData icon;
  Color iconColor;
  String title;
  TextStyle textStyle;
  bool isObrigatory;
  bool isLoading;
  Color backgroundColor;
  Size maxSize;
  MainAxisAlignment mainContentAlignment;

  // Construtor do widget
  MyButtonCard({
    required this.onPressedAction,
    this.icon = Icons.info,
    this.iconColor = Colors.white,
    this.title = ':)',
    this.textStyle = GeneralStyle.buttonHeadingTextStyle,
    this.isObrigatory = false,
    this.isLoading = false,
    this.backgroundColor = GeneralStyle.themeMainColor,
    this.maxSize = const Size(375, 50),
    this.mainContentAlignment = MainAxisAlignment.center,
    super.key
  });

  @override
  State<MyButtonCard> createState() => _MyButtonCardState();
}

class _MyButtonCardState extends State<MyButtonCard> {
  Widget getContent(){
    if(!widget.isLoading){
      return Row(
        mainAxisAlignment: widget.mainContentAlignment,
        children: [
          Icon(
            widget.icon,
            color: widget.iconColor,
            size: 30,
          ),
          const SizedBox(width: 10),
          Text(
            widget.title,
            style: widget.textStyle,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: Visibility(
              visible: widget.isObrigatory,
              child: const Text(
                '*',
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.red, fontSize: 18.0),
              ),
            ),
          ),
        ],
      );
    }
    else{
      return const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation<Color>(GeneralStyle.themeMasterBackgroundColor),
          ),
        ],
      );
    }
  }

  // Recursos de interface
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.isLoading ? null : () {widget.onPressedAction();},
        style: TextButton.styleFrom(
          backgroundColor: widget.backgroundColor,
          maximumSize: widget.maxSize,
        ),
        child: getContent(),
    );
  }
}
