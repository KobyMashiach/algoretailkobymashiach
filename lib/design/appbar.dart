import 'package:flutter/material.dart';

AppBar appAppbar({required String title}) {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    toolbarHeight: 100,
  );
}
