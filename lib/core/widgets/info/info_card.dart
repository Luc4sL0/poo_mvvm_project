import 'package:flutter/material.dart';

import '../../style/general_styles.dart';

class InfoCard extends StatelessWidget {

  // Variáveis que são passadas como parâmetro para o widget
  IconData icon;
  String title;
  String description;
  IconData? actionButtonIcon;
  Color? actionButtonIconColor;
  Color? actionButtonColor;
  Function? action;

  // Construtor do widget
  InfoCard({
    this.icon = Icons.info,
    required this.title,
    required this.description,
    this.actionButtonIcon,
    this.actionButtonIconColor,
    this.actionButtonColor,
    this.action,
    super.key
  });

  /* Verifica se o widget precisa de um botão
  *
  * Descrição: Essa função possui a finalidade de verificar a necessidade
  * de colocar um botão no widget. Se for necessário, um botão é inserido e
  * configurado.
  */
  Widget _actionButtonManager(){
    if(action != null){
      return IconButton(
        onPressed: () => action!,
        icon: Icon(actionButtonIcon!, color: actionButtonIconColor!),
        style: IconButton.styleFrom(
          backgroundColor: actionButtonColor!,
        ),
      );
    }
    else{
      return const SizedBox();
    }
  }

  // Recursos de interface
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 7.5, 0, 7.5),
      child: Container(
        decoration: BoxDecoration(
          color: GeneralStyle.themeLayer03BackgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                color: GeneralStyle.themeMainColor,
                size: 30,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GeneralStyle.smallHeadingTextStyle,
                    ),
                    Text(
                      description,
                      style: GeneralStyle.descriptionTextStyle,
                    ),
                  ],
                ),
              ),
              _actionButtonManager(),
            ],
          ),
        ),
      ),
    );
  }
}