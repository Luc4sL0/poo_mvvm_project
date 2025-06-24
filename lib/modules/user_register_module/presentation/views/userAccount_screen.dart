import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/baseViewModel.dart';
import '../../../../core/style/general_styles.dart';
import '../../../../core/widgets/buttons/drawerButton_card.dart';
import '../../../../core/widgets/buttons/myButton_card.dart';
import '../../../../core/widgets/sections/myDivider_card.dart';
import '../../../../core/widgets/sections/section_card.dart';
import '../../constants/URM_AppTexts.dart';
import '../view_models/forgotPasswordViewModel.dart';


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
        child: Consumer<ForgotPasswordViewModel>(
          builder: (context, forgotPassViewModel, child) {
            BaseViewsMethods.showViewModelsMessage(forgotPassViewModel, context);
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
                    forgotPassViewModel.authService.auth.currentUser!.email!,
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
                  SectionCard(
                    icon: Icons.lock,
                    title: URM_AppTexts.account_UAscreen_section_securityTitle,
                  ),
                  const SizedBox(height: 10),
                  DrawerButtonCard(
                    onPressed: () => forgotPassViewModel.passwordReset(
                      forgotPassViewModel.authService.auth.currentUser!.email!,
                    ),
                    icon: Icons.password,
                    title: URM_AppTexts.account_UAscreen_drawer_changePassTitle,
                    description: URM_AppTexts.account_UAscreen_drawer_changePassDescription,
                  ),
                  MyDividerCard(),
                  MyButtonCard(
                    onPressedAction: () async {
                      await forgotPassViewModel.authService.signOut();
                      Navigator.pop(context);
                    },
                    icon: Icons.logout,
                    title: URM_AppTexts.account_UAscreen_button_logout,
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
