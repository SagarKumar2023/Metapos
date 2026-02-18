import 'package:hive/hive.dart';
part 'SpecialDealsAddToCartHiveBoxModel.g.dart';

@HiveType(typeId: 11)
class SpecialDealsAddToCartDBModel extends HiveObject {

  @HiveField(0)
  String? specialDealName;

  @HiveField(1)
  String? specialDealPrice;

  @HiveField(2)
  List<String?> specialDealSelectedFoodName;

  @HiveField(3)
  List<String> specialDealNumberOfItem;

  @HiveField(4)
  List<String> specialDealCategory;

  @HiveField(5)
  String? specialDealId;

  @HiveField(6)
  List<String> variantName;

  @HiveField(7)
  String specialDealDesc;

  @HiveField(8)
  String? productCount;

  @HiveField(9)
  String? extras;

  @HiveField(10)
  String? images;

  @HiveField(11)
  String? contains;

  SpecialDealsAddToCartDBModel({
    required this.specialDealName,
    required this.specialDealPrice,
    required this.specialDealCategory,
    required this.specialDealNumberOfItem,
    required this.specialDealSelectedFoodName,
    required this.specialDealId,
    required this.variantName,
    required this.specialDealDesc,
    this.productCount,
    this.extras,
    this.images,
    this.contains

  });
  /// update count only
  void updateCount(String count) {
    productCount = count;
    save();  // Hive save()
  }
}


