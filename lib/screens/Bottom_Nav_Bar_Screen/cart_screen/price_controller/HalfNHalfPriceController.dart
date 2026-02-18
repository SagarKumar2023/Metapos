import 'package:get/get.dart';

class HalfNHalfPriceCartController extends GetxController {
  RxList<int> halfNHalfQuantities = <int>[].obs;
  RxList<double> halfNHalfItemTotals = <double>[].obs;

  /// Initializes quantities and itemTotals based on product list
  void halfNHalfInitialize(int itemCount, List<dynamic> products) {
    halfNHalfQuantities.value = List.generate(itemCount, (_) => 1);
    halfNHalfItemTotals.value = List.generate(
      itemCount,(index) {
        final totalPriceString = products[index].totalPrice;
      // final totalPriceString = products[index].productPrice;

      return double.tryParse(totalPriceString.toString()) ?? 0.0;
      },
    );
  }

  /// Increase quantity at index and update total
  void halfNHalfIncrement(int index, double unitPrice) {
    if (index >= halfNHalfQuantities.length) return;
    halfNHalfQuantities[index]++;
    halfNHalfItemTotals[index] = halfNHalfQuantities[index] * unitPrice;
  }

  /// Decrease quantity at index (min 1) and update total
  void halfNHalfDecrement(int index, double unitPrice) {
    if (index >= halfNHalfQuantities.length) return;
    if (halfNHalfQuantities[index] > 1) {
      halfNHalfQuantities[index]--;
      halfNHalfItemTotals[index] = halfNHalfQuantities[index] * unitPrice;
    }
  }

  /// Get total of all item totals
  double calculateHalfNHalfGrandTotal() {
    return halfNHalfItemTotals.fold(0.0, (sum, price) => sum + price);
  }
}

