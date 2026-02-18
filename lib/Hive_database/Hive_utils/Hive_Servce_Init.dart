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
import 'package:metapos_sync_order_online_ofline/model/category_model/CategoryListModel/CategoryListModel.dart';
import 'package:metapos_sync_order_online_ofline/model/get_product_details_model/getProductDetailsModel.dart';
import 'package:hive/hive.dart';
import 'package:metapos_sync_order_online_ofline/model/submit_order_model/submit_order_model.dart';
import 'package:path_provider/path_provider.dart';
import 'HiveBoxName.dart';

class HiveServiceInit {
  static Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    //----------------------------------- Register Adapters -----------------------------------

    /// For Practice

    Hive.registerAdapter(ChatMessageModelAdapter());
    Hive.registerAdapter(UserChatListModelAdapter());

    //----------------------------------- Add To Cart -----------------------------------//

    Hive.registerAdapter(CategoryAddToCartDBModelAdapter());
    Hive.registerAdapter(HalfAndHalfAddToCartDBModelAdapter());
    Hive.registerAdapter(DealsAddToCartDBModelAdapter());
    Hive.registerAdapter(SpecialDealsAddToCartDBModelAdapter());

    //----------------------------------- Order Adapters -----------------------------------//

    Hive.registerAdapter(CategoryHoldSingleOrderModelAdapter());
    Hive.registerAdapter(CategoryHoldMultipleOrderDBAdapter());
    Hive.registerAdapter(HalfAndHalfHoldSingleOrderDBModelAdapter());
    Hive.registerAdapter(HalfAndHalfHoldMultipleOrderDBModelAdapter());
    Hive.registerAdapter(DealsHoldSingleOrderListDBModelAdapter());
    Hive.registerAdapter(SpecialDealsHoldSingleOrderListDBModelAdapter());

    //------------------------------ Get Category Model Adapter ----------------------------//

    Hive.registerAdapter(GetCategoryModelWithDBAdapter());
    Hive.registerAdapter(CatDataAdapter());
    Hive.registerAdapter(CatSubCategoryAdapter());
    Hive.registerAdapter(CatOtherDataAdapter());
    Hive.registerAdapter(CatSubCategoryNewAdapter());
    Hive.registerAdapter(CatOtherDataFoodListAdapter());
    Hive.registerAdapter(CatOtherDataFoodListWithDetailsAdapter());
    Hive.registerAdapter(CatComboDataAdapter());
    Hive.registerAdapter(CatCategoryListAdapter());
    Hive.registerAdapter(CatHalfNHalfDataAdapter());
    Hive.registerAdapter(CatHalfNHalfFoodListAdapter());
    Hive.registerAdapter(CatDealDataListAdapter());
    Hive.registerAdapter(CatDealDataAdapter());
    Hive.registerAdapter(CatDealDataFoodListAdapter());
    Hive.registerAdapter(CatSpecialDealDataAdapter());
    Hive.registerAdapter(CatSpecialDealDataFoodListAdapter());
    Hive.registerAdapter(CatSpecialDealDataListAdapter());
    Hive.registerAdapter(CatVariantDataArrayAdapter());
    Hive.registerAdapter(CatVariantDetailAdapter());
    Hive.registerAdapter(CatAddonsDataArrayAdapter());

    //-------------- GetProductDetailsWithDBModel Adopter -----------------------------------//

    Hive.registerAdapter(GetProductDetailsWithDBModelAdapter());
    Hive.registerAdapter(GetFoodListProductDetailsDataAdapter());
    Hive.registerAdapter(GetFoodListVariantDetailAdapter());
    Hive.registerAdapter(GetFoodListVariantDataArrayAdapter());
    Hive.registerAdapter(GetFoodListAddonsDataArrayAdapter());

    //---------------------- SubmitOrderResponseWithDB  Adopter -----------------------------------//

    Hive.registerAdapter(SubmitOrderResponseWithDBAdapter());
    Hive.registerAdapter(OrderAdapter());
    Hive.registerAdapter(OrderdetailAdapter());
    Hive.registerAdapter(UsersAdapter());


    //----------------------------------- Open Boxes -----------------------------------//

    await Hive.openBox<GetFoodListVariantDetail>(HiveBoxName.productCartBox);
    await Hive.openBox<GetFoodListVariantDetail>(HiveBoxName.productOrderBox);
    await Hive.openBox<GetFoodListProductDetailsData>(HiveBoxName.productDetailDataBox);
    await Hive.openBox<GetFoodListVariantDetail>(HiveBoxName.variantDetailBox);
    await Hive.openBox<GetFoodListVariantDataArray>(HiveBoxName.addonsDataArrayBox);
    await Hive.openBox<ChatMessageModel>(HiveBoxName.chatMessageBox);
    await Hive.openBox<UserChatListModel>(HiveBoxName.userChatListBox);

    //------------------------ API RESPONSE Open box -----------------------------------//

    // await Hive.openBox<CategoryModel>(HiveBoxName.categoryModelHiveBox);
    await Hive.openBox<GetCategoryModelWithDB>(HiveBoxName.getCategoryResponseDB);
    await Hive.openBox<GetProductDetailsWithDBModel>(HiveBoxName.getProductDetailsDB);
    await Hive.openBox<SubmitOrderResponseWithDB>(HiveBoxName.submitOrderDB);

    //------------------------- Add To Cart Open Boxes -----------------------------------//

    await Hive.openBox<CategoryAddToCartDBModel>(HiveBoxName.categoryAddToCartDB);
    await Hive.openBox<HalfAndHalfAddToCartDBModel>(HiveBoxName.halfAndHalfAddToCartDB);
    await Hive.openBox<DealsAddToCartDBModel>(HiveBoxName.dealsAddToCartDB);
    await Hive.openBox<SpecialDealsAddToCartDBModel>(HiveBoxName.specialDealsAddToCartDB);

    //-----------------------------------Order Open Boxes -----------------------------------//

    await Hive.openBox<CategoryHoldSingleOrderModel>(HiveBoxName.categoryHoldSingleOrderListDB);
    await Hive.openBox<CategoryHoldMultipleOrderDB>(HiveBoxName.categoryHoldMultipleOrderDB,);
    await Hive.openBox<HalfAndHalfHoldSingleOrderDBModel>(HiveBoxName.halfAndHalfHoldSingleOrderListDB);
    await Hive.openBox<HalfAndHalfHoldMultipleOrderDBModel>(HiveBoxName.halfAndHalfHoldMultipleOrderDB,);
    await Hive.openBox<DealsHoldSingleOrderListDBModel>(HiveBoxName.dealsHoldSingleOrderListDB);
    await Hive.openBox<SpecialDealsHoldSingleOrderListDBModel>(HiveBoxName.specialDealsHoldSingleOrderListDB);

  }
}
