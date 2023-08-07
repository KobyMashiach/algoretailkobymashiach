import 'package:algoretailkobymashiach/screens/second_page.dart';
import 'package:algoretailkobymashiach/widgets/app_navigator.dart';
import 'package:flutter/material.dart';

// design of the home page
class DesignLines {
  // divider design
  appDivider() {
    return const Padding(
      padding: EdgeInsets.only(right: 25, left: 25, top: 10, bottom: 10),
      child: Divider(
        color: Colors.black12,
      ),
    );
  }

  // cart filling task design
  cartFilling(DesignLines appDesign, String label, String title, int count) {
    return Row(
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
            // text start from right
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
    );
  }

// cart distribution task design
  cartDistribution(
    BuildContext context,
    DesignLines appDesign,
    String label,
    String cartNumber,
    String urgency,
    String id,
  ) {
    return Row(
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
              InkWell(
                  onTap: () {
                    // send the tapped task id to next page
                    AppNavigator().push(context, TaskScreen(taskId: id));
                  },
                  child: const Icon(Icons.arrow_circle_left_outlined))
            ],
          ),
        ),
      ],
    );
  }

// Inventory count task design
  inventoryCount(BuildContext context, DesignLines appDesign, String label,
      String time, String id) {
    return Column(
      children: [
        Text(
          label,
          style:
              const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        Text(
          time, // morning or night
          style: const TextStyle(fontSize: 12),
        ),
        InkWell(
            onTap: () => AppNavigator().push(context, TaskScreen(taskId: id)),
            child: sunOrMoon(time))
      ],
    );
  }

  Widget sunOrMoon(String time) {
    return time == "ספירת בוקר"
        // if morning
        ? const Icon(Icons.sunny, color: Color.fromARGB(255, 199, 222, 24))
        // if night
        : Transform.rotate(
            angle: -1,
            child: const Icon(
              Icons.nightlight_round,
              color: Color.fromARGB(255, 227, 186, 186),
            ),
          );
  }
}
