import 'package:hive/hive.dart';
part 'DealsOrderHiveBoxModel.g.dart';

@HiveType(typeId: 15)
class DealsHoldSingleOrderListDBModel extends HiveObject {

  @HiveField(0)
  String dealName;

  @HiveField(1)
  String? dealPrice;

  @HiveField(2)
  String dealTotalPrice ;

  @HiveField(3)
  List<String?> dealFoodName ;

  @HiveField(4)
  List<String?> dealCategory ;

  @HiveField(5)
  int dealQty;

  @HiveField(6)
  List<String?> dealNoOfItem;

  @HiveField(7)
  String dealId;

  @HiveField(8)
  String? dealDesc;



  DealsHoldSingleOrderListDBModel({
    required this.dealName,
    required this.dealPrice,
    required this.dealQty,
    required this.dealTotalPrice,
    required this.dealNoOfItem,
    required this.dealId,
    required this.dealFoodName,
    required this.dealCategory,
    required this.dealDesc

  });
}
