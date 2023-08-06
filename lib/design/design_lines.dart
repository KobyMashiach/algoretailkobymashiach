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
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "מערך: $title",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "פריטים: $count",
                  textAlign: TextAlign.right,
                  style: const TextStyle(
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

  cartDistribution(
    BuildContext context,
    DesignLines appDesign,
    String label,
    String cartNumber,
    String urgency,
  ) {
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
          SizedBox(width: MediaQuery.sizeOf(context).width / 4),
          Text(cartNumber),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: [
                Text(
                  urgency,
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 3),
                const Icon(Icons.arrow_circle_left_outlined)
              ],
            ),
          ),
        ],
      ),
    );
  }

  inventoryCount(DesignLines appDesign, String label, String time) {
    return InkWell(
        onTap: () {},
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            Text(
              time,
              style: TextStyle(fontSize: 12),
            ),
            time == "ספירת בוקר"
                ? Icon(Icons.sunny, color: Colors.green[200])
                : Transform.rotate(
                    angle: -1,
                    child: Icon(
                      Icons.nightlight_round,
                      color: Colors.pink[100],
                    ),
                  )
          ],
        ));
  }
}
