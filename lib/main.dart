import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trengoapp/screens/home_screen.dart';
import 'package:trengoapp/screens/login_screen.dart';
import 'package:trengoapp/screens/new_conversation_screen.dart';

void main() async {
  runApp(const MyApp());
}

class Routes {
  static const String homeScreen = "/home_screen";

  static const String  newConversationScreen = "/new_conversation_screen";



}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Trengo App',
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: Routes.homeScreen, page: () => const LoginScreen()),
        GetPage(name: Routes.newConversationScreen, page: () => const NewConversationScreen()),

      ],
      initialRoute: Routes.homeScreen, // Navigates directly to the home screen
    );
  }
}
