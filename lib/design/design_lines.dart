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

  cartFilling(DesignLines appDesign, String label, String title, int count) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(Icons.add_shopping_cart_sharp),
          ),
          const SizedBox(width: 10),
          Text(label),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "מערך: $title",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "פריטים: $count",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  cartDistribution(DesignLines appDesign, String label, String cart_number) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(Icons.remove_shopping_cart_outlined),
          ),
          const SizedBox(width: 10),
          Text(label),
          const Spacer(),
          Text(cart_number),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(label),
          ),
        ],
      ),
    );
  }

  inventoryCount(DesignLines appDesign, String label) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          const SizedBox(width: 20),
          const SizedBox(width: 10),
          Text(label),
        ],
      ),
    );
  }
}
