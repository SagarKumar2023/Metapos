import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/Category_Hive_Model/Category_Add_To_Cart/CategoryAddToCartHiveBoxModel.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/HalfAndHalf_Hive_Model/HalfAndHalf_Add_To_Cart/HalfAndHalfAddToCartHiveBoxModel.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_utils/HiveBoxes.dart';
import 'package:metapos_sync_order_online_ofline/model/category_model/CategoryListModel/CategoryListModel.dart';

class SubmitOrderAllProducts {
  /// Build all cart items in unified API format
  static List<Map<String, dynamic>> sendAllItems() {
  // static Map<String, dynamic> sendAllItems() {
    List<Map<String, dynamic>> finalItems = [];

    String addonIdsToString(List<CatAddonsDataArray> list) {
      return list.map((e) => e.addonsId.toString()).join(",");
    }

    String addonNamesToString(List<CatAddonsDataArray> list) {
      return list.map((e) => e.addonsName).join(",");
    }

    String listToCommaString(List<String> list) {
      return list.join(",");
    }

    final halfBox = HiveBoxes.halfAndHalfAddToCartDB();

    for (var item in halfBox.values.cast<HalfAndHalfAddToCartDBModel>()) {

      finalItems.add({
        "food": item.productName,
        "count": item.productCount.toString(),
        "foodprice": item.totalPrice.toString(),
        "discountprice": "0",
        "extras": "",
        "extrascount": 0,
        "extrasprice": 0.0,
        "foodid": item.productId.toString(),
        "extrasid": 0,
        "image": item.image,
        "variant_id": "",
        "other_variant_id": "",
        "other_variant_food": "",
        "contains_avalable": 1,
        "addons_avalable":1,
        // "addons_avalable": (int.tryParse(item.firstHalfSelectedAddonsAvailable.toString()) ?? 0) +
        //     (int.tryParse(item.secondHalfSelectedAddonsAvailable.toString()) ?? 0),
        "contains":item.contains,
        "contains_not_added": "",
        "addons": "",
        "notes": "",
        "type_two": "na",
        // "type": item.type,
        "type" : "half_n_half",
        "cat_name": "half_n_half",
        "addon_name": "",
        "make_my_product": "",
        "first_half": {
          "id": item.firstHalfSelectedNameId,
          "name": item.firstHalfSelectedName,
          "addOnId": addonIdsToString(item.firstHalfSelectedAddons),
          "addOnName": addonNamesToString(item.firstHalfSelectedAddons),
          "nonContainName": listToCommaString(item.firstHalfSelectedRemoveItems),
          "firstBases": "",
          "secondBases": "",
        },
        "second_half": {
          "id": item.secondHalfSelectedNameId,
          "name": item.secondHalfSelectedName,
          "addOnId": addonIdsToString(item.secondHalfSelectedAddons),
          "addOnName": addonNamesToString(item.secondHalfSelectedAddons),
          "nonContainName": listToCommaString(item.secondHalfSelectedRemoveItems),
          "firstBases": "",
          "secondBases": "",
        },
        "catId": "hnh",
        "gst_tax_percantage": "0.0",
        "gst_tax_amount": "0.0",
        "gst_applicable": "Excluded",
      });
    }

    /// Deal
    // final dealBox = HiveBoxes.dealsAddToCartHiveBox();
    // for (var deal in dealBox.values) {
    //   finalItems.add({
    //     "food": deal.dealName,
    //     "count": deal.productCount.toString(),
    //     "foodprice": deal.dealPrice.toString(),
    //     "discountprice": "0",
    //     "extras": "",
    //     "extrascount": 0,
    //     "extrasprice": 0.0,
    //     "foodid": deal.dealId.toString(),
    //     "extrasid": 0,
    //     "image": deal.image.toString(),
    //     "variant_id": "",
    //     "other_variant_id": "",
    //     "other_variant_food": "",
    //     "contains_avalable": 1,
    //     "addons_avalable": 0.0,
    //     "contains":deal.contains.toString(),
    //     "contains_not_added": "",
    //     "addons": "",
    //     "notes": "",
    //     "type_two": "na",
    //     "type": "",
    //     "cat_name": "",
    //     "addon_name": "",
    //     "make_my_product": "",
    //     "first_half": {},
    //     "second_half": {},
    //     "catId": "",
    //     "gst_tax_percantage": "10.0",
    //     "gst_tax_amount": "0.0",
    //     "gst_applicable": "Excluded",
    //   });
    // }

    ///SpecialDeal

    // final specialDealBox = HiveBoxes.specialDealsAddToCartHiveBox();
    // for (var sd in specialDealBox.values) {
    //   finalItems.add({
    //     "food": sd.specialDealName,
    //     "count": sd.productCount,
    //     "foodprice": sd.specialDealPrice.toString(),
    //     "discountprice": "0",
    //     "extras": "",
    //     "extrascount": 0,
    //     "extrasprice": 0.0,
    //     "foodid": sd.specialDealId.toString(),
    //     "extrasid": 0,
    //     "image": sd.images,
    //     "variant_id": "",
    //     "other_variant_id": "",
    //     "other_variant_food": "",
    //     "contains_avalable": 1,
    //     "addons_avalable": 0.0,
    //     "contains":sd.contains,
    //     "contains_not_added": "",
    //     "addons": "",
    //     "notes": "",
    //     "type_two": "na",
    //     "type": "",
    //     "cat_name": "",
    //     "addon_name": "",
    //     "make_my_product": "",
    //     "first_half": {},
    //     "second_half": {},
    //     "catId": "",
    //     "gst_tax_percantage": "0.0",
    //     "gst_tax_amount": "0.0",
    //     "gst_applicable": "Excluded",
    //   });
    //
    // }

    final c = HiveBoxes.categoryAddToCartDB();
    for (var item in c.values) {
      finalItems.add({
        "food": "${item.productName} (${[
          item.variantLargeSelectedName,
          item.variantOptionSelectedName,
          item.variantXLargeSelectedName
        ].where((e) => e != null && e.toString().isNotEmpty).join(', ')})",
        "count": item.productCount.toString(),
        "foodprice": item.productPrice.toString(),
        "discountprice": "0",
        "extras": "",
        "extrascount": 0,
        "extrasprice": 0.0,
        "foodid": item.id.toString(),
        "extrasid": 0,
        "image":item.images,
        "variant_id": [
          item.variantLargeSelectedId,
          item.variantOptionSelectedId,
          item.variantXLargeSelectedId
        ].where((e) => e != null && e != "").join(","),
        "other_variant_id": "",
        "other_variant_food":"",
        "contains_avalable": 1,
        "addons_avalable": 0.0,
        "contains":item.contains,
        "contains_not_added": (item.selectedAddons ?? []).join(", "),
        "addons": "",
        "notes": "",
        "type_two": "na",
        "type": item.type,
        "cat_name":item.catName,
        "addon_name": "",
        "make_my_product": "",
        "first_half": {},
        "second_half": {},
        "catId":item.catId,
        "gst_tax_percantage": item.gstTaxPercentage,
        "gst_tax_amount": "0.0",
        "gst_applicable": item.gstApplicable,
      });
    }
    return finalItems;
    // return {
    //   "items": finalItems,
    //   "shouldClearCart": true,
    // };
  }


  static Map<String, dynamic> orderSingleHalfNHalfItem (HalfAndHalfAddToCartDBModel item) {

    String addonIdsToString(List<CatAddonsDataArray> list) {
      return list.map((e) => e.addonsId.toString()).join(",");
    }

    String addonNamesToString(List<CatAddonsDataArray> list) {
      return list.map((e) => e.addonsName).join(",");
    }

    String listToCommaString(List<String> list) {
      return list.join(",");
    }

    return {
      "food": item.productName,
      "count": item.productCount.toString(),
      "foodprice": item.totalPrice.toString(),
      "discountprice": "0",
      "extras": "",
      "extrascount": 0,
      "extrasprice": 0.0,
      "foodid": item.productId.toString(),
      "extrasid": 0,
      "image": item.image,
      "variant_id": "",
      "other_variant_id": "",
      "other_variant_food": "",
      "contains_avalable": 1,
      "addons_avalable": 1,
      "contains": item.contains,
      "contains_not_added": "",
      "addons": "",
      "notes": "",
      "type_two": "na",
      "type": "half_n_half",
      "cat_name": "half_n_half",
      "addon_name": "",
      "make_my_product": "",
      "first_half": {
        "id": item.firstHalfSelectedNameId,
        "name": item.firstHalfSelectedName,
        "addOnId": addonIdsToString(item.firstHalfSelectedAddons),
        "addOnName": addonNamesToString(item.firstHalfSelectedAddons),
        "nonContainName": listToCommaString(item.firstHalfSelectedRemoveItems),
        "firstBases": "",
        "secondBases": "",
      },
      "second_half": {
        "id": item.secondHalfSelectedNameId,
        "name": item.secondHalfSelectedName,
        "addOnId": addonIdsToString(item.secondHalfSelectedAddons),
        "addOnName": addonNamesToString(item.secondHalfSelectedAddons),
        "nonContainName": listToCommaString(item.secondHalfSelectedRemoveItems),
        "firstBases": "",
        "secondBases": "",
      },
      "catId": "hnh",
      "gst_tax_percantage": "0.0",
      "gst_tax_amount": "0.0",
      "gst_applicable": "Excluded",
    };
  }

  static Map<String, dynamic> orderSingleCategoryItem (CategoryAddToCartDBModel item) {

    return {
      "food": "${item.productName} (${[
        item.variantLargeSelectedName,
        item.variantOptionSelectedName,
        item.variantXLargeSelectedName
      ].where((e) => e != null && e.toString().isNotEmpty).join(', ')})",
      "count": item.productCount.toString(),
      "foodprice": item.productPrice.toString(),
      "discountprice": "0",
      "extras": "",
      "extrascount": 0,
      "extrasprice": 0.0,
      "foodid": item.id.toString(),
      "extrasid": 0,
      "image":item.images,
      "variant_id": [
        item.variantLargeSelectedId,
        item.variantOptionSelectedId,
        item.variantXLargeSelectedId
      ].where((e) => e != null && e != "").join(","),
      "other_variant_id": "",
      "other_variant_food":"",
      "contains_avalable": 1,
      "addons_avalable": 0.0,
      "contains":item.contains,
      "contains_not_added": (item.selectedAddons ?? []).join(", "),
      "addons": "",
      "notes": "",
      "type_two": "na",
      "type": item.type,
      "cat_name":item.catName,
      "addon_name": "",
      "make_my_product": "",
      "first_half": {},
      "second_half": {},
      "catId":item.catId,
      "gst_tax_percantage": item.gstTaxPercentage,
      "gst_tax_amount": "0.0",
      "gst_applicable": item.gstApplicable,
    };
  }

  /// Clear all cart related Hive boxes
  static Future<void> clearAllCartBoxes() async {
    await HiveBoxes.categoryAddToCartDB().clear();
    await HiveBoxes.halfAndHalfAddToCartDB().clear();
    await HiveBoxes.dealsAddToCartDB().clear();
    await HiveBoxes.specialDealsAddToCartDB().clear();
    await HiveBoxes.halfAndHalfHoldSingleOrderListDB().clear();
    await HiveBoxes.categoryHoldSingleOrderListDB().clear();
    await HiveBoxes.halfAndHalfHoldMultipleOrderDB().clear();
    await HiveBoxes.categoryHoldMultipleOrderDB().clear();


  }
}

class SubmitOrderDataHolder {
  static List<CategoryAddToCartDBModel> categoryItems = [];
  static List<HalfAndHalfAddToCartDBModel> halfNHalfItems = [];
}

