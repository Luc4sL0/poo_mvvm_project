import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:poo_project/modules/user_register_module/models/user_model.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

import 'modules/user_register_module/presentation/view_models/SignUpViewModel.dart';
import 'modules/user_register_module/presentation/view_models/forgotPasswordViewModel.dart';
import 'modules/user_register_module/presentation/view_models/loginViewModel.dart';
import 'modules/user_register_module/presentation/views/auth_gate.dart';

// Inicialização do aplicativo.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => SignUpViewModel()),
        ChangeNotifierProvider(create: (_) => ForgotPasswordViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthGate(),
      ),
    ),
  );
}




