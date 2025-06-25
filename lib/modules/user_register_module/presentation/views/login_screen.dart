import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/baseViewModel.dart';
import '../../../../core/style/general_styles.dart';
import '../../../../core/widgets/buttons/myButton_card.dart';
import '../../../../core/widgets/fields/myTextField_card.dart';
import '../../constants/URM_AppTexts.dart';
import '../view_models/loginViewModel.dart';
import '../widgets/passwordTextField_card.dart';
import 'forgotPassword_screen.dart';
import 'signUp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GeneralStyle.themeMasterBackgroundColor,
      body: Consumer<LoginViewModel>(
        builder: (context, loginViewModel, child) {
          BaseViewsMethods.showViewModelsMessage(loginViewModel, context);
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 30, 15, 30),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: GeneralStyle.themeMainColor,
                          size: 100,
                        ),
                        SizedBox(height: 10),
                        Text(
                          URM_AppTexts.loginTitle,
                          textAlign: TextAlign.center,
                          style: GeneralStyle.headingTextStyle,
                        ),
                        SizedBox(height: 10),
                        Text(
                          URM_AppTexts.loginDescription,
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
                            color: GeneralStyle.themeLayer0BackgroundColor
                                .withOpacity(0.5),
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
                              text: URM_AppTexts.login_LIscreen_fields_password,
                              controller: passwordController,
                              isObrigatory: true,
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                MyButtonCard(
                                  onPressedAction: () =>
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const ForgotPasswordScreen(),
                                        ),
                                      ),
                                  icon: Icons.password,
                                  iconColor: GeneralStyle.themeMainColor,
                                  title: URM_AppTexts.login_LIscreen_button_forgotPass,
                                  textStyle: GeneralStyle.smallDescriptionTextStyle,
                                  backgroundColor: GeneralStyle.themeLayer01BackgroundColor!,
                                  mainContentAlignment: MainAxisAlignment.start,
                                  maxSize: const Size(300, 40),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: ElevatedButton(
                        onPressed: () => loginViewModel.loginGoogle(context: context),
                        style: ElevatedButton.styleFrom(
                          maximumSize: const Size(350, 40),
                          backgroundColor: GeneralStyle.themeLayer02BackgroundColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              child: Image.asset(
                                'lib/modules/user_register_module/assets/images/googleLogo.png',
                                width: 35,
                                height: 35,
                              ),
                            ),
                            const Text(
                              URM_AppTexts.login_LIscreen_button_loginWGoogle,
                              style: GeneralStyle.mediumNormalTextStyle,
                            )
                          ],
                        )
                    ),
                  ),
                  MyButtonCard(
                    onPressedAction: () {
                      loginViewModel.loginDefault(
                        context: context,
                        emailCon: emailController,
                        passwordCon: passwordController,
                      );
                    },
                    icon: Icons.navigate_next,
                    title: URM_AppTexts.login_LIscreen_button_continue,
                    maxSize: const Size(350, 40),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: MyButtonCard(
                      onPressedAction: () =>
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ),
                          ),
                      icon: Icons.person_off,
                      iconColor: GeneralStyle.themeMainColor,
                      title: URM_AppTexts.login_LIscreen_button_noAccount,
                      textStyle: GeneralStyle.smallDescriptionTextStyle,
                      backgroundColor: GeneralStyle.themeMasterBackgroundColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      )
    );
  }
}
