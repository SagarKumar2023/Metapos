// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_order_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubmitOrderResponseWithDBAdapter
    extends TypeAdapter<SubmitOrderResponseWithDB> {
  @override
  final int typeId = 36;

  @override
  SubmitOrderResponseWithDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubmitOrderResponseWithDB(
      error: fields[0] as String?,
      currency: fields[1] as String?,
      data: fields[2] as dynamic,
      orderid: fields[3] as String?,
      order: fields[4] as Order?,
      orderdetails: (fields[5] as List).cast<Orderdetail>(),
      fee: fields[6] as String?,
      percent: fields[7] as int?,
      users: fields[8] as Users?,
    );
  }

  @override
  void write(BinaryWriter writer, SubmitOrderResponseWithDB obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.error)
      ..writeByte(1)
      ..write(obj.currency)
      ..writeByte(2)
      ..write(obj.data)
      ..writeByte(3)
      ..write(obj.orderid)
      ..writeByte(4)
      ..write(obj.order)
      ..writeByte(5)
      ..write(obj.orderdetails)
      ..writeByte(6)
      ..write(obj.fee)
      ..writeByte(7)
      ..write(obj.percent)
      ..writeByte(8)
      ..write(obj.users);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubmitOrderResponseWithDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrderAdapter extends TypeAdapter<Order> {
  @override
  final int typeId = 37;

  @override
  Order read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Order(
      id: fields[0] as int?,
      createdAt: fields[1] as DateTime?,
      updatedAt: fields[2] as DateTime?,
      user: fields[3] as int?,
      driver: fields[4] as int?,
      status: fields[5] as int?,
      pstatus: fields[6] as String?,
      tax: fields[7] as int?,
      hint: fields[8] as String?,
      active: fields[9] as int?,
      restaurant: fields[10] as int?,
      method: fields[11] as String?,
      total: fields[12] as String?,
      fee: fields[13] as String?,
      send: fields[14] as int?,
      address: fields[15] as String?,
      phone: fields[16] as String?,
      comments: fields[17] as String?,
      orderType: fields[18] as String?,
      lat: fields[19] as String?,
      lng: fields[20] as String?,
      percent: fields[21] as int?,
      curbsidePickup: fields[22] as String?,
      arrived: fields[23] as dynamic,
      couponName: fields[24] as String?,
      tableNo: fields[25] as String?,
      subOrderType: fields[26] as String?,
      isHold: fields[27] as String?,
      couponDiscount: fields[28] as String?,
      discountType: fields[29] as String?,
      customExtraPrice: fields[30] as String?,
      customExtraDescription: fields[31] as String?,
      customDiscount: fields[32] as String?,
      orderDate: fields[33] as DateTime?,
      orderBookingSlotId: fields[34] as int?,
      orderBookingSlot: fields[35] as dynamic,
      perkm: fields[36] as int?,
      view: fields[37] as String?,
      dueAmount: fields[38] as int?,
      reservationId: fields[40] as int?,
      mansaway: fields[41] as int?,
      peopleNo: fields[42] as int?,
      systemUserId: fields[43] as int?,
      tempId: fields[44] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Order obj) {
    writer
      ..writeByte(44)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.updatedAt)
      ..writeByte(3)
      ..write(obj.user)
      ..writeByte(4)
      ..write(obj.driver)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.pstatus)
      ..writeByte(7)
      ..write(obj.tax)
      ..writeByte(8)
      ..write(obj.hint)
      ..writeByte(9)
      ..write(obj.active)
      ..writeByte(10)
      ..write(obj.restaurant)
      ..writeByte(11)
      ..write(obj.method)
      ..writeByte(12)
      ..write(obj.total)
      ..writeByte(13)
      ..write(obj.fee)
      ..writeByte(14)
      ..write(obj.send)
      ..writeByte(15)
      ..write(obj.address)
      ..writeByte(16)
      ..write(obj.phone)
      ..writeByte(17)
      ..write(obj.comments)
      ..writeByte(18)
      ..write(obj.orderType)
      ..writeByte(19)
      ..write(obj.lat)
      ..writeByte(20)
      ..write(obj.lng)
      ..writeByte(21)
      ..write(obj.percent)
      ..writeByte(22)
      ..write(obj.curbsidePickup)
      ..writeByte(23)
      ..write(obj.arrived)
      ..writeByte(24)
      ..write(obj.couponName)
      ..writeByte(25)
      ..write(obj.tableNo)
      ..writeByte(26)
      ..write(obj.subOrderType)
      ..writeByte(27)
      ..write(obj.isHold)
      ..writeByte(28)
      ..write(obj.couponDiscount)
      ..writeByte(29)
      ..write(obj.discountType)
      ..writeByte(30)
      ..write(obj.customExtraPrice)
      ..writeByte(31)
      ..write(obj.customExtraDescription)
      ..writeByte(32)
      ..write(obj.customDiscount)
      ..writeByte(33)
      ..write(obj.orderDate)
      ..writeByte(34)
      ..write(obj.orderBookingSlotId)
      ..writeByte(35)
      ..write(obj.orderBookingSlot)
      ..writeByte(36)
      ..write(obj.perkm)
      ..writeByte(37)
      ..write(obj.view)
      ..writeByte(38)
      ..write(obj.dueAmount)
      ..writeByte(40)
      ..write(obj.reservationId)
      ..writeByte(41)
      ..write(obj.mansaway)
      ..writeByte(42)
      ..write(obj.peopleNo)
      ..writeByte(43)
      ..write(obj.systemUserId)
      ..writeByte(44)
      ..write(obj.tempId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrderdetailAdapter extends TypeAdapter<Orderdetail> {
  @override
  final int typeId = 38;

  @override
  Orderdetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Orderdetail(
      id: fields[0] as String?,
      food: fields[1] as String?,
      tags: fields[2] as String?,
      notes: fields[3] as String?,
      type: fields[4] as String?,
      typeTwo: fields[5] as String?,
      otherVariantFood: fields[6] as String?,
      count: fields[7] as String?,
      foodprice: fields[8] as String?,
      extras: fields[9] as String?,
      extrascount: fields[10] as String?,
      extrasprice: fields[11] as String?,
      foodid: fields[12] as String?,
      extrasid: fields[13] as String?,
      image: fields[14] as String?,
      variantId: fields[15] as String?,
      otherVariantId: fields[16] as String?,
      containsAvalable: fields[17] as String?,
      addonsAvalable: fields[18] as String?,
      contains: (fields[19] as List).cast<dynamic>(),
      containsNotAdded: (fields[20] as List).cast<dynamic>(),
      addons: (fields[21] as List).cast<dynamic>(),
      catId: fields[22] as int?,
      catName: fields[23] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Orderdetail obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.food)
      ..writeByte(2)
      ..write(obj.tags)
      ..writeByte(3)
      ..write(obj.notes)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.typeTwo)
      ..writeByte(6)
      ..write(obj.otherVariantFood)
      ..writeByte(7)
      ..write(obj.count)
      ..writeByte(8)
      ..write(obj.foodprice)
      ..writeByte(9)
      ..write(obj.extras)
      ..writeByte(10)
      ..write(obj.extrascount)
      ..writeByte(11)
      ..write(obj.extrasprice)
      ..writeByte(12)
      ..write(obj.foodid)
      ..writeByte(13)
      ..write(obj.extrasid)
      ..writeByte(14)
      ..write(obj.image)
      ..writeByte(15)
      ..write(obj.variantId)
      ..writeByte(16)
      ..write(obj.otherVariantId)
      ..writeByte(17)
      ..write(obj.containsAvalable)
      ..writeByte(18)
      ..write(obj.addonsAvalable)
      ..writeByte(19)
      ..write(obj.contains)
      ..writeByte(20)
      ..write(obj.containsNotAdded)
      ..writeByte(21)
      ..write(obj.addons)
      ..writeByte(22)
      ..write(obj.catId)
      ..writeByte(23)
      ..write(obj.catName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderdetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UsersAdapter extends TypeAdapter<Users> {
  @override
  final int typeId = 39;

  @override
  Users read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Users(
      id: fields[0] as int?,
      name: fields[1] as String?,
      email: fields[2] as String?,
      emailVerifiedAt: fields[3] as dynamic,
      isAdmin: fields[4] as dynamic,
      password: fields[5] as String?,
      rememberToken: fields[6] as dynamic,
      createdAt: fields[7] as dynamic,
      updatedAt: fields[8] as dynamic,
      role: fields[9] as int?,
      imageid: fields[10] as int?,
      address: fields[11] as dynamic,
      phone: fields[12] as String?,
      token: fields[13] as dynamic,
      fcbToken: fields[14] as dynamic,
      active: fields[15] as dynamic,
      typeReg: fields[16] as String?,
      verifyOtp: fields[17] as int?,
      otp: fields[18] as dynamic,
      viewMetapos: fields[19] as String?,
      viewOrders: fields[20] as String?,
      viewReservationTable: fields[21] as String?,
      viewTableBoking: fields[22] as String?,
      viewSalesReport: fields[23] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Users obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.emailVerifiedAt)
      ..writeByte(4)
      ..write(obj.isAdmin)
      ..writeByte(5)
      ..write(obj.password)
      ..writeByte(6)
      ..write(obj.rememberToken)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt)
      ..writeByte(9)
      ..write(obj.role)
      ..writeByte(10)
      ..write(obj.imageid)
      ..writeByte(11)
      ..write(obj.address)
      ..writeByte(12)
      ..write(obj.phone)
      ..writeByte(13)
      ..write(obj.token)
      ..writeByte(14)
      ..write(obj.fcbToken)
      ..writeByte(15)
      ..write(obj.active)
      ..writeByte(16)
      ..write(obj.typeReg)
      ..writeByte(17)
      ..write(obj.verifyOtp)
      ..writeByte(18)
      ..write(obj.otp)
      ..writeByte(19)
      ..write(obj.viewMetapos)
      ..writeByte(20)
      ..write(obj.viewOrders)
      ..writeByte(21)
      ..write(obj.viewReservationTable)
      ..writeByte(22)
      ..write(obj.viewTableBoking)
      ..writeByte(23)
      ..write(obj.viewSalesReport);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
