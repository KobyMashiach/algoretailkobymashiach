// ignore_for_file: empty_catches

import 'package:flutter/material.dart';

class AppNavigator {
  // push navigator (save all last pages from memory)
  push(BuildContext context, Widget page) {
    try {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return page;
          },
        ),
      );
    } catch (e) {}
  }

  // push navigator (delete all last pages from memory)
  pushAndRemoveUntil(BuildContext context, Widget page) {
    try {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) {
            return page;
          },
        ),
        (route) => false,
      );
    } catch (e) {}
  }

  // push navigator (delete just last page from memory)
  pushReplacement(BuildContext context, Widget page) {
    try {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => page));
    } catch (e) {}
  }

  // pop navigator (close correct page)
  pop(BuildContext context) {
    try {
      Navigator.of(context).pop();
    } catch (e) {}
  }
}
