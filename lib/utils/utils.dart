import 'dart:math';

class Utils {
 static int generateRandomNumer() {
    final random = Random();
    final number = random.nextInt(999);
    return number;
  }
}
