import 'package:flutter/material.dart';

import '../../style/general_styles.dart';

class MyTextFieldCard extends StatefulWidget {

  // Variáveis que são passadas como parâmetro para o widget
  final IconData icon;
  final String text;
  final TextEditingController controller;
  final TextInputType? inputType;
  final bool isObrigatory;
  final Function? onChange;

  // Contrutor do widget
  const MyTextFieldCard({
    required this.icon,
    required this.text,
    required this.controller,
    required this.inputType,
    this.isObrigatory = false,
    this.onChange,
    super.key
  });

  @override
  State<MyTextFieldCard> createState() => _MyTextFieldCardState();
}

class _MyTextFieldCardState extends State<MyTextFieldCard> {

  // Recursos de interface
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        keyboardType: widget.inputType,
        controller: widget.controller,
        onChanged: (String? newText) {
          if(widget.onChange != null){
            widget.onChange!();
          }
        },
        decoration: InputDecoration(
          floatingLabelStyle: const TextStyle(
            color: GeneralStyle.themeMainColor,
          ),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.text),
              const SizedBox(width: 5),
              Visibility(
                visible: widget.isObrigatory,
                child: const Text(
                  '*',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.red, fontSize: 18.0),
                ),
              ),
            ],
          ),
          prefixIcon: Icon(
            widget.icon,
            color: GeneralStyle.themeMainColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: GeneralStyle.themeInversedBackgroundColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: GeneralStyle.themeMainColor,
              width: 2.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(
              color: GeneralStyle.themeLayer0BackgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}