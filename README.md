<br/>
<p align="center">
  <a href="https://github.com/kobymashiach/algoretailkobymashiach">
    <img src="https://pl2.algoretail.co.il/static/media/brand-logo.a2c8a7ec.png" alt="Logo" width="200" height="200">
  </a>

  <h3 align="center">Algoretail Home Assignment</h3>

  <p align="center">
    This is an create and display tasks application I wrote as part of a home assignment provided to me by Algoretail.
    <br/>
    <br/>
  </p>
</p>

![Contributors](https://img.shields.io/github/contributors/kobymashiach/algoretailkobymashiach?color=dark-green) ![Issues](https://img.shields.io/github/issues/kobymashiach/algoretailkobymashiach) 

## Table Of Contents

* [About the Project](#about-the-project)
* [Code example](#code-example)
* [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Authors](#authors)

## About The Project
<p align="center">
<img src="https://gifture.co.il/wp-content/uploads/2023/08/appScreenShot.jpg" height="300">

The goal of this project is to design and build scalable and lightweight mobile application. Our primary focus is to see how you’d design application from an architectural point of view using modern Flutter approaches and design patterns.

## Code example
### search tasks
```
TextField(
  style: const TextStyle(color: Colors.black54),
  controller: TextEditingController.fromValue(
    TextEditingValue(
        text: _searchQuery,
        selection: TextSelection(
          baseOffset: _searchQuery.length,
          extentOffset: _searchQuery.length,
        )),
  ),
  decoration: const InputDecoration(
    hintText: 'חיפוש',
    hintStyle: TextStyle(color: Colors.black38),
    border: InputBorder.none,
  ),
  onChanged: (value) => setState(() {
    _searchQuery = value;
  }),
),
```

### display by task
#### Cart filling
```
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
```

#### Cart distribution
```
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
                  AppNavigator().push(context, TaskScreen(taskId: id));
                },
                child: const Icon(Icons.arrow_circle_left_outlined))
          ],
        ),
      ),
    ],
  );
}
```

#### Inventory Count
```
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
        time,
        style: const TextStyle(fontSize: 12),
      ),
      InkWell(
          onTap: () => AppNavigator().push(context, TaskScreen(taskId: id)),
          child: sunOrMoon(time))
    ],
  );
}
```



## Built With

The project build by flutter base on dart.

* [flutter](https://flutter.dev/)

## Getting Started

Clone the code to your workspace in vs code.

### Prerequisites

You need install on your computer vs code, flutter, dart

### Installation

1. Open the flutter project in github:
https://github.com/KobyMashiach/algoretailkobymashiach

2.  Click on Code and copy HTTPS URL
https://github.com/KobyMashiach/algoretailkobymashiach.git

3. In vs code click on Source Control
4. Click on 'Clone Repository'
5. Paste the Url and click Enter

## License

Distributed under the MIT License. See [LICENSE](https://github.com/kobymashiach/algoretailkobymashiach/blob/main/LICENSE.md) for more information.

## Authors

## **[Koby Mashiach](https://github.com/KobyMashiach)** - *Software Engineer*
