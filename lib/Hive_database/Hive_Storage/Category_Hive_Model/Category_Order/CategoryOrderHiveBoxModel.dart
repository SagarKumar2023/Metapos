import 'package:hive/hive.dart';
part 'CategoryOrderHiveBoxModel.g.dart';

@HiveType(typeId: 12)
class CategoryHoldSingleOrderModel extends HiveObject {
  @HiveField(0)
  int productId;
  @HiveField(1)
  String productName;
  @HiveField(2)
  String productPrice;
  @HiveField(3)
  String variantOption;
  @HiveField(4)
  String productDesc;
  @HiveField(5)
  String productTotalPrice ;
  @HiveField(6)
  final double grandTotalPrice ;
  @HiveField(7)
  final int qty ;


  CategoryHoldSingleOrderModel({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productTotalPrice,
    required this.qty,
    required this.productDesc,
    required this.variantOption,
    required this.grandTotalPrice
  });
}
