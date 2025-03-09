class Utils {
  static String generateUniqueId() {
    return DateTime.now().toString();
  }

  static String convertTextToBlanks(String text) {
    // return text.replaceAll(RegExp(r'\w'), '_');
    return text.replaceAllMapped(RegExp(r'[a-zA-Z]'), (match) => '_');
  }

  static String convertTextToBlanksBesidesFirstLetters(String text) {
    return text.replaceAllMapped(RegExp(r'[a-zA-Z]'), (match) {
      String letter = match.group(0)!;
      return letter == letter.toUpperCase() ? letter : '_';
    });
  }
}
