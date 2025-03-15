class Utils {
  static String generateUniqueId() {
    return DateTime.now().toString();
  }

  static String convertTextToBlanks(String text) {
    return text.replaceAll(RegExp(r'[^\s\p{P}]', unicode: true), '_');
  }

  static String convertTextToBlanksBesidesFirstLetters(String text) {
    return text.replaceAllMapped(RegExp(r'\b(\d+|\w)(\w*)\b'), (match) {
      if (RegExp(r'^\d+$').hasMatch(match.group(1)!)) {
        // If the word starts with a number, leave it unchanged
        return match.group(0)!;
      }
      return match.group(1)! + match.group(2)!.replaceAll(RegExp(r'\w'), '_');
    });
  }
}
