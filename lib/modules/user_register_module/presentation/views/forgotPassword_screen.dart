import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/baseViewModel.dart';
import '../../../../core/style/general_styles.dart';
import '../../../../core/widgets/buttons/myButton_card.dart';
import '../../../../core/widgets/fields/myTextField_card.dart';
import '../../constants/URM_AppTexts.dart';
import '../view_models/forgotPasswordViewModel.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GeneralStyle.themeMasterBackgroundColor,
      appBar: AppBar(
        title: const Text(URM_AppTexts.forgotPassPageTitle),
        centerTitle: true,
        backgroundColor: GeneralStyle.themeMainColor,
        foregroundColor: Colors.white,
      ),
      body: Consumer<ForgotPasswordViewModel>(
        builder: (context, forgotPasswordViewModel, child) {
          BaseViewsMethods.showViewModelsMessage(forgotPasswordViewModel, context);
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.password,
                        color: GeneralStyle.themeMainColor,
                        size: 100,
                      ),
                      SizedBox(height: 10),
                      Text(
                        URM_AppTexts.forgotPassTitle,
                        textAlign: TextAlign.center,
                        style: GeneralStyle.headingTextStyle,
                      ),
                      SizedBox(height: 10),
                      Text(
                        URM_AppTexts.forgotPassDescription,
                        textAlign: TextAlign.center,
                        style: GeneralStyle.descriptionTextStyle,
                      ),
                    ],
                  ),
                ),
                MyTextFieldCard(
                  icon: Icons.email,
                  text: URM_AppTexts.fields_email,
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                  isObrigatory: true,
                ),
                const SizedBox(height: 30),
                MyButtonCard(
                  onPressedAction: () async{
                    bool status = await forgotPasswordViewModel.passwordReset(
                      emailController,
                    );
                    if(status){
                      Navigator.pop(context);
                    }
                  },
                  icon: Icons.send,
                  title: URM_AppTexts.forgotPass_FPscreen_button_send,
                ),

              ]
          );
        }
      ),
    );
  }
}

