class Utility {
  static double getBMI(double height, double weight) {
    return (weight / (height * height));
  }

  static double checkNumber(String text) {
    if (text.isNotEmpty) {
      try {
        return double.parse(text);
      } catch (e) {
        return 0;
      }
    }
    return 0;
  }
}
