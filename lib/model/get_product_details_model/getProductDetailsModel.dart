// import 'package:hive/hive.dart';
// part 'getProductDetailsModel.g.dart';
//
// @HiveType(typeId: 1)
// class GetFoodListProductDetailsModel extends HiveObject {
//   GetFoodListProductDetailsModel({
//     required this.error,
//     required this.message,
//     required this.data,
//   });
//   @HiveField(0)
//   late final String error;
//   @HiveField(1)
//   late final String message;
//   @HiveField(2)
//   GetFoodListProductDetailsData? data;
//
//   GetFoodListProductDetailsModel.fromJson(Map<String, dynamic> json){
//     error = json['error'];
//     message = json['message'];
//     data = GetFoodListProductDetailsData.fromJson(json['data']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['error'] = error;
//     _data['message'] = message;
//     // _data['data'] = data.toJson();
//     _data['data'] =  data != null ? data!.toJson() : null;
//     return _data;
//   }
// }
// @HiveType(typeId: 2)
// class GetFoodListProductDetailsData extends HiveObject {
//   GetFoodListProductDetailsData({
//     required this.id,
//     required this.name,
//     required this.imagePath,
//     required this.price,
//     required this.discountprice,
//     required this.desc,
//     required this.prodQty,
//     required this.soldOut,
//     required this.ingredients,
//     required this.variantDataArray,
//     required this.containsData,
//     required this.contains,
//     required this.foodAddons,
//     required this.addonsDataArray,
//     required this.catId,
//     required this.catName,
//     required this.type,
//     required this.makemyown,
//     required this.chooseNumberItems,
//     required this.isTakeAway,
//     required this.isHaveInHere,
//   });
//   @HiveField(0)
//   late final int id;
//   @HiveField(1)
//   late final String name;
//   @HiveField(2)
//   late final String imagePath;
//   @HiveField(3)
//   late final String price;
//   @HiveField(4)
//   late final String discountprice;
//   @HiveField(5)
//   late final String desc;
//   @HiveField(6)
//   late final int prodQty;
//   @HiveField(7)
//   late final int soldOut;
//   @HiveField(8)
//   late final List<String> ingredients;
//   @HiveField(9)
//   List<GetFoodListVariantDataArray>? variantDataArray;
//   @HiveField(10)
//   late final List<String> containsData;
//   @HiveField(11)
//   late final String contains;
//   @HiveField(12)
//   late final String foodAddons;
//   @HiveField(13)
//   List<GetFoodListAddonsDataArray>? addonsDataArray;
//   @HiveField(14)
//   late final int catId;
//   @HiveField(15)
//   late final String catName;
//   @HiveField(16)
//   late final String type;
//   @HiveField(17)
//   late final int makemyown;
//   @HiveField(18)
//   late final int chooseNumberItems;
//   @HiveField(19)
//   late final int isTakeAway;
//   @HiveField(20)
//   late final int isHaveInHere;
//
//   GetFoodListProductDetailsData.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     imagePath = json['image_path'];
//     price = json['price'];
//     discountprice = json['discountprice'];
//     desc = json['desc'];
//     prodQty = json['prod_qty'];
//     soldOut = json['sold_out'];
//     ingredients = List.castFrom<dynamic, String>(json['ingredients']);
//     //variantDataArray = List.from(json['variantDataArray']).map((e)=>GetFoodListVariantDataArray.fromJson(e)).toList();
//     variantDataArray = json['variantDataArray'] != null
//         ? (json['variantDataArray'] as List)
//         .map((e) => GetFoodListVariantDataArray.fromJson(e))
//         .toList()
//         : [];
//     containsData = List.castFrom<dynamic, String>(json['contains_data']);
//     contains = json['contains'];
//     foodAddons = json['food_addons'];
//     addonsDataArray = json['addonsDataArray'] != null
//         ? (json['addonsDataArray'] as List)
//         .map((e) => GetFoodListAddonsDataArray.fromJson(e))
//         .toList()
//         : [];
//     // addonsDataArray = List.from(json['addonsDataArray']).map((e)=>GetFoodListAddonsDataArray.fromJson(e)).toList();
//     catId = json['cat_id'];
//     catName = json['cat_name'];
//     type = json['type'];
//     makemyown = json['makemyown'];
//     chooseNumberItems = json['choose_number_items'];
//     isTakeAway = json['is_take_away'];
//     isHaveInHere = json['is_have_in_here'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['image_path'] = imagePath;
//     _data['price'] = price;
//     _data['discountprice'] = discountprice;
//     _data['desc'] = desc;
//     _data['prod_qty'] = prodQty;
//     _data['sold_out'] = soldOut;
//     _data['ingredients'] = ingredients;
//     _data['variantDataArray'] = variantDataArray!.map((e)=>e.toJson()).toList();
//     // _data['variantDataArray'] = variantDataArray.map((e)=>e.toJson()).toList();
//     _data['contains_data'] = containsData;
//     _data['contains'] = contains;
//     _data['food_addons'] = foodAddons;
//     _data['addonsDataArray'] = addonsDataArray;
//     // _data['addonsDataArray'] = addonsDataArray.map((e)=>e.toJson()).toList();
//     _data['cat_id'] = catId;
//     _data['cat_name'] = catName;
//     _data['type'] = type;
//     _data['makemyown'] = makemyown;
//     _data['choose_number_items'] = chooseNumberItems;
//     _data['is_take_away'] = isTakeAway;
//     _data['is_have_in_here'] = isHaveInHere;
//     return _data;
//   }
// }
//
// @HiveType(typeId: 3)
// class GetFoodListVariantDataArray extends HiveObject{
//   GetFoodListVariantDataArray({
//     required this.variantName,
//     required this.variantDetail,
//   });
//   @HiveField(0)
//   late final String variantName;
//   @HiveField(1)
//   late final List<GetFoodListVariantDetail> variantDetail;
//
//   GetFoodListVariantDataArray.fromJson(Map<String, dynamic> json){
//     variantName = json['variant_name'];
//     variantDetail = List.from(json['variant_detail']).map((e)=>GetFoodListVariantDetail.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['variant_name'] = variantName;
//     _data['variant_detail'] = variantDetail.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// @HiveType(typeId: 4)
// class GetFoodListVariantDetail extends HiveObject{
//   GetFoodListVariantDetail({
//     required this.id,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.food,
//     required this.name,
//     required this.variantType,
//     required this.imageid,
//     required this.price,
//     required this.dprice,
//     required this.prodQty,
//     this.prodSku,
//   });
//   @HiveField(0)
//   late final int id;
//   @HiveField(1)
//   late final String createdAt;
//   @HiveField(2)
//   late final String updatedAt;
//   @HiveField(3)
//   late final int food;
//   @HiveField(4)
//   late final String name;
//   @HiveField(5)
//   late final String variantType;
//   @HiveField(6)
//   late final int imageid;
//   @HiveField(7)
//   late final String price;
//   @HiveField(8)
//   late final String dprice;
//   @HiveField(9)
//   late final int prodQty;
//   @HiveField(10)
//   late final String? prodSku;
//
//   GetFoodListVariantDetail.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     food = json['food'];
//     name = json['name'];
//     variantType = json['variant_type'];
//     imageid = json['imageid'];
//     price = json['price'];
//     dprice = json['dprice'];
//     prodQty = json['prod_qty'];
//     prodSku = null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     _data['food'] = food;
//     _data['name'] = name;
//     _data['variant_type'] = variantType;
//     _data['imageid'] = imageid;
//     _data['price'] = price;
//     _data['dprice'] = dprice;
//     _data['prod_qty'] = prodQty;
//     _data['prod_sku'] = prodSku;
//     return _data;
//   }
// }
//
// @HiveType(typeId: 5)
// class GetFoodListAddonsDataArray extends HiveObject {
//   GetFoodListAddonsDataArray({
//     required this.addonsId,
//     required this.addonsName,
//     required this.addonsPrice,
//   });
//   @HiveField(0)
//   late final int addonsId;
//   @HiveField(1)
//   late final String addonsName;
//   @HiveField(2)
//   late final String addonsPrice;
//
//   GetFoodListAddonsDataArray.fromJson(Map<String, dynamic> json){
//     addonsId = json['addons_id'];
//     addonsName = json['addons_name'];
//     addonsPrice = json['addons_price'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['addons_id'] = addonsId;
//     _data['addons_name'] = addonsName;
//     _data['addons_price'] = addonsPrice;
//     return _data;
//   }
// }
//
//
//
//
//


