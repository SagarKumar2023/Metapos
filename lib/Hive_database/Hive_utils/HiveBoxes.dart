import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/Category_Hive_Model/Category_Add_To_Cart/CategoryAddToCartHiveBoxModel.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/Category_Hive_Model/Category_Hold_Multiple_order_model/Category_Hold_Multiple_order_model.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/Deals_Hive_Model/Deals_Order/DealsOrderHiveBoxModel.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/HalfAndHalf_Hive_Model/HalfAndHalf_Hold_Multiple_order_model/HalfAndHalf_Hold_Multiple_order_model.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/HalfAndHalf_Hive_Model/HalfAndHalf_Order/HalfAndHalfOrderHiveBoxModel.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/Specials_Deals_Hive_Model/Specials_Deals_Order/SpecialDealsOrderHiveBoxModel.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/Deals_Hive_Model/Deals_Add_To_Cart/DealsAddToCartHiveBoxModel.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/HalfAndHalf_Hive_Model/HalfAndHalf_Add_To_Cart/HalfAndHalfAddToCartHiveBoxModel.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/Specials_Deals_Hive_Model/SpecialDealsAddToCartHiveBoxModel.dart';
import 'package:metapos_sync_order_online_ofline/Hive_database/Hive_Storage/Category_Hive_Model/Category_Order/CategoryOrderHiveBoxModel.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/SocketService/chatModel/ChatMessage.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/SocketService/chatModel/userChatListModel.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/hive_database_practice/Hive_model/note_model.dart';
import 'package:metapos_sync_order_online_ofline/for_practice/hive_database_practice/Hive_model/user_model.dart';
import 'package:metapos_sync_order_online_ofline/model/category_model/CategoryListModel/CategoryListModel.dart';
import 'package:metapos_sync_order_online_ofline/model/get_product_details_model/getProductDetailsModel.dart';
import 'package:hive/hive.dart';
import 'package:metapos_sync_order_online_ofline/model/submit_order_model/submit_order_model.dart';
import 'HiveBoxName.dart';

class HiveBoxes{
  //----------------------------------- I DID NOT USED BOXES IN MY APP-----------------------------------
  static Box<GetFoodListProductDetailsData> productDetailDataBox() =>Hive.box<GetFoodListProductDetailsData>(HiveBoxName.productDetailDataBox);
  static Box<GetFoodListVariantDetail> variantDetailBox() =>Hive.box<GetFoodListVariantDetail>(HiveBoxName.variantDetailBox);
  static Box<GetFoodListAddonsDataArray> addonsDataArrayBox() =>Hive.box<GetFoodListAddonsDataArray>(HiveBoxName.addonsDataArrayBox);

  //----------------------------------- FOR PRACTICES -----------------------------------

  static Box<NotesModel> noteBox() =>Hive.box<NotesModel>(HiveBoxName.noteBox);
  static Box<UserModel> userBox() =>Hive.box<UserModel>(HiveBoxName.userBox);
  static Box<GetFoodListVariantDetail> productCartBox() =>Hive.box<GetFoodListVariantDetail>(HiveBoxName.productCartBox);
  static Box<GetFoodListVariantDetail> productOrderBox() =>Hive.box<GetFoodListVariantDetail>(HiveBoxName.productOrderBox);
  static Box<ChatMessageModel> chatMessageBox() =>Hive.box<ChatMessageModel>(HiveBoxName.chatMessageBox);
  static Box<UserChatListModel> userChatListBox() =>Hive.box<UserChatListModel>(HiveBoxName.userChatListBox);

  //-----  WE WILL FOOD ADD TO CART AND WE WILL ORDER SINGLE AND MULTIPLE FOODS -------------

  static Box<GetCategoryModelWithDB> getCategoryResponseDB() =>Hive.box<GetCategoryModelWithDB>(HiveBoxName.getCategoryResponseDB);
  static Box<CategoryAddToCartDBModel> categoryAddToCartDB() => Hive.box<CategoryAddToCartDBModel>(HiveBoxName.categoryAddToCartDB);
  static Box<CategoryHoldSingleOrderModel> categoryHoldSingleOrderListDB() =>Hive.box<CategoryHoldSingleOrderModel>(HiveBoxName.categoryHoldSingleOrderListDB);
  static Box<CategoryHoldMultipleOrderDB> categoryHoldMultipleOrderDB() => Hive.box<CategoryHoldMultipleOrderDB>(HiveBoxName.categoryHoldMultipleOrderDB);

  static Box<HalfAndHalfAddToCartDBModel> halfAndHalfAddToCartDB() =>Hive.box<HalfAndHalfAddToCartDBModel>(HiveBoxName.halfAndHalfAddToCartDB);
  static Box<HalfAndHalfHoldSingleOrderDBModel> halfAndHalfHoldSingleOrderListDB() =>Hive.box<HalfAndHalfHoldSingleOrderDBModel>(HiveBoxName.halfAndHalfHoldSingleOrderListDB);
  static Box<HalfAndHalfHoldMultipleOrderDBModel> halfAndHalfHoldMultipleOrderDB() => Hive.box<HalfAndHalfHoldMultipleOrderDBModel>(HiveBoxName.halfAndHalfHoldMultipleOrderDB);

  static Box<DealsAddToCartDBModel> dealsAddToCartDB() =>Hive.box<DealsAddToCartDBModel>(HiveBoxName.dealsAddToCartDB);
  static Box<DealsHoldSingleOrderListDBModel> dealsHoldSingleOrderListDB() =>Hive.box<DealsHoldSingleOrderListDBModel>(HiveBoxName.dealsHoldSingleOrderListDB);

  static Box<SpecialDealsAddToCartDBModel> specialDealsAddToCartDB() =>Hive.box<SpecialDealsAddToCartDBModel>(HiveBoxName.specialDealsAddToCartDB);
  static Box<SpecialDealsHoldSingleOrderListDBModel> specialDealsHoldSingleOrderListDB() =>Hive.box<SpecialDealsHoldSingleOrderListDBModel>(HiveBoxName.specialDealsHoldSingleOrderListDB);

  // static Box<CategoryModel> categoryModelHiveBox() =>Hive.box<CategoryModel>(HiveBoxName.categoryModelHiveBox);
  static Box<GetProductDetailsWithDBModel> getProductDetailsDB() =>Hive.box<GetProductDetailsWithDBModel>(HiveBoxName.getProductDetailsDB);
  static Box<SubmitOrderResponseWithDB> submitOrderDB() =>Hive.box<SubmitOrderResponseWithDB>(HiveBoxName.submitOrderDB);

}
