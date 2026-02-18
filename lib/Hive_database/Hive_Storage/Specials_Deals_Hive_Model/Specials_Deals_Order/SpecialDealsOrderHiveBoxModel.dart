import 'package:hive/hive.dart';
part 'SpecialDealsOrderHiveBoxModel.g.dart';

@HiveType(typeId: 14)
class SpecialDealsHoldSingleOrderListDBModel extends HiveObject {

  @HiveField(0)
  String dealName;

  @HiveField(1)
  String dealPrice;

  @HiveField(2)
  String dealTotalPrice;

  @HiveField(3)
  List<String?> dealFoodName;

  @HiveField(4)
  List<String> dealCategory;

  @HiveField(5)
  int dealQty;

  @HiveField(6)
  List<String> dealNoOfItem;

  @HiveField(7)
  String dealId;

  @HiveField(8)
  String dealDesc;

  SpecialDealsHoldSingleOrderListDBModel({
    required this.dealCategory,
    required this.dealFoodName,
    required this.dealNoOfItem,
    required this.dealId,
    required this.dealName,
    required this.dealTotalPrice,
    required this.dealQty,
    required this.dealDesc,
    required this.dealPrice,

  });
}
