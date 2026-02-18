import 'package:hive/hive.dart';
import 'package:metapos_sync_order_online_ofline/model/category_model/CategoryListModel/CategoryListModel.dart';
part 'HalfAndHalfOrderHiveBoxModel.g.dart';

@HiveType(typeId: 13)
class HalfAndHalfHoldSingleOrderDBModel extends HiveObject {

  @HiveField(0)
  String productName ;

  @HiveField(1)
  int qty ;

  @HiveField(2)
  String productPrice ;

  @HiveField(3)
  String productId;

  @HiveField(4)
  String productTotalPrice;

  @HiveField(5)
  String grandTotalPrice;

  @HiveField(6)
  List<CatAddonsDataArray> firstHalfAddonData;

  @HiveField(7)
  List<CatAddonsDataArray> secondHalfAddonData;

  @HiveField(8)
  List<String> firstHalfRemoveData;

  @HiveField(9)
  List<String> secondHalfSelectedRemoveItems;

  @HiveField(10)
  List<String> secondHalfRemoveData;

  @HiveField(11)
  String productDesc;


  HalfAndHalfHoldSingleOrderDBModel({
    required this.productPrice,
    required this.productName,
    required this.productTotalPrice,
    required this.productId,
    required this.secondHalfSelectedRemoveItems,
    required this.grandTotalPrice,
    required this.qty,
    required this.secondHalfRemoveData,
    required this.secondHalfAddonData,
    required this.firstHalfRemoveData,
    required this.firstHalfAddonData,
    required this.productDesc
  });
}
