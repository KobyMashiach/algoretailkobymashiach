class FixString {
  // Title of array
  cartFillingArrayTitle(String string) {
    String titleString = string.substring(1, string.indexOf(':'));
    return titleString;
  }

  // Counting items in an array
  cartFillingArrayCount(String string) {
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
