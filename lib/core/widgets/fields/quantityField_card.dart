import 'package:flutter/material.dart';

import '../../style/general_styles.dart';

class QuantityFieldCard extends StatefulWidget {

  // Parâmetros a serem passados para o widget.
  IconData icon;
  String title;
  int currentValue;
  int minValue;
  int? maxValue;
  Function lessAction;
  Function moreAction;

  // Construtor do widget.
  QuantityFieldCard({
    this.icon = Icons.expand_more,
    required this.title,
    this.currentValue = 0,
    this.minValue = 0,
    this.maxValue,
    required this.lessAction,
    required this.moreAction,
    super.key
  });

  @override
  State<QuantityFieldCard> createState() => _QuantityFieldCardState();
}

class _QuantityFieldCardState extends State<QuantityFieldCard> {

  late int newValue;

  @override
  void initState() {
    newValue = widget.currentValue;
    super.initState();
  }

  // Recursos de interface
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: GeneralStyle.themeMainColor,
                size: 30,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.title,
                  style: GeneralStyle.smallHeadingTextStyle,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            FloatingActionButton.small(
              heroTag: '${widget.title}-',
              onPressed: (){
                if(newValue > widget.minValue){
                  widget.lessAction();
                  setState(() {
                    newValue--;
                  });
                }
              },
              backgroundColor: GeneralStyle.themeSecondaryColor,
              foregroundColor: Colors.white,
              child: const Text(
                '-',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                newValue.toString(),
                style: GeneralStyle.smallHeadingTextStyle,
              ),
            ),
            FloatingActionButton.small(
              heroTag: '${widget.title}+',
              onPressed: () {
                if(widget.maxValue != null){
                  if(newValue < widget.maxValue!){
                    widget.moreAction();
                    setState(() {
                      newValue++;
                    });
                  }
                }
                else{
                  widget.moreAction();
                  setState(() {
                    newValue++;
                  });
                }
              },
              backgroundColor: GeneralStyle.themeSecondaryColor,
              foregroundColor: Colors.white,
              child: const Text(
                '+',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
