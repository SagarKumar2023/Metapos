import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SpecialDealsPriceCartController extends GetxController {

  RxList<int> specialDealsQuantities = <int>[].obs;
  RxList<double> specialDealsTotals = <double>[].obs;
  RxDouble specialDealsAllItemsTotal = 0.0.obs;

  void specialDealsInitialize(int length, List<dynamic> products) {
    if (specialDealsQuantities.length != length) {
      specialDealsQuantities.value = List.generate(length, (_) => 1);
      specialDealsTotals.value = List.generate(length, (index) {
        final price = double.tryParse(products[index].specialDealPrice ?? '0') ?? 0.0;
        return price;
      });
      specialDealsCalculateAllItemsTotal();
    }
  }


  void specialDealsIncrement(int index, double price) {
    if (index < specialDealsQuantities.length) {
      specialDealsQuantities[index]++;
      specialDealsTotals[index] = specialDealsQuantities[index] * price;
      specialDealsCalculateAllItemsTotal();
    }
  }

  void specialDealsDecrement(int index, double price) {
    if (index < specialDealsQuantities.length && specialDealsQuantities[index] > 1) {
      specialDealsQuantities[index]--;
      specialDealsTotals[index] = specialDealsQuantities[index] * price;
      specialDealsCalculateAllItemsTotal();
    }
  }

  void specialDealsCalculateAllItemsTotal() {
    specialDealsAllItemsTotal.value = specialDealsTotals.fold(0.0, (sum, item) => sum + item);
  }
}






