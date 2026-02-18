class LoginUserVerifyOtpModel {
  int? error;
  User? user;
  String? accessToken;
  int? notify;

  LoginUserVerifyOtpModel(
      {this.error, this.user, this.accessToken, this.notify});

  LoginUserVerifyOtpModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
    notify = json['notify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['access_token'] = this.accessToken;
    data['notify'] = this.notify;
    return data;
  }
}

class User {
  int? id;
  Null? oldId;
  int? ownerId;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  Null? isAdmin;
  String? password;
  String? createdAt;
  String? updatedAt;
  int? role;
  Null? imageid;
  Null? address;
  String? phone;
  Null? nToken;
  Null? fcbToken;
  Null? active;
  String? typeReg;
  int? verifyOtp;
  String? otp;
  String? viewMetapos;
  String? viewOrders;
  String? viewReservationTable;
  String? viewTableBoking;
  String? viewSalesReport;
  int? restaurantId;
  Null? redeemAmount;
  Null? city;
  Null? state;
  Null? pincode;
  Null? type;
  Null? businessName;
  Null? tradingName;
  Null? businessAddress;
  Null? businessPhone;
  Null? businessEmail;
  Null? businessCity;
  Null? businessState;
  Null? abnNumber;
  Null? businessPincode;
  Null? openingBalance;
  int? creditLimit;
  Null? delivryPerson;
  Null? deliveryAddress;
  Null? deliveryCity;
  Null? deliveryState;
  Null? deliveryPhone;
  Null? deliberyPincode;
  Null? personPostion;
  Null? refName;
  Null? refAddress;
  Null? refPhone;
  Null? anniversy;
  Null? birthday;
  Null? customerTag;
  String? viewStaffReport;
  int? mainTerminal;
  String? viewDriverModule;
  String? altMobile;
  int? status;
  int? parentId;
  String? customerDiscount;
  String? customerDiscountType;
  String? deviceIp;
  String? appVersion;
  Null? optionalOne;
  Null? optionalTwo;
  Null? optionalThree;
  int? balance;
  int? loyaltyPoints;
  String? avatar;

