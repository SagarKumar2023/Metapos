import 'dart:convert';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_utils/HiveBoxes.dart';
import 'package:metapos_sync_order_online_ofline/constant/AppUrl/app_Url.dart';
import 'package:metapos_sync_order_online_ofline/constant/snackBarUtils.dart';
import 'package:metapos_sync_order_online_ofline/constant/string_utils.dart';
import 'package:metapos_sync_order_online_ofline/controller/internet_contoller.dart';
import 'package:metapos_sync_order_online_ofline/model/get_product_details_model/getProductDetailsModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class GetProductDetailsController extends GetxController{

  bool _isLoading = false ;
  bool get  isLoading => _isLoading ;

  final InternetController internetController = Get.find<InternetController>();

  GetFoodListProductDetailsData? _productDetailsData ;

  GetFoodListProductDetailsData? get productDetailData => _productDetailsData;

  List<GetFoodListVariantDataArray> _variantDataArray = [];
  List<GetFoodListVariantDataArray> get variantDataArray => _variantDataArray ;

  List<String> _containData = [] ;
  List<String> get containData =>  _containData ;

  List<GetFoodListAddonsDataArray> _addonDataArray = [] ;
  List<GetFoodListAddonsDataArray> get addonDataArray => _addonDataArray;

  // Future getProductDetails(String? foodId)async{
  //   _isloading = true ;
  //   update();
  //
  //   if(internetController.isOnline.value){
  //     var body = {
  //       'food':foodId
  //     };
  //
  //     http.Response response = await http.post(
  //         Uri.parse(AppUrl.getProductDetail),
  //         body: body
  //     );
  //
  //     if(response.statusCode == 200){
  //       GetFoodListProductDetailsModel productDetailsModel = GetFoodListProductDetailsModel.fromJson(jsonDecode(response.body));
  //       if(productDetailsModel.error == '0'){
  //         _productDetailsData = productDetailsModel.data ;
  //         _containData = productDetailsModel.data!.containsData ;
  //         _variantDataArray = productDetailsModel.data!.variantDataArray! ;
  //         _addonDataArray = productDetailsModel.data!.addonsDataArray! ;
  //         _productPrice =double.parse(productDetailsModel.data!.price);
  //         _isloading = false ;
  //         update();
  //       }else{
  //         Get.snackbar(StringUtil.title,productDetailsModel.message.toString(),backgroundColor: ColorUtils.red,colorText: ColorUtils.white);
  //         _isloading =false ;
  //         update();
  //       }
  //     }else {
  //       Get.snackbar(StringUtil.title,response.statusCode.toString(),backgroundColor: ColorUtils.red,colorText: ColorUtils.white);
  //       _isloading =false ;
  //       update();
  //     }
  //   }else{
  //
  //   }
  // }

  final productDetailsBox = HiveBoxes.getProductDetailsDB() ;

  Future getProductDetails(String? foodId)async{
    _isLoading = true ;
    update();

    if(internetController.isOnline.value){
      var body = {
        'food':foodId
      };

      http.Response response = await http.post(
          Uri.parse(AppUrl.getProductDetail),
          body: body
      );

      if(response.statusCode == 200){
        GetProductDetailsWithDBModel productDetailsModel = GetProductDetailsWithDBModel.fromJson(jsonDecode(response.body));
        if(productDetailsModel.error == '0'){
          _clearAllLists();
          _addAllLists(productDetailsModel);
          await productDetailsBox.put(foodId, productDetailsModel);
          print("GetFoodListProductDetailsModel Data Saved in Hive Successfully ID → $foodId");
          _isLoading = false ;
          update();
        }else{
          SnackBarUtils.showWarning(StringUtil.title,productDetailsModel.message.toString());
          _isLoading =false ;
          update();
        }
      }else {
        SnackBarUtils.showWarning(StringUtil.title,response.statusCode.toString());
        _isLoading =false ;
        update();
      }
    }else{
      print("Offline → loading Hive get_food_list_product_details_model_data data...");

      if (productDetailsBox.containsKey(foodId)) {

        final offlineData = productDetailsBox.get(foodId);

        if (offlineData != null) {
          _clearAllLists();
          _addAllLists(offlineData);
          SnackBarUtils.showSuccess("Offline Mode", "Showing saved offline get_food_list_product_details_model_data data.");
        }

      } else {
        SnackBarUtils.showWarning("Offline","No offline get_food_list_product_details_model_data available!");
      }
    }
    _isLoading = false;
    update();
  }

  void _clearAllLists() {
    _productDetailsData = null ;
    _variantDataArray.clear();
    _containData.clear();
    _addonDataArray.clear();
    _productPrice = 0.0 ;
  }

  void _addAllLists(GetProductDetailsWithDBModel model) {
    _productDetailsData = model.data;
    _variantDataArray.addAll(model.data.variantDataArray);
    _containData.addAll(model.data.containsData);
    _addonDataArray.addAll(model.data.addonsDataArray);
    _productPrice = double.tryParse(model.data.price) ?? 0.0;
  }


  String? _variantOptionSelect;
  String? get variantOptionSelect => _variantOptionSelect;

  String? _variantXLargeSelect;
  String? get variantXLargeSelect => _variantXLargeSelect;

  String _variantLargeSelect = '';
  String get variantLargeSelect => _variantLargeSelect;

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
  void variantLargeFunction(String label, String price) {
    _variantLargeSelect = label;
    _variantSelectedPrice = price;
    update();
  }

  /// Selects optional variant
  void variantOptionFunction(String? value) {
    _variantOptionSelect = value;
    update();
  }

  /// Selects X-Large variant
  void variantXLargeFunction(String? value) {
    _variantXLargeSelect = value;
    update();
  }

  ///  Reset on screen close
  @override
  void onClose() {
    _variantLargeSelect = '';
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
        variantLargeFunction(firstDetail.name, firstDetail.price);
      }
    }

    if (variantDataArray.isNotEmpty) {
      final xlargeVariant = variantDataArray.firstWhereOrNull((e) => e.variantName == "X-Large");
      if (xlargeVariant != null && xlargeVariant.variantDetail.isNotEmpty) {
        final firstDetail = xlargeVariant.variantDetail[0];
        variantXLargeFunction(firstDetail.name);
        _totalAddonPrice += double.tryParse(firstDetail.price.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0.0;
      }
    }

    if (variantDataArray.isNotEmpty) {
      final optionVariant = variantDataArray.firstWhereOrNull((e) => e.variantName == "Options");
      if (optionVariant != null && optionVariant.variantDetail.isNotEmpty) {
        final firstDetail = optionVariant.variantDetail[0];
        variantOptionFunction(firstDetail.name);
      }
    }

    update();
  }

}

