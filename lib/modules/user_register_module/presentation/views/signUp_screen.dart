import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/baseViewModel.dart';
import '../../../../core/style/general_styles.dart';
import '../../../../core/widgets/buttons/myButton_card.dart';
import '../../../../core/widgets/fields/myTextField_card.dart';
import '../../../../core/widgets/processLoading_card.dart';
import '../../constants/URM_AppTexts.dart';
import '../view_models/SignUpViewModel.dart';
import '../widgets/passwordTextField_card.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GeneralStyle.themeMasterBackgroundColor,
      body: Consumer<SignUpViewModel>(
        builder: (context, signUpViewModel, child) {
          BaseViewsMethods.showViewModelsMessage(signUpViewModel, context);
          return signUpViewModel.isLoading ? const ProcessLoadingCard() : Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 30, 15, 30),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.supervisor_account_rounded,
                          color: GeneralStyle.themeMainColor,
                          size: 100,
                        ),
                        SizedBox(height: 10),
                        Text(
                          URM_AppTexts.signUpTitle,
                          textAlign: TextAlign.center,
                          style: GeneralStyle.headingTextStyle,
                        ),
                        SizedBox(height: 10),
                        Text(
                          URM_AppTexts.signUpDescription,
                          textAlign: TextAlign.center,
                          style: GeneralStyle.normalTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: GeneralStyle.themeLayer01BackgroundColor,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: GeneralStyle.themeLayer0BackgroundColor.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyTextFieldCard(
                              icon: Icons.email,
                              text: URM_AppTexts.fields_email,
                              controller: emailController,
                              inputType: TextInputType.emailAddress,
                              isObrigatory: true,
                            ),
                            PasswordTextFieldCard(
                              text: URM_AppTexts.signUp_SUscreen_fields_createPassword,
                              controller: passwordController,
                              isObrigatory: true,
                            ),
                            PasswordTextFieldCard(
                              text: URM_AppTexts.signUp_SUscreen_fields_confirmPassword,
                              controller: confirmPasswordController,
                              isObrigatory: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  MyButtonCard(
                    onPressedAction: () async{
                      bool status = await signUpViewModel.register(
                        context: context,
                        emailCon: emailController,
                        passCon: passwordController,
                        confirmPassCon: confirmPasswordController,
                      );
                      if(status){
                        Navigator.pop(context);
                      }
                    },
                    icon: Icons.add_circle_outline,
                    title: URM_AppTexts.signUp_SUscreen_button_create,
                    maxSize: const Size(350, 40),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: MyButtonCard(
                      onPressedAction: () =>
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          ),
                      icon: Icons.person,
                      iconColor: GeneralStyle.themeMainColor,
                      title: URM_AppTexts.signUp_SUscreen_button_hasAccount,
                      textStyle: GeneralStyle.smallDescriptionTextStyle,
                      backgroundColor: GeneralStyle.themeMasterBackgroundColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
