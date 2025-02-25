class Utils {
  static String generateUniqueId() {
    return DateTime.now().toString();
  }

  static String convertTextToBlanks(String text) {
    // return text.replaceAll(RegExp(r'\w'), '_');
    return text.replaceAllMapped(RegExp(r'[a-zA-Z]'), (match) => '_');
  }
}
