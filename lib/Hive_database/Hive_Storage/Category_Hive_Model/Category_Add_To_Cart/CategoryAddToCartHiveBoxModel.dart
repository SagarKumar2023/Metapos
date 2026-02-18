import 'package:hive/hive.dart';
part 'CategoryAddToCartHiveBoxModel.g.dart';

@HiveType(typeId: 6)
class CategoryAddToCartDBModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String productName;
  @HiveField(2)
  String productPrice;
  @HiveField(3)
  String productTotalPrice;
  @HiveField(4)
  String? variantLargeSelectedName;
  @HiveField(5)
  String? variantOptionSelectedName;
  @HiveField(6)
  String? variantXLargeSelectedName;
  @HiveField(7)
  String? variantLargeSelectedId;
  @HiveField(8)
  String? variantOptionSelectedId;
  @HiveField(9)
  String? variantXLargeSelectedId;
  @HiveField(10)
  String desc;
  @HiveField(11)
  String? productCount;
  @HiveField(12)
  List<String>? selectedAddons;
  @HiveField(13)
  String? extras;
  @HiveField(14)
  String? images;
  @HiveField(15)
  String? contains;
  @HiveField(16)
  String? type;
  @HiveField(17)
  String? catName;
  @HiveField(18)
  String? catId;
  @HiveField(19)
  String? gstApplicable;
  @HiveField(20)
  String? gstTaxPercentage;

  CategoryAddToCartDBModel({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.productTotalPrice,
    this.variantOptionSelectedName,
    this.variantLargeSelectedName,
    this.variantXLargeSelectedName,
    this.variantOptionSelectedId,
    this.variantLargeSelectedId,
    this.variantXLargeSelectedId,
    required this.desc,
    this.productCount,
    this.selectedAddons,
    this.extras,
    this.contains,
    this.images,
    this.type,
    this.catName,
    this.catId,
    this.gstApplicable,
    this.gstTaxPercentage
  });

  /// update count only
  void updateCount(String count) {
    productCount = count;
    save();  // Hive save()
  }
}
