import 'package:hive/hive.dart';
part 'DealsAddToCartHiveBoxModel.g.dart';

@HiveType(typeId: 10)
class DealsAddToCartDBModel extends HiveObject {

  @HiveField(0)
  String? dealName;

  @HiveField(1)
  String? dealPrice;

  @HiveField(2)
  List<String?> dealSelectedFoodName;

  @HiveField(3)
  List<String> dealsNumberOfItem;

  @HiveField(4)
  List<String> dealsCategory;

  @HiveField(5)
  String? dealId;

  @HiveField(6)
  String? dealDesc;

  @HiveField(7)
  String? productCount;

  @HiveField(8)
  String? extras;

  @HiveField(9)
  String? image;

  @HiveField(10)
  String? contains;

  DealsAddToCartDBModel({
    required this.dealName,
    required this.dealPrice,
    required this.dealsCategory,
    required this.dealsNumberOfItem,
    required this.dealSelectedFoodName,
    required this.dealId,
    required this.dealDesc,
    this.productCount,
    this.extras,
    this.image,
    this.contains

  });

  /// update count only
  void updateCount(String count) {
    productCount = count;
    save();  // Hive save()
  }
}
