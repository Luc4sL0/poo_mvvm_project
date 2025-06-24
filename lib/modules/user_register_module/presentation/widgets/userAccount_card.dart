import 'package:flutter/material.dart';
import 'package:poo_project/modules/user_register_module/models/user_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/style/general_styles.dart';
import '../../constants/URM_AppTexts.dart';
import '../views/userAccount_screen.dart';

class UserAccountCard extends StatelessWidget {
  UserAccountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
        builder: (context, userModel, child) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: GeneralStyle.themeLayer02BackgroundColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'lib/modules/user_register_module/assets/images/hand_icon.png',
                      width: 60,
                      height: 60,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          URM_AppTexts.userAccountCardTitle,
                          style: GeneralStyle.smallHeadingTextStyle,
                        ),
                        Text(
                          userModel.email,
                          style: GeneralStyle.smallDescriptionTextStyle,
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () =>
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => UserAccountScreen(),
                          )),
                      icon: const Icon(
                        Icons.account_circle_rounded,
                        color: GeneralStyle.themeMainColor,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
