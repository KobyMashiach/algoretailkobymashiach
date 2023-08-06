import 'package:algoretailkobymashiach/design/design_lines.dart';
import 'package:algoretailkobymashiach/widgets/appToasts.dart';
import 'package:flutter/material.dart';

class ShowTasks {
  DesignLines appDesign = DesignLines();

  cartFilling(DesignLines appDesign) {
    return appDesign.appButtons(() {
      appToast("מילוי עגלה");
    }, const Icon(Icons.add_shopping_cart_sharp), "מילוי עגלה");
  }

  cartDistribution(DesignLines appDesign) {
    return appDesign.appButtons(() {
      appToast("ריקון עגלה");
    }, const Icon(Icons.remove_shopping_cart_outlined), "ריקון עגלה");
  }

  inventoryCount(DesignLines appDesign) {
    return appDesign.appButtons(() {
      appToast("ספירת מלאי");
    }, null, "ספירת מלאי");
  }
}
