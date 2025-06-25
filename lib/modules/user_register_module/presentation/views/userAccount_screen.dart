import 'package:flutter/material.dart';
import 'package:poo_project/modules/user_register_module/presentation/view_models/userAccountViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../core/CORE_AppTexts.dart';
import '../../../../core/baseViewModel.dart';
import '../../../../core/style/general_styles.dart';
import '../../../../core/widgets/buttons/myButton_card.dart';
import '../../../../core/widgets/dialogs/action_dialog.dart';
import '../../../../core/widgets/sections/myDivider_card.dart';
import '../../../../core/widgets/sections/section_card.dart';
import '../../constants/URM_AppTexts.dart';


class UserAccountScreen extends StatefulWidget {
  Widget? customContent;
  UserAccountScreen({this.customContent, super.key});

  @override
  State<UserAccountScreen> createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GeneralStyle.themeMasterBackgroundColor,
      appBar: AppBar(
        backgroundColor:  GeneralStyle.themeMasterBackgroundColor,
        foregroundColor: GeneralStyle.themeInversedBackgroundColor ,
      ),
      body: SingleChildScrollView(
        child: Consumer<UserAccountViewModel>(
          builder: (context, userAccountViewModel, child) {
            BaseViewsMethods.showViewModelsMessage(userAccountViewModel, context);
            return Padding(
              padding: const EdgeInsets.all(7.5),
              child: Column(
                children: [
                  const Icon(
                    Icons.account_circle,
                    color: GeneralStyle.themeMainColor,
                    size: 100,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    URM_AppTexts.accountTitle,
                    style: GeneralStyle.headingTextStyle,
                  ),
                  Text(
                    userAccountViewModel.loadUserData(context).email,
                    style: GeneralStyle.descriptionTextStyle,
                  ),
                  if(widget.customContent != null)
                    Column(
                      children: [
                        MyDividerCard(),
                        SectionCard(
                          icon: Icons.person,
                          title: URM_AppTexts.account_UAscreen_section_actTitle,
                        ),
                        const SizedBox(height: 10),
                        widget.customContent!,
                      ],
                    ),
                  MyDividerCard(),
                  MyButtonCard(
                    onPressedAction: () async {
                      await userAccountViewModel.logout();
                      Navigator.pop(context);
                    },
                    icon: Icons.logout,
                    title: URM_AppTexts.account_UAscreen_button_logout,
                  ),
                  const SizedBox(height: 7.5),
                  MyButtonCard(
                    onPressedAction: () async {
                      showActionDialog(
                        ActionDialogContent(
                          title: URM_AppTexts.deleteAccount_DAdialog_title,
                          description: URM_AppTexts.deleteAccount_DAdialog_message,
                          cancelButton: CORE_AppTexts.cancelTitle,
                          actionButton: CORE_AppTexts.deleteTitle,
                          actionButtonIcon: Icons.delete_forever,
                          actionFunc: () async {
                            bool status = await userAccountViewModel.destroyAccount();
                            if(status) Navigator.of(context).pop();
                          },
                        ),
                        context,
                      );
                    },
                    icon: Icons.delete_forever,
                    title: URM_AppTexts.account_UAscreen_button_deleteAccount,
                    backgroundColor: Colors.red,
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
