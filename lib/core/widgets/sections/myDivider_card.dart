import 'package:flutter/material.dart';

import '../../style/general_styles.dart';

class MyDividerCard extends StatelessWidget {

  double padding;
  Color? color;
  MyDividerCard({
    this.padding = 15,
    this.color,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Divider(
        thickness: 3,
        color: color ?? GeneralStyle.themeLayer03BackgroundColor,
      ),
    );
  }
}
