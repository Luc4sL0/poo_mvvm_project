import 'package:flutter/material.dart';
import '../../style/general_styles.dart';

// Organiza as propriedades de um dropdown.
class DropdownSystem{
  String? currentValue;
  List<String> options;
  DropdownSystem({required this.options, this.currentValue});
}

class MyDropdownFieldCard extends StatefulWidget {

  // Parâmetros a serem passados para o widget.
  IconData icon;
  String title;
  DropdownSystem system;
  Function? parentFunc;

  // Construtor do widget.
  MyDropdownFieldCard({
    this.icon = Icons.info,
    required this.title,
    required this.system,
    this.parentFunc,
    super.key
  });

  @override
  State<MyDropdownFieldCard> createState() => _MyDropdownFieldCardState();
}

class _MyDropdownFieldCardState extends State<MyDropdownFieldCard> {

  // Recursos de interface
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Icon(
              widget.icon,
              color: GeneralStyle.themeMainColor,
              size: 30,
            ),
            const SizedBox(width: 10),
            Text(
              widget.title,
              style: GeneralStyle.smallHeadingTextStyle,
            ),
          ],
        ),
        DropdownButton<String>(
          value: widget.system.currentValue,
          onChanged: (String? newVal){
            setState(() {
              widget.system.currentValue = newVal;
              if(widget.parentFunc != null){
                widget.parentFunc!();
              }
            });
          },
          items: widget.system.options.map((String item){
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      ],
    );
  }
}
