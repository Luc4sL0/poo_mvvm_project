import 'package:flutter/material.dart';
import '../style/general_styles.dart';

class ProcessLoadingCard extends StatefulWidget {
  const ProcessLoadingCard({super.key});

  @override
  State<ProcessLoadingCard> createState() => _ProcessLoadingCardState();
}

class _ProcessLoadingCardState extends State<ProcessLoadingCard> {

  // Recursos de interface
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(GeneralStyle.themeMainColor),
        ),
      ),
    );
  }
}
