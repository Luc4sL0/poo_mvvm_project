import 'package:flutter/material.dart';
import '../../style/general_styles.dart';

class MyCheckboxTileCard extends StatefulWidget {

  // Variáveis que são passadas como parâmetro para o widget
  final Map<String, bool> properties;
  final String propertieID;
  final IconData icon;
  final String text;
  final String description;
  final VoidCallback? function;

  // Construtor do widget
  const MyCheckboxTileCard({
    required this.properties,
    required this.propertieID,
    this.icon = Icons.info,
    required this.text,
    this.description = '',
    this.function,
    super.key
  });

  @override
  State<MyCheckboxTileCard> createState() => _MyCheckboxTileCardState();
}

class _MyCheckboxTileCardState extends State<MyCheckboxTileCard> {

  // Recursos de interface
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      fillColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return GeneralStyle.themeMainColor;
          }
          return GeneralStyle.themeLayer02BackgroundColor;
        },
      ),
      title: Row(
        children: [
          Icon(
            widget.icon,
            color: GeneralStyle.themeMainColor,
          ),
          const SizedBox(width: 10),
          Text(
            widget.text,
            style: GeneralStyle.smallHeadingTextStyle,
          ),
        ],
      ),
      subtitle: Text(
        widget.description,
        style: GeneralStyle.descriptionTextStyle,
      ),
      value: widget.properties[widget.propertieID] ?? false,
      onChanged: (bool? newValue) {
        setState(() {
          widget.properties[widget.propertieID] = newValue ?? false;
        });
        if(widget.function != null){
          widget.function!();
        }
      },
    );
  }
}
