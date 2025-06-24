import 'package:flutter/material.dart';

import '../../style/general_styles.dart';

// Organiza o conteúdo de uma janela de ação.
class ActionDialogContent {
  String title;
  String description;
  String cancelButton;
  String actionButton;
  IconData actionButtonIcon;

  Function? cancelFunc;
  Function actionFunc;

  ActionDialogContent({
    required this.title,
    required this.description,
    required this.cancelButton,
    required this.actionButton,
    this.actionButtonIcon = Icons.info,
    this.cancelFunc,
    required this.actionFunc,
  });
}

// Abre uma janela de ação personalizada.
void showActionDialog(ActionDialogContent content, context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: GeneralStyle.themeMasterBackgroundColor,
        title: Text(content.title),
        content: Text(content.description),
        actions: [
          TextButton(
            onPressed: () {
              if(content.cancelFunc != null){
                content.cancelFunc!();
              }
              Navigator.of(context).pop();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.cancel_outlined,
                  color: GeneralStyle.themeInversedBackgroundColor,
                ),
                const SizedBox(width: 10),
                Text(
                  content.cancelButton,
                  style: GeneralStyle.smallHeadingTextStyle,
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              content.actionFunc();
              Navigator.of(context).pop();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  content.actionButtonIcon,
                  color: GeneralStyle.themeInversedBackgroundColor,
                ),
                const SizedBox(width: 10),
                Text(
                  content.actionButton,
                  style: GeneralStyle.smallHeadingTextStyle,
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
