import 'package:algoretailkobymashiach/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 75, 75, 75)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
