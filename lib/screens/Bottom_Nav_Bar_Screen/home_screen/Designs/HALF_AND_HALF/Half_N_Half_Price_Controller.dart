import 'package:get/get.dart';

class HalfNHalfPriceController extends GetxController {
  RxDouble firstHalfBasePrice = 0.0.obs;
  RxDouble secondHalfBasePrice = 0.0.obs;
  RxList<double> firstHalfAddons = <double>[].obs;
  RxList<double> secondHalfAddons = <double>[].obs;

  double get totalPrice =>
      firstHalfBasePrice.value + secondHalfBasePrice.value +
      firstHalfAddons.fold(0.0, (sum, item) => sum + item) +
      secondHalfAddons.fold(0.0, (sum, item) => sum + item);

  void setFirstHalfBasePrice(double price) {
    firstHalfBasePrice.value = price;
  }

  void setSecondHalfBasePrice(double price) {
    secondHalfBasePrice.value = price;
  }

  void toggleFirstHalfAddon(double price) {
    if (firstHalfAddons.contains(price)) {
      firstHalfAddons.remove(price);
    } else {
      firstHalfAddons.add(price);
    }
  }

  void toggleSecondHalfAddon(double price) {
    if (secondHalfAddons.contains(price)) {
      secondHalfAddons.remove(price);
    } else {
      secondHalfAddons.add(price);
    }
  }

  void clearAll() {
    firstHalfBasePrice.value = 0.0;
    secondHalfBasePrice.value = 0.0;
    firstHalfAddons.clear();
    secondHalfAddons.clear();
  }
}
