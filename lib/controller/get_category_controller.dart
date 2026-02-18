import 'dart:convert';
import 'dart:developer';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_utils/HiveBoxes.dart';
import 'package:metapos_sync_order_online_ofline/constant/AppUrl/app_Url.dart';
import 'package:metapos_sync_order_online_ofline/constant/snackBarUtils.dart';
import 'package:metapos_sync_order_online_ofline/controller/internet_contoller.dart';
import 'package:metapos_sync_order_online_ofline/model/category_model/CategoryListModel/CategoryListModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:metapos_sync_order_online_ofline/model/submit_order_model/submit_order_model.dart';

class CategoryController extends GetxController {
  final InternetController internetController = Get.find<InternetController>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final List<CatData> _data = [];
  List<CatData> get dataList => _data;

  final List<CatOtherData> _otherDataList = [];
  List<CatOtherData> get otherDataList => _otherDataList;

  final List<CatComboData> _comboDataList = [];
  List<CatComboData> get comboDataList => _comboDataList;

  final List<CatHalfNHalfData> _halfNFDataList = [];
  List<CatHalfNHalfData> get halfNHalfData => _halfNFDataList;

  final List<CatSpecialDealDataList> _specialDealDataList = [];
  List<CatSpecialDealDataList> get specialDealDataList => _specialDealDataList;

  final List<CatDealDataList> _dealDataList = [];
  List<CatDealDataList> get dealDataList => _dealDataList;

  List<CatVariantDataArray> _variantDataArray = [];
  List<CatVariantDataArray> get variantDataArray => _variantDataArray ;

  List<CatAddonsDataArray> _addonsDataArray = [];
  List<CatAddonsDataArray> get addonsDataArray => _addonsDataArray ;

  final categoryBox = HiveBoxes.getCategoryResponseDB() ;

  void _addAllLists(GetCategoryModelWithDB model) {
    _data.addAll(model.data);
    _otherDataList.addAll(model.otherData);
    _comboDataList.addAll(model.comboData);
    _halfNFDataList.addAll(model.halfNHalfData);
    _dealDataList.addAll(model.dealDataList);
    _specialDealDataList.addAll(model.specialDealDataList);
  }

  void _clearAllLists() {
    _data.clear();
    _otherDataList.clear();
    // _comboDataList.clear();
    _halfNFDataList.clear();
    // _dealDataList.clear();
    // _specialDealDataList.clear();
  }

  Future getAllCategoryData() async {
    _isLoading = true;
    update();

    if (internetController.isOnline.value) {

      var body = {"type": "POS"};
      final response = await http.post(
        Uri.parse(AppUrl.getCategory),
        body: body,
      );

      log("URL :- ${AppUrl.getCategory}");
      log("--------------------------  RESPONSE DATA  ------------------------------- ");
      log(response.body);

      if (response.statusCode == 200) {
        final categoryModel = GetCategoryModelWithDB.fromJson(jsonDecode(response.body));
        if (categoryModel.error == "0") {
          _clearAllLists();
          _addAllLists(categoryModel);
          await categoryBox.put('category_data', categoryModel);
          log("Category Model Data Saved in Hive Successfully");
        } else {
          SnackBarUtils.showWarning("Error", categoryModel.message);
        }
      } else {
        SnackBarUtils.showWarning("Error", "Server Error: ${response.statusCode}");
      }
    }
    else {
      log("Offline : loading Hive category data ...");

      if (categoryBox.containsKey('category_data')) {

        final offlineData = categoryBox.get('category_data');

        if (offlineData != null) {
          _clearAllLists();
          _addAllLists(offlineData);
          SnackBarUtils.showSuccess("Offline Mode", "Showing saved offline category_data.");
        }

      } else {
        SnackBarUtils.showWarning("Offline","No offline category_data available!");
      }
    }
    _isLoading = false;
    update();
  }

   SubmitOrderResponseWithDB? _submitOrderResponse ;
  SubmitOrderResponseWithDB? get submitOrderResponse => _submitOrderResponse;

  // Future submitOrder({
  //   required Map<String, dynamic> body,
  // }) async {
  //   _isLoading = true;
  //   update();
  //
  //   if (internetController.isOnline.value) {
  //
  //     final response = await http.post(
  //       Uri.parse(AppUrl.submitOrder),
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //       body: jsonEncode(body),
  //     );
  //
  //     log("--------------------------  REQUEST DATA  ------------------------------- ");
  //     log(jsonEncode(body));
  //     log("URL :- ${AppUrl.submitOrder}");
  //     log("--------------------------  RESPONSE DATA  ------------------------------- ");
  //     log(response.body);
  //
  //     if (response.statusCode == 200) {
  //       final submitOrderModel = SubmitOrderResponse.fromJson(jsonDecode(response.body));
  //       if (submitOrderModel.error == "0") {
  //         _submitOrderResponse = submitOrderModel ;
  //         _isLoading = false;
  //         update();
  //
  //       } else {
  //         SnackBarUtils.showWarning("Sorry","Item not found in this order.");
  //         _isLoading = false;
  //         update();
  //       }
  //     } else {
  //       SnackBarUtils.showWarning("Error", "Server Error: ${response.statusCode}");
  //       _isLoading = false;
  //       update();
  //     }
  //   } else {
  //     SnackBarUtils.showWarning(
  //       "Offline Mode",
  //       "You are offline. Your order will be submitted once you're back online.",
  //     );
  //     _isLoading = false;
  //     update();
  //   }
  //   _isLoading = false;
  //   update();
  // }