import 'package:hive/hive.dart';
part 'getProductDetailsModel.g.dart';

@HiveType(typeId: 1)
class GetProductDetailsWithDBModel extends HiveObject {
  GetProductDetailsWithDBModel({
    required this.error,
    required this.message,
    required this.data,
  });
  @HiveField(0)
  late final String error;
  @HiveField(1)
  late final String message;
  @HiveField(2)
  late final GetFoodListProductDetailsData data;

  GetProductDetailsWithDBModel.fromJson(Map<String, dynamic> json){
    error = json['error'];
    message = json['message'];
    data = GetFoodListProductDetailsData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['error'] = error;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}
@HiveType(typeId: 2)
class GetFoodListProductDetailsData extends HiveObject {
  GetFoodListProductDetailsData({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.discountprice,
    required this.desc,
    required this.prodQty,
    required this.soldOut,
    required this.ingredients,
    required this.variantDataArray,
    required this.containsData,
    required this.contains,
    required this.foodAddons,
    required this.addonsDataArray,
    required this.catId,
    required this.catName,
    required this.type,
    required this.makemyown,
    required this.chooseNumberItems,
    required this.isTakeAway,
    required this.isHaveInHere,
  });
  @HiveField(0)
  late final int id;
  @HiveField(1)
  late final String name;
  @HiveField(2)
  late final String imagePath;
  @HiveField(3)
  late final String price;
  @HiveField(4)
  late final String discountprice;
  @HiveField(5)
  late final String desc;
  @HiveField(6)
  late final int prodQty;
  @HiveField(7)
  late final int soldOut;
  @HiveField(8)
  late final List<String> ingredients;
  @HiveField(9)
  late final List<GetFoodListVariantDataArray> variantDataArray;
  @HiveField(10)
  late final List<String> containsData;
  @HiveField(11)
  late final String contains;
  @HiveField(12)
  late final String foodAddons;
  @HiveField(13)
  late final List<GetFoodListAddonsDataArray> addonsDataArray;
  @HiveField(14)
  late final int catId;
  @HiveField(15)
  late final String catName;
  @HiveField(16)
  late final String type;
  @HiveField(17)
  late final int makemyown;
  @HiveField(18)
  late final int chooseNumberItems;
  @HiveField(19)
  late final int isTakeAway;
  @HiveField(20)
  late final int isHaveInHere;

