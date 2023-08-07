import 'package:algoretailkobymashiach/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// ---------------------------------------------------------------- explain on app ----------------------------------------------------------------
// -------------------------------------------------------------------------------------------------------------------------------------------------
// This is an create and display tasks application I wrote as part of a home assignment provided to me by Algoretail.
// The goal of this project is to design and build scalable and lightweight mobile application.
// Our primary focus is to see how you’d design application from an architectural point of view using modern Flutter approaches and design patterns.
// -------------------------------------------------------------------------------------------------------------------------------------------------
// ---------------------------------------------------------------- explain on app ----------------------------------------------------------------

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // text in all the application is rtl
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("he", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: const Locale(
          "he", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales,
      title: 'Algoretail Koby Mashiach',
      // remove debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 75, 75, 75)),
        useMaterial3: true,
      ),
      // start with Home Screen page
      home: const HomeScreen(),
    );
  }
}
