import 'package:flutter/material.dart';

import '../../style/general_styles.dart';

// Armazena os dados utilizados no BoxCard.
class BoxData{
  String imageURL;
  String title;
  String description;

  int? price;
  int? originalPrice;

  Widget destinyPage;

  // Construtor da classe
  BoxData({
    required this.imageURL,
    required this.title,
    required this.description,
    required this.destinyPage,

    this.price,
    this.originalPrice,
  });
}

class BoxCard extends StatefulWidget {
  final BoxData data;

  const BoxCard({required this.data, super.key});

  @override
  State<BoxCard> createState() => _BoxCardState();
}

class _BoxCardState extends State<BoxCard> {


  bool _isTapped = false;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: InkWell(
        onTap: () async {
          setState(() {_isTapped = true;});
          await Future.delayed(const Duration(milliseconds: 500));
          setState(() {_isTapped = false;});
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget.data.destinyPage,
            ),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: GeneralStyle.themeLayer03BackgroundColor,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: _isTapped
                    ? GeneralStyle.themeInversedBackgroundColor.withOpacity(0.5)
                    : GeneralStyle.themeLayer0BackgroundColor.withOpacity(0.5),
                spreadRadius: _isTapped ? 4 : 2,
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Hero(
                  tag: 'hero-${widget.data.title}-0',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      widget.data.imageURL,
                      width: 90,
                      height: 90,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.title,
                        style: GeneralStyle.smallHeadingTextStyle,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.data.description,
                        style: GeneralStyle.smallDescriptionTextStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                if(widget.data.price != null)
                  Column(
                    children: [
                      if(widget.data.originalPrice != null)
                        Text(
                          'R\$ ${(widget.data.originalPrice! / 100).toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: GeneralStyle.themeLayer0BackgroundColor,
                            fontSize: 18,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Text(
                        'R\$ ${(widget.data.price! / 100).toStringAsFixed(2)}',
                        style: GeneralStyle.smallHeadingTextStyle,
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
