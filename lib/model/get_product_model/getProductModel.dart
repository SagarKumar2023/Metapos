import 'package:hive/hive.dart';
part 'getProductModel.g.dart';
class GetProductModel {
  GetProductModel({
    required this.error,
    required this.message,
    required this.data,
  });
  late final String error;
  late final String message;
  late final List<GetProductData> data;

  GetProductModel.fromJson(Map<String, dynamic> json){
    error = json['error'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>GetProductData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['error'] = error;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

@HiveType(typeId: 32)
class GetProductData extends HiveObject{
  GetProductData({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.discountprice,
    required this.desc,
    required this.soldOut,
    required this.showApp,
    required this.showPos,
    required this.showQrcode,
    required this.makemyown,
    required this.chooseNumberItems,
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
  late final int soldOut;
  @HiveField(7)
  late final int showApp;
  @HiveField(8)
  late final int showPos;
  @HiveField(9)
  late final int showQrcode;
  @HiveField(10)
  late final int makemyown;
  @HiveField(11)
  late final int chooseNumberItems;

  GetProductData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    imagePath = json['image_path'];
    price = json['price'];
    discountprice = json['discountprice'];
    desc = json['desc'];
    soldOut = json['sold_out'];
    showApp = json['show_app'];
    showPos = json['show_pos'];
    showQrcode = json['show_qrcode'];
    makemyown = json['makemyown'];
    chooseNumberItems = json['choose_number_items'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image_path'] = imagePath;
    _data['price'] = price;
    _data['discountprice'] = discountprice;
    _data['desc'] = desc;
    _data['sold_out'] = soldOut;
    _data['show_app'] = showApp;
    _data['show_pos'] = showPos;
    _data['show_qrcode'] = showQrcode;
    _data['makemyown'] = makemyown;
    _data['choose_number_items'] = chooseNumberItems;
    return _data;
  }
}