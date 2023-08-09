import 'package:algoretailkobymashiach/bloc/tasks_bloc.dart';
import 'package:algoretailkobymashiach/screens/home_screen.dart';
import 'package:algoretailkobymashiach/screens/home_screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/* ---------------------------------------------------------------- explain on app ----------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
This is an create and display tasks application I wrote as part of a home assignment provided to me by Algoretail.
The goal of this project is to design and build scalable and lightweight mobile application.
Our primary focus is to see how you’d design application from an architectural point of view using modern Flutter approaches and design patterns.
---------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------- explain on app ---------------------------------------------------------------- */

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return ErrorMessage(details: details);
  };
  runApp(const MyApp());
}

class ErrorMessage extends StatelessWidget {
  final FlutterErrorDetails details;
  const ErrorMessage({
    required this.details,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Error: ${details.exceptionAsString()}",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasksBloc()..add(LoadTasksEvent()),
        )
      ],
      child: MaterialApp(
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
        home: const HomeScreen2(),
      ),
    );
  }
}