  GetFoodListProductDetailsData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    imagePath = json['image_path'];
    price = json['price'];
    discountprice = json['discountprice'];
    desc = json['desc'];
    prodQty = json['prod_qty'];
    soldOut = json['sold_out'];
    ingredients = List.castFrom<dynamic, String>(json['ingredients']);
    variantDataArray = List.from(json['variantDataArray']).map((e)=>GetFoodListVariantDataArray.fromJson(e)).toList();
    containsData = List.castFrom<dynamic, String>(json['contains_data']);
    contains = json['contains'];
    foodAddons = json['food_addons'];
    addonsDataArray = List.from(json['addonsDataArray']).map((e)=>GetFoodListAddonsDataArray.fromJson(e)).toList();
    catId = json['cat_id'];
    catName = json['cat_name'];
    type = json['type'];
    makemyown = json['makemyown'];
    chooseNumberItems = json['choose_number_items'];
    isTakeAway = json['is_take_away'];
    isHaveInHere = json['is_have_in_here'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image_path'] = imagePath;
    _data['price'] = price;
    _data['discountprice'] = discountprice;
    _data['desc'] = desc;
    _data['prod_qty'] = prodQty;
    _data['sold_out'] = soldOut;
    _data['ingredients'] = ingredients;
    _data['variantDataArray'] = variantDataArray.map((e)=>e.toJson()).toList();
    _data['contains_data'] = containsData;
    _data['contains'] = contains;
    _data['food_addons'] = foodAddons;
    _data['addonsDataArray'] = addonsDataArray.map((e)=>e.toJson()).toList();
    _data['cat_id'] = catId;
    _data['cat_name'] = catName;
    _data['type'] = type;
    _data['makemyown'] = makemyown;
    _data['choose_number_items'] = chooseNumberItems;
    _data['is_take_away'] = isTakeAway;
    _data['is_have_in_here'] = isHaveInHere;
    return _data;
  }
}

@HiveType(typeId: 3)
class GetFoodListVariantDataArray extends HiveObject{
  GetFoodListVariantDataArray({
    required this.variantName,
    required this.variantDetail,
  });
  @HiveField(0)
  late final String variantName;
  @HiveField(1)
  late final List<GetFoodListVariantDetail> variantDetail;

