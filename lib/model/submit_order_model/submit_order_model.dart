import 'package:hive/hive.dart';
part 'submit_order_model.g.dart';
@HiveType(typeId:36)
class SubmitOrderResponseWithDB extends HiveObject {
  SubmitOrderResponseWithDB({
    required this.error,
    required this.currency,
    required this.data,
    required this.orderid,
    required this.order,
    required this.orderdetails,
    required this.fee,
    required this.percent,
    required this.users,
  });
  @HiveField(0)
  final String? error;
  @HiveField(1)
  final String? currency;
  @HiveField(2)
  final dynamic data;
  @HiveField(3)
  final String? orderid;
  @HiveField(4)
  final Order? order;
  @HiveField(5)
  final List<Orderdetail> orderdetails;
  @HiveField(6)
  final String? fee;
  @HiveField(7)
  final int? percent;
  @HiveField(8)
  final Users? users;

  factory SubmitOrderResponseWithDB.fromJson(Map<String, dynamic> json){
    return SubmitOrderResponseWithDB(
      error: json["error"],
      currency: json["currency"],
      data: json["data"],
      orderid: json["orderid"],
      order: json["order"] == null ? null : Order.fromJson(json["order"]),
      orderdetails: json["orderdetails"] == null ? [] : List<Orderdetail>.from(json["orderdetails"]!.map((x) => Orderdetail.fromJson(x))),
      fee: json["fee"],
      percent: json["percent"] == null
          ? 0
          : int.tryParse(json["percent"].toString()) ?? 0,
      users: json["users"] == null ? null : Users.fromJson(json["users"]),
    );
  }

}

@HiveType(typeId:37)
class Order extends HiveObject {
  Order({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.driver,
    required this.status,
    required this.pstatus,
    required this.tax,
    required this.hint,
    required this.active,
    required this.restaurant,
    required this.method,
    required this.total,
    required this.fee,
    required this.send,
    required this.address,
    required this.phone,
    required this.comments,
    required this.orderType,
    required this.lat,
    required this.lng,
    required this.percent,
    required this.curbsidePickup,
    required this.arrived,
    required this.couponName,
    required this.tableNo,
    required this.subOrderType,
    required this.isHold,
    required this.couponDiscount,
    required this.discountType,
    required this.customExtraPrice,
    required this.customExtraDescription,
    required this.customDiscount,
    required this.orderDate,
    required this.orderBookingSlotId,
    required this.orderBookingSlot,
    required this.perkm,
    required this.view,
    required this.dueAmount,
    required this.reservationId,
    required this.mansaway,
    required this.peopleNo,
    required this.systemUserId,
    required this.tempId,
  });

  @HiveField(0)
  final int? id;
  @HiveField(1)
  final DateTime? createdAt;
  @HiveField(2)
  final DateTime? updatedAt;
  @HiveField(3)
  final int? user;
  @HiveField(4)
  final int? driver;
  @HiveField(5)
  final int? status;
  @HiveField(6)
  final String? pstatus;
  @HiveField(7)
  final int? tax;
  @HiveField(8)
  final String? hint;
  @HiveField(9)
  final int? active;
  @HiveField(10)
  final int? restaurant;
  @HiveField(11)
  final String? method;
  @HiveField(12)
  final String? total;
  @HiveField(13)
  final String? fee;
  @HiveField(14)
  final int? send;
  @HiveField(15)
  final String? address;
  @HiveField(16)
  final String? phone;
  @HiveField(17)
  final String? comments;
  @HiveField(18)
  final String? orderType;
  @HiveField(19)
  final String? lat;
  @HiveField(20)
  final String? lng;
  @HiveField(21)
  final int? percent;
  @HiveField(22)
  final String? curbsidePickup;
  @HiveField(23)
  final dynamic arrived;
  @HiveField(24)
  final String? couponName;
  @HiveField(25)
  final String? tableNo;
  @HiveField(26)
  final String? subOrderType;
  @HiveField(27)
  final String? isHold;
  @HiveField(28)
  final String? couponDiscount;
  @HiveField(29)
  final String? discountType;
  @HiveField(30)
  final String? customExtraPrice;
  @HiveField(31)
  final String? customExtraDescription;
  @HiveField(32)
  final String? customDiscount;
  @HiveField(33)
  final DateTime? orderDate;
  @HiveField(34)
  final int? orderBookingSlotId;
  @HiveField(35)
  final dynamic orderBookingSlot;
  @HiveField(36)
  final int? perkm;
  @HiveField(37)
  final String? view;
  @HiveField(38)
  final int? dueAmount;
  @HiveField(40)
  final int? reservationId;
  @HiveField(41)
  final int? mansaway;
  @HiveField(42)
  final int? peopleNo;
  @HiveField(43)
  final int? systemUserId;
  @HiveField(44)
  final int? tempId;

