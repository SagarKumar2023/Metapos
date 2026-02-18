import 'dart:convert';
import 'package:metapos_sync_order_online_ofline/constant/AppUrl/app_Url.dart';
import 'package:metapos_sync_order_online_ofline/constant/color_Utils.dart';
import 'package:metapos_sync_order_online_ofline/constant/string_utils.dart';
import 'package:metapos_sync_order_online_ofline/model/get_product_model/getProductModel.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart'as http;


class GetProductController extends GetxController{

  bool _isLoading = false ;
  bool get isLoading => _isLoading ;

  List <GetProductData> _getProductData = [];
  List<GetProductData> get getProductData => _getProductData ;

  Future getProduct(String? catId)async{
    _isLoading = true;
    update();

    var body = {
      'category':catId
    };

    http.Response response = await http.post(
      Uri.parse(AppUrl.getProduct),
      body: body
    );

    if(response.statusCode == 200){
      GetProductModel getProductModel = GetProductModel.fromJson(jsonDecode(response.body));
      if(getProductModel.error == "0"){
        _getProductData = getProductModel.data ;
        _isLoading =false ;
        update();
      }else{
        Get.snackbar(StringUtil.title,getProductModel.message.toString(),backgroundColor: ColorUtils.red,colorText: ColorUtils.white);
        _isLoading =false ;
        update();
      }
    }else{
      Get.snackbar(StringUtil.title,response.statusCode.toString(),backgroundColor: ColorUtils.red,colorText: ColorUtils.white);
      _isLoading =false ;
      update();
    }
  }

}