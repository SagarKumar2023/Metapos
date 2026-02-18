import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class CategoryPriceCartController extends GetxController {

  RxList<int> categoryQuantities = <int>[].obs;
  RxList<double> categoryTotals = <double>[].obs;
  RxDouble categoryGrandTotal = 0.0.obs;

  void categoryInitialize(int length, List<dynamic> products) {
    if (categoryQuantities.length != length) {
      categoryQuantities.value = List.generate(length, (_) => 1);
      categoryTotals.value = List.generate(length, (index) {
        final price = double.tryParse(products[index].productPrice.toString()) ?? 0.0;
        return price;
      });
      calculateCategoryGrandTotal();
    }
  }

  void categoryIncrement(int index, double price) {
    if (index < categoryQuantities.length) {
      categoryQuantities[index]++;
      categoryTotals[index] = categoryQuantities[index] * price;
      calculateCategoryGrandTotal();
    }
  }

  void categoryDecrement(int index, double price) {
    if (index < categoryQuantities.length && categoryQuantities[index] > 1) {
      categoryQuantities[index]--;
      categoryTotals[index] = categoryQuantities[index] * price;
      calculateCategoryGrandTotal();
    }
  }

  void calculateCategoryGrandTotal() {
    categoryGrandTotal.value = categoryTotals.fold(0.0, (sum, item) => sum + item);
  }
}
