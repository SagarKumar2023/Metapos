import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DealsPriceCartController extends GetxController {

  RxList<int> dealsQuantities = <int>[].obs;
  RxList<double> dealsTotals = <double>[].obs;
  RxDouble dealsGrandTotal = 0.0.obs;

  void dealsInitialize(int length, List<dynamic> products) {
    if (dealsQuantities.length != length) {
      dealsQuantities.value = List.generate(length, (_) => 1);
      dealsTotals.value = List.generate(length, (index) {
        final price = double.tryParse(products[index].dealPrice ?? '0') ?? 0.0;
        return price;
      });
      dealsCalculateGrandTotal();
    }
  }


  void dealsIncrement(int index, double price) {
    if (index < dealsQuantities.length) {
      dealsQuantities[index]++;
      dealsTotals[index] = dealsQuantities[index] * price;
      dealsCalculateGrandTotal();
    }
  }

  void dealsDecrement(int index, double price) {
    if (index < dealsQuantities.length && dealsQuantities[index] > 1) {
      dealsQuantities[index]--;
      dealsTotals[index] = dealsQuantities[index] * price;
      dealsCalculateGrandTotal();
    }
  }

  void dealsCalculateGrandTotal() {
    dealsGrandTotal.value = dealsTotals.fold(0.0, (sum, item) => sum + item);
  }
}