  Future submitOrder({required Map<String, dynamic> body,}) async {
    try {
      _isLoading = true;
      update();

      if (!internetController.isOnline.value) {
        SnackBarUtils.showWarning(
          "Offline Mode",
          "You are offline. Your order will be submitted once you're back online.",
        );
        return;
      }

      final response = await http.post(
        Uri.parse(AppUrl.submitOrder),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(body),
      );

      log("--------- REQUEST ----------");
      log(jsonEncode(body));
      log("URL :- ${AppUrl.submitOrder}");
      log("--------- RESPONSE ---------");
      log(response.body);

      if (response.statusCode == 200) {
        final submitOrderModel = SubmitOrderResponseWithDB.fromJson(jsonDecode(response.body));

        if (submitOrderModel.error == "0") {
          _submitOrderResponse = submitOrderModel;
        } else {
          SnackBarUtils.showWarning("Sorry", "Item not found in this order.");
        }

      } else {
        SnackBarUtils.showWarning("Error", "Server Error: ${response.statusCode}");
      }
    } catch (e) {
      SnackBarUtils.showWarning("Error", e.toString());
      log("Error ${e.toString()}");
    } finally {
      _isLoading = false;
      update();
    }
  }

  String submitOrderDateTime() {
    final now = DateTime.now();
    return "${now.year}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')} "
        "${now.hour.toString().padLeft(2,'0')}:${now.minute.toString().padLeft(2,'0')}:${now.second.toString().padLeft(2,'0')}";
  }

  String _variantOptionSelectedName = '';
  String? get variantOptionSelectedName => _variantOptionSelectedName;
  String _variantOptionSelectedId = '';
  String? get variantOptionSelectedId => _variantOptionSelectedId;

  String _variantXLargeSelectedName = '';
  String? get variantXLargeSelectedName => _variantXLargeSelectedName;
  String _variantXLargeSelectedId = '';
  String? get variantXLargeSelectedId => _variantXLargeSelectedId;

  String _variantLargeSelectedName = '';
  String get variantLargeSelectedName => _variantLargeSelectedName;
  String _variantLargeSelectedId = '';
  String get variantLargeSelectedId => _variantLargeSelectedId;

  String? _variantSelectedPrice;
  String? get variantSelectedPrice => _variantSelectedPrice;

  double _productPrice = 0.0;
  double get productPrice => _productPrice;

  double _totalAddonPrice = 0.0;
  double get totalAddonPrice => _totalAddonPrice;

  set totalAddonPrice(double value) {
    _totalAddonPrice = value;
    update(); // triggers rebuild
  }

  /// Grand total calculation = base + variant + addons
  double get totalPrice {
    final variantPrice = double.tryParse(
      _variantSelectedPrice?.replaceAll(RegExp(r'[^\d.]'), '') ?? '0',
    ) ??
        0.0;
    return variantPrice + _productPrice + _totalAddonPrice;
  }

  /// Selects Large variant and updates UI
  void variantLargeFunction(String label, String price,String? id) {
    _variantLargeSelectedName = label;
    _variantLargeSelectedId = id! ;
    _variantSelectedPrice = price;
    update();
  }

  /// Selects optional variant
  void variantOptionFunction(String? value , String? id) {
    _variantOptionSelectedName = value ?? '';
    _variantOptionSelectedId = id ?? '';
    update();
  }

  /// Selects X-Large variant
  void variantXLargeFunction(String? value,String? id) {
    _variantXLargeSelectedName = value ?? '';
    _variantXLargeSelectedId = id ?? '' ;
    update();
  }

  ///  Reset on screen close
  @override
  void onClose() {
    _variantLargeSelectedName = '';
    _variantSelectedPrice = null;
    _totalAddonPrice = 0.0;
    print("Only variant data reset. _productPrice = $_productPrice");
    super.onClose();
  }

  ///  Set base product price from server or screen param
  void setBaseProductPrice(double price) {
    _productPrice = price;
  }

  @override
  void onInit() {
    super.onInit();

    ///  Call this only if data is preloaded (like from API or passed to controller)
    if (variantDataArray.isNotEmpty) {
      final largeVariant = variantDataArray.firstWhereOrNull((e) => e.variantName == "Large");
      if (largeVariant != null && largeVariant.variantDetail.isNotEmpty) {
        final firstDetail = largeVariant.variantDetail[0];
        variantLargeFunction(firstDetail.name, firstDetail.price,firstDetail.id.toString());
      }
    }

    if (variantDataArray.isNotEmpty) {
      final xlargeVariant = variantDataArray.firstWhereOrNull((e) => e.variantName == "X-Large");
      if (xlargeVariant != null && xlargeVariant.variantDetail.isNotEmpty) {
        final firstDetail = xlargeVariant.variantDetail[0];
        variantXLargeFunction(firstDetail.name,firstDetail.id.toString());
        _totalAddonPrice += double.tryParse(firstDetail.price.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0.0;
      }
    }

    if (variantDataArray.isNotEmpty) {
      final optionVariant = variantDataArray.firstWhereOrNull((e) => e.variantName == "Options");
      if (optionVariant != null && optionVariant.variantDetail.isNotEmpty) {
        final firstDetail = optionVariant.variantDetail[0];
        variantOptionFunction(firstDetail.name,firstDetail.id.toString());
      }
    }

    update();
  }

}



