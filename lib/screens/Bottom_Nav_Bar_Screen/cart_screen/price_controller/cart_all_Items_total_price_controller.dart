import 'package:get/get.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/price_controller/deals_price_conroller.dart';
import 'package:metapos_sync_order_online_ofline/screens/Bottom_Nav_Bar_Screen/cart_screen/price_controller/special_deals_price_conroller.dart';
import 'CategoryPriceController.dart';
import 'HalfNHalfPriceController.dart';

class CartAllItemsTotalPriceController extends GetxController {

  final CategoryPriceCartController bouquetsController = Get.find();
  final DealsPriceCartController dealsController = Get.find();
  final HalfNHalfPriceCartController halfNHalfController = Get.find();
  final SpecialDealsPriceCartController specialDealsController = Get.find();

  RxDouble cartAllItemsTotalPrice = 0.0.obs;

  @override
  void onInit() {
    super.onInit();

    // Listen to all value changes
    ever(bouquetsController.categoryGrandTotal, (_) => calculateFinalTotal());
    ever(dealsController.dealsGrandTotal, (_) => calculateFinalTotal());
    ever(specialDealsController.specialDealsAllItemsTotal, (_) => calculateFinalTotal());
    ever(halfNHalfController.halfNHalfItemTotals, (_) => calculateFinalTotal());

    // Initial calculation
    calculateFinalTotal();
  }

  void calculateFinalTotal() {
    final bouquets = bouquetsController.categoryGrandTotal.value;
    final deals = dealsController.dealsGrandTotal.value;
    final specialDeals = specialDealsController.specialDealsAllItemsTotal.value;
    final halfNHalf = halfNHalfController.halfNHalfItemTotals.fold(0.0, (sum, item) => sum + item);

    cartAllItemsTotalPrice.value = bouquets + deals + specialDeals + halfNHalf;
  }
}
