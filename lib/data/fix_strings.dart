class FixString {
  // _tasks[index]["array"]
  cartFillingArrayTitle(String string) {
    String titleString = string.substring(1, string.indexOf(':'));
    return titleString;
  }

  cartFillingArrayCount(String string) {
    // _tasks[index]["array"]
    String countString =
        string.substring(string.indexOf(':'), string.length - 1);
    List<String> countList = countString
        .replaceAll('[', '')
        .replaceAll(']', '')
        .split(',')
        .map((element) => element.trim())
        .toList();
    int count = countList.length;
    return count;
  }
}
