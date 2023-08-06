import 'package:flutter/material.dart';

class DesignLines {
  appDivider() {
    return const Padding(
      padding: EdgeInsets.only(right: 25, left: 25, top: 10, bottom: 10),
      child: Divider(
        color: Colors.black12,
      ),
    );
  }

  appButtons(Function() onpress, Icon icon, String label) {
    return InkWell(
      onTap: onpress,
      child: Row(
        children: [
          const SizedBox(width: 20),
          icon,
          const SizedBox(width: 10),
          Text(label),
        ],
      ),
    );
  }
}
