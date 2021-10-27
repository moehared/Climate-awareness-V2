import 'package:app/ui/views/login-sign_up-views/user_registeration-login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'domain/services/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUpLocatorService();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF512da8),
        primaryColorDark: const Color(0xff140078),
        primaryColorLight: const Color(0xff8559da),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xffc2185b),
        ),
      ),
      // home: HomeView(),
      home: const UserRegisterationFormView(),
    );
  }
}
