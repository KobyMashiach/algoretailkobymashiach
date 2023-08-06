import 'package:algoretailkobymashiach/widgets/appToasts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TextButton(
            onPressed: () {
              appToast("sdsd");
            },
            child: Text("sdsd")),
      ),
    );
  }
}