  factory Order.fromJson(Map<String, dynamic> json){
    return Order(
      id: json["id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      user: json["user"],
      driver: json["driver"],
      status: json["status"],
      pstatus: json["pstatus"],
      tax: json["tax"],
      hint: json["hint"],
      active: json["active"],
      restaurant: json["restaurant"],
      method: json["method"],
      total: json["total"],
      fee: json["fee"],
      send: json["send"],
      address: json["address"],
      phone: json["phone"],
      comments: json["comments"],
      orderType: json["order_type"],
      lat: json["lat"],
      lng: json["lng"],
      percent: json["percent"],
      curbsidePickup: json["curbsidePickup"],
      arrived: json["arrived"],
      couponName: json["couponName"],
      tableNo: json["table_no"],
      subOrderType: json["sub_order_type"],
      isHold: json["is_hold"],
      couponDiscount: json["couponDiscount"],
      discountType: json["discount_type"],
      customExtraPrice: json["customExtraPrice"],
      customExtraDescription: json["customExtraDescription"],
      customDiscount: json["customDiscount"],
      orderDate: DateTime.tryParse(json["order_date"] ?? ""),
      orderBookingSlotId: json["order_booking_slot_id"],
      orderBookingSlot: json["order_booking_slot"],
      perkm: json["perkm"],
      view: json["view"],
      dueAmount: json["due_amount"],
      reservationId: json["reservation_id"],
      mansaway: json["mansaway"],
      peopleNo: json["people_no"],
      systemUserId: json["system_user_id"],
      tempId: json["temp_id"],
    );
  }

}

@HiveType(typeId:38)
class Orderdetail extends HiveObject {
  Orderdetail({
    required this.id,
    required this.food,
    required this.tags,
    required this.notes,
    required this.type,
    required this.typeTwo,
    required this.otherVariantFood,
    required this.count,
    required this.foodprice,
    required this.extras,
    required this.extrascount,
    required this.extrasprice,
    required this.foodid,
    required this.extrasid,
    required this.image,
    required this.variantId,
    required this.otherVariantId,
    required this.containsAvalable,
    required this.addonsAvalable,
    required this.contains,
    required this.containsNotAdded,
    required this.addons,
    required this.catId,
    required this.catName,
  });

  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? food;
  @HiveField(2)
  final String? tags;
  @HiveField(3)
  final String? notes;
  @HiveField(4)
  final String? type;
  @HiveField(5)
  final String? typeTwo;
  @HiveField(6)
  final String? otherVariantFood;
  @HiveField(7)
  final String? count;
  @HiveField(8)
  final String? foodprice;
  @HiveField(9)
  final String? extras;
  @HiveField(10)
  final String? extrascount;
  @HiveField(11)
  final String? extrasprice;
  @HiveField(12)
  final String? foodid;
  @HiveField(13)
  final String? extrasid;
  @HiveField(14)
  final String? image;
  @HiveField(15)
  final String? variantId;
  @HiveField(16)
  final String? otherVariantId;
  @HiveField(17)
  final String? containsAvalable;
  @HiveField(18)
  final String? addonsAvalable;
  @HiveField(19)
  final List<dynamic> contains;
  @HiveField(20)
  final List<dynamic> containsNotAdded;
  @HiveField(21)
  final List<dynamic> addons;
  @HiveField(22)
  final int? catId;
  @HiveField(23)
  final String? catName;