  GetFoodListVariantDataArray.fromJson(Map<String, dynamic> json){
    variantName = json['variant_name'];
    variantDetail = List.from(json['variant_detail']).map((e)=>GetFoodListVariantDetail.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['variant_name'] = variantName;
    _data['variant_detail'] = variantDetail.map((e)=>e.toJson()).toList();
    return _data;
  }
}

@HiveType(typeId: 4)
class GetFoodListVariantDetail extends HiveObject{
  GetFoodListVariantDetail({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.food,
    required this.name,
    required this.variantType,
    required this.imageid,
    required this.price,
    required this.dprice,
    required this.prodQty,
    this.prodSku,
  });
  @HiveField(0)
  late final int id;
  @HiveField(1)
  late final String createdAt;
  @HiveField(2)
  late final String updatedAt;
  @HiveField(3)
  late final int food;
  @HiveField(4)
  late final String name;
  @HiveField(5)
  late final String variantType;
  @HiveField(6)
  late final int imageid;
  @HiveField(7)
  late final String price;
  @HiveField(8)
  late final String dprice;
  @HiveField(9)
  late final int prodQty;
  @HiveField(10)
  late final String? prodSku;

  GetFoodListVariantDetail.fromJson(Map<String, dynamic> json){
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    food = json['food'];
    name = json['name'];
    variantType = json['variant_type'];
    imageid = json['imageid'];
    price = json['price'];
    dprice = json['dprice'];
    prodQty = json['prod_qty'];
    prodSku = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['food'] = food;
    _data['name'] = name;
    _data['variant_type'] = variantType;
    _data['imageid'] = imageid;
    _data['price'] = price;
    _data['dprice'] = dprice;
    _data['prod_qty'] = prodQty;
    _data['prod_sku'] = prodSku;
    return _data;
  }
}

@HiveType(typeId: 5)
class GetFoodListAddonsDataArray extends HiveObject {
  GetFoodListAddonsDataArray({
    required this.addonsId,
    required this.addonsName,
    required this.addonsPrice,
  });
  @HiveField(0)
  late final int addonsId;
  @HiveField(1)
  late final String addonsName;
  @HiveField(2)
  late final String addonsPrice;

  GetFoodListAddonsDataArray.fromJson(Map<String, dynamic> json){
    addonsId = json['addons_id'];
    addonsName = json['addons_name'];
    addonsPrice = json['addons_price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['addons_id'] = addonsId;
    _data['addons_name'] = addonsName;
    _data['addons_price'] = addonsPrice;
    return _data;
  }
}