  User(
      {this.id,
        this.oldId,
        this.ownerId,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.isAdmin,
        this.password,
        this.createdAt,
        this.updatedAt,
        this.role,
        this.imageid,
        this.address,
        this.phone,
        this.nToken,
        this.fcbToken,
        this.active,
        this.typeReg,
        this.verifyOtp,
        this.otp,
        this.viewMetapos,
        this.viewOrders,
        this.viewReservationTable,
        this.viewTableBoking,
        this.viewSalesReport,
        this.restaurantId,
        this.redeemAmount,
        this.city,
        this.state,
        this.pincode,
        this.type,
        this.businessName,
        this.tradingName,
        this.businessAddress,
        this.businessPhone,
        this.businessEmail,
        this.businessCity,
        this.businessState,
        this.abnNumber,
        this.businessPincode,
        this.openingBalance,
        this.creditLimit,
        this.delivryPerson,
        this.deliveryAddress,
        this.deliveryCity,
        this.deliveryState,
        this.deliveryPhone,
        this.deliberyPincode,
        this.personPostion,
        this.refName,
        this.refAddress,
        this.refPhone,
        this.anniversy,
        this.birthday,
        this.customerTag,
        this.viewStaffReport,
        this.mainTerminal,
        this.viewDriverModule,
        this.altMobile,
        this.status,
        this.parentId,
        this.customerDiscount,
        this.customerDiscountType,
        this.deviceIp,
        this.appVersion,
        this.optionalOne,
        this.optionalTwo,
        this.optionalThree,
        this.balance,
        this.loyaltyPoints,
        this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    oldId = json['old_id'];
    ownerId = json['owner_id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    isAdmin = json['is_admin'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    role = json['role'];
    imageid = json['imageid'];
    address = json['address'];
    phone = json['phone'];
    nToken = json['_token'];
    fcbToken = json['fcbToken'];
    active = json['active'];
    typeReg = json['typeReg'];
    verifyOtp = json['verify_otp'];
    otp = json['otp'];
    viewMetapos = json['view_metapos'];
    viewOrders = json['view_orders'];
    viewReservationTable = json['view_reservation_table'];
    viewTableBoking = json['view_table_boking'];
    viewSalesReport = json['view_sales_report'];
    restaurantId = json['restaurant_id'];
    redeemAmount = json['redeem_amount'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    type = json['type'];
    businessName = json['business_name'];
    tradingName = json['trading_name'];
    businessAddress = json['business_address'];
    businessPhone = json['business_phone'];
    businessEmail = json['business_email'];
    businessCity = json['business_city'];
    businessState = json['business_state'];
    abnNumber = json['abn_number'];
    businessPincode = json['business_pincode'];
    openingBalance = json['opening_balance'];
    creditLimit = json['credit_limit'];
    delivryPerson = json['delivry_person'];
    deliveryAddress = json['delivery_address'];
    deliveryCity = json['delivery_city'];
    deliveryState = json['delivery_state'];
    deliveryPhone = json['delivery_phone'];
    deliberyPincode = json['delibery_pincode'];
    personPostion = json['person_postion'];
    refName = json['ref_name'];
    refAddress = json['ref_address'];
    refPhone = json['ref_phone'];
    anniversy = json['anniversy'];
    birthday = json['birthday'];
    customerTag = json['customer_tag'];
    viewStaffReport = json['view_staff_report'];
    mainTerminal = json['main_terminal'];
    viewDriverModule = json['view_driver_module'];
    altMobile = json['altMobile'];
    status = json['status'];
    parentId = json['parent_id'];
    customerDiscount = json['customer_discount'];
    customerDiscountType = json['customer_discount_type'];
    deviceIp = json['device_ip'];
    appVersion = json['app_version'];
    optionalOne = json['optional_one'];
    optionalTwo = json['optional_two'];
    optionalThree = json['optional_three'];
    balance = json['balance'];
    loyaltyPoints = json['loyalty_points'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['old_id'] = this.oldId;
    data['owner_id'] = this.ownerId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['is_admin'] = this.isAdmin;
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['role'] = this.role;
    data['imageid'] = this.imageid;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['_token'] = this.nToken;
    data['fcbToken'] = this.fcbToken;
    data['active'] = this.active;
    data['typeReg'] = this.typeReg;
    data['verify_otp'] = this.verifyOtp;
    data['otp'] = this.otp;
    data['view_metapos'] = this.viewMetapos;
    data['view_orders'] = this.viewOrders;
    data['view_reservation_table'] = this.viewReservationTable;
    data['view_table_boking'] = this.viewTableBoking;
    data['view_sales_report'] = this.viewSalesReport;
    data['restaurant_id'] = this.restaurantId;
    data['redeem_amount'] = this.redeemAmount;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['type'] = this.type;
    data['business_name'] = this.businessName;
    data['trading_name'] = this.tradingName;
    data['business_address'] = this.businessAddress;
    data['business_phone'] = this.businessPhone;
    data['business_email'] = this.businessEmail;
    data['business_city'] = this.businessCity;
    data['business_state'] = this.businessState;
    data['abn_number'] = this.abnNumber;
    data['business_pincode'] = this.businessPincode;
    data['opening_balance'] = this.openingBalance;
    data['credit_limit'] = this.creditLimit;
    data['delivry_person'] = this.delivryPerson;
    data['delivery_address'] = this.deliveryAddress;
    data['delivery_city'] = this.deliveryCity;
    data['delivery_state'] = this.deliveryState;
    data['delivery_phone'] = this.deliveryPhone;
    data['delibery_pincode'] = this.deliberyPincode;
    data['person_postion'] = this.personPostion;
    data['ref_name'] = this.refName;
    data['ref_address'] = this.refAddress;
    data['ref_phone'] = this.refPhone;
    data['anniversy'] = this.anniversy;
    data['birthday'] = this.birthday;
    data['customer_tag'] = this.customerTag;
    data['view_staff_report'] = this.viewStaffReport;
    data['main_terminal'] = this.mainTerminal;
    data['view_driver_module'] = this.viewDriverModule;
    data['altMobile'] = this.altMobile;
    data['status'] = this.status;
    data['parent_id'] = this.parentId;
    data['customer_discount'] = this.customerDiscount;
    data['customer_discount_type'] = this.customerDiscountType;
    data['device_ip'] = this.deviceIp;
    data['app_version'] = this.appVersion;
    data['optional_one'] = this.optionalOne;
    data['optional_two'] = this.optionalTwo;
    data['optional_three'] = this.optionalThree;
    data['balance'] = this.balance;
    data['loyalty_points'] = this.loyaltyPoints;
    data['avatar'] = this.avatar;
    return data;
  }
}