  factory Orderdetail.fromJson(Map<String, dynamic> json){
    return Orderdetail(
      id: json["id"],
      food: json["food"],
      tags: json["tags"],
      notes: json["notes"],
      type: json["type"],
      typeTwo: json["type_two"],
      otherVariantFood: json["other_variant_food"],
      count: json["count"],
      foodprice: json["foodprice"],
      extras: json["extras"],
      extrascount: json["extrascount"],
      extrasprice: json["extrasprice"],
      foodid: json["foodid"],
      extrasid: json["extrasid"],
      image: json["image"],
      variantId: json["variant_id"],
      otherVariantId: json["other_variant_id"],
      containsAvalable: json["contains_avalable"],
      addonsAvalable: json["addons_avalable"],
      contains: json["contains"] == null ? [] : List<dynamic>.from(json["contains"]!.map((x) => x)),
      containsNotAdded: json["contains_not_added"] == null ? [] : List<dynamic>.from(json["contains_not_added"]!.map((x) => x)),
      addons: json["addons"] == null ? [] : List<dynamic>.from(json["addons"]!.map((x) => x)),
      // catId: json["cat_id"]??0,
      catId: json["cat_id"] == null
          ? 0
          : int.tryParse(json["cat_id"].toString()) ?? 0,
      catName: json["cat_name"]??"",
    );
  }
}

@HiveType(typeId:39)
class Users extends HiveObject{
  Users({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.isAdmin,
    required this.password,
    required this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
    required this.imageid,
    required this.address,
    required this.phone,
    required this.token,
    required this.fcbToken,
    required this.active,
    required this.typeReg,
    required this.verifyOtp,
    required this.otp,
    required this.viewMetapos,
    required this.viewOrders,
    required this.viewReservationTable,
    required this.viewTableBoking,
    required this.viewSalesReport,
  });

  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final dynamic emailVerifiedAt;
  @HiveField(4)
  final dynamic isAdmin;
  @HiveField(5)
  final String? password;
  @HiveField(6)
  final dynamic rememberToken;
  @HiveField(7)
  final dynamic createdAt;
  @HiveField(8)
  final dynamic updatedAt;
  @HiveField(9)
  final int? role;
  @HiveField(10)
  final int? imageid;
  @HiveField(11)
  final dynamic address;
  @HiveField(12)
  final String? phone;
  @HiveField(13)
  final dynamic token;
  @HiveField(14)
  final dynamic fcbToken;
  @HiveField(15)
  final dynamic active;
  @HiveField(16)
  final String? typeReg;
  @HiveField(17)
  final int? verifyOtp;
  @HiveField(18)
  final dynamic otp;
  @HiveField(19)
  final String? viewMetapos;
  @HiveField(20)
  final String? viewOrders;
  @HiveField(21)
  final String? viewReservationTable;
  @HiveField(22)
  final String? viewTableBoking;
  @HiveField(23)
  final String? viewSalesReport;

  factory Users.fromJson(Map<String, dynamic> json){
    return Users(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      emailVerifiedAt: json["email_verified_at"],
      isAdmin: json["is_admin"],
      password: json["password"],
      rememberToken: json["remember_token"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      role: json["role"],
      imageid: json["imageid"],
      address: json["address"],
      phone: json["phone"],
      token: json["_token"],
      fcbToken: json["fcbToken"],
      active: json["active"],
      typeReg: json["typeReg"],
      verifyOtp: json["verify_otp"],
      otp: json["otp"],
      viewMetapos: json["view_metapos"],
      viewOrders: json["view_orders"],
      viewReservationTable: json["view_reservation_table"],
      viewTableBoking: json["view_table_boking"],
      viewSalesReport: json["view_sales_report"],
    );
  }

}
