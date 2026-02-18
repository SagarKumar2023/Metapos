import 'package:hive/hive.dart';
import 'package:metapos_sync_order_online_ofline/model/category_model/CategoryListModel/CategoryListModel.dart';
part 'HalfAndHalf_Hold_Multiple_order_model.g.dart';

@HiveType(typeId: 40)
class HalfAndHalfHoldMultipleOrderDBModel extends HiveObject {
  @HiveField(0)
  List<CatAddonsDataArray> firstHalfSelectedAddons;

  @HiveField(1)
  List<CatAddonsDataArray> secondHalfSelectedAddons;

  @HiveField(2)
  String? firstHalfSelect;

  @HiveField(3)
  String? firstHalfSelectedName;

  @HiveField(4)
  String? firstHalfSelectedNameId;

  @HiveField(5)
  String? firstHalfSelectedVariant;

  @HiveField(6)
  String? firstHalfSelectedPrice;

  @HiveField(7)
  String? secondHalfSelect;

  @HiveField(8)
  String? secondHalfSelectedName;

  @HiveField(9)
  String? secondHalfSelectedNameId;

  @HiveField(10)
  String? secondHalfSelectedVariant;

  @HiveField(11)
  String? secondHalfSelectedPrice;

  @HiveField(12)
  List<String> firstHalfSelectedRemoveItems;

  @HiveField(13)
  List<String> secondHalfSelectedRemoveItems;

  @HiveField(14)
  String productName;

  @HiveField(15)
  String totalPrice;

  @HiveField(16)
  String productId;

  @HiveField(17)
  String productDesc;

  @HiveField(18)
  String? productCount;

  @HiveField(19)
  String? catName;

  @HiveField(20)
  String? type;

  @HiveField(21)
  String? catId;

  @HiveField(22)
  String? contains;

  @HiveField(23)
  String? image;

  @HiveField(24)
  String? firstHalfSelectedAddonsAvailable;

  @HiveField(25)
  String? secondHalfSelectedAddonsAvailable;

  @HiveField(26)
  String? gtpOfQtyInToProductPrice;

  HalfAndHalfHoldMultipleOrderDBModel({
    required this.firstHalfSelectedAddons,
    required this.secondHalfSelectedAddons,
    this.firstHalfSelect,
    this.firstHalfSelectedName,
    this.firstHalfSelectedNameId,
    this.firstHalfSelectedVariant,
    this.firstHalfSelectedPrice,
    this.secondHalfSelect,
    this.secondHalfSelectedName,
    this.secondHalfSelectedNameId,
    this.secondHalfSelectedVariant,
    this.secondHalfSelectedPrice,
    required this.firstHalfSelectedRemoveItems,
    required this.secondHalfSelectedRemoveItems,
    required this.productName,
    required this.totalPrice,
    required this.productId,
    required this.productDesc,
    this.productCount,
    this.catId,
    this.catName,
    this.type,
    this.contains,
    this.image,
    this.firstHalfSelectedAddonsAvailable,
    this.secondHalfSelectedAddonsAvailable,
    this.gtpOfQtyInToProductPrice

  });

  // /// update count only
  // void updateCount(String count) {
  //   productCount = count;
  //   save();  // Hive save()
  // }
}
