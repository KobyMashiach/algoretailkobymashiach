import 'package:algoretailkobymashiach/design/appbar.dart';
import 'package:algoretailkobymashiach/design/design_lines.dart';
import 'package:algoretailkobymashiach/widgets/appToasts.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DesignLines appDesign = DesignLines();

    return SafeArea(
      child: Scaffold(
        appBar: appAppbar(title: "משימות"),
        body: Column(
          children: [
            // -----------------search-----------------
            const Divider(
              height: 20,
              thickness: 2,
            ),
            const Row(
              children: [
                SizedBox(width: 20),
                const Icon(Icons.search),
                const Text("   חיפוש"),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 2,
            ),
            // -----------------search-----------------
            appDesign.appDivider(),
            Row(
              children: [
                appDesign.appButtons(() {
                  appToast("test");
                }, const Icon(Icons.add_shopping_cart_sharp), "מילוי עגלה"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
