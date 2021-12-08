import 'package:flutter/material.dart';
import 'package:restaurante/models/categ.dart';
import 'package:restaurante/screens/login_screen.dart';
import 'package:restaurante/views/home.dart';
import 'package:restaurante/views/categhome.dart';
import 'screens/chat_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        HomePage.id: (context) => HomePage(),
        CategHomePage.id: (context) => CategHomePage(),
      },
    );
  }
}
