// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoryListModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetCategoryModelWithDBAdapter
    extends TypeAdapter<GetCategoryModelWithDB> {
  @override
  final int typeId = 16;

  @override
  GetCategoryModelWithDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetCategoryModelWithDB(
      error: fields[0] as String,
      message: fields[1] as String,
      data: (fields[2] as List).cast<CatData>(),
      otherData: (fields[3] as List).cast<CatOtherData>(),
      comboData: (fields[4] as List).cast<CatComboData>(),
      halfNHalfData: (fields[5] as List).cast<CatHalfNHalfData>(),
      dealDataList: (fields[6] as List).cast<CatDealDataList>(),
      specialDealDataList: (fields[7] as List).cast<CatSpecialDealDataList>(),
    );
  }

  @override
  void write(BinaryWriter writer, GetCategoryModelWithDB obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.error)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.data)
      ..writeByte(3)
      ..write(obj.otherData)
      ..writeByte(4)
      ..write(obj.comboData)
      ..writeByte(5)
      ..write(obj.halfNHalfData)
      ..writeByte(6)
      ..write(obj.dealDataList)
      ..writeByte(7)
      ..write(obj.specialDealDataList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetCategoryModelWithDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatDataAdapter extends TypeAdapter<CatData> {
  @override
  final int typeId = 17;

  @override
  CatData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatData(
      id: fields[0] as int,
      name: fields[1] as String,
      type: fields[2] as String,
      sequence: fields[3] as int,
      subCategory: (fields[4] as List).cast<CatSubCategory>(),
      bgColor: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CatData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.sequence)
      ..writeByte(4)
      ..write(obj.subCategory)
      ..writeByte(5)
      ..write(obj.bgColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatSubCategoryAdapter extends TypeAdapter<CatSubCategory> {
  @override
  final int typeId = 18;

  @override
  CatSubCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatSubCategory(
      id: fields[0] as int,
      name: fields[1] as String,
      sequence: fields[2] as int,
      type: fields[3] as String,
      bgColor: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CatSubCategory obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.sequence)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.bgColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatSubCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatOtherDataAdapter extends TypeAdapter<CatOtherData> {
  @override
  final int typeId = 19;

  @override
  CatOtherData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatOtherData(
      id: fields[0] as int,
      name: fields[1] as String,
      type: fields[2] as String,
      sequence: fields[3] as int,
      subCategoryNew: (fields[4] as List).cast<CatSubCategoryNew>(),
      foodList: (fields[5] as List).cast<CatOtherDataFoodList>(),
      bgColor: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CatOtherData obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.sequence)
      ..writeByte(4)
      ..write(obj.subCategoryNew)
      ..writeByte(5)
      ..write(obj.foodList)
      ..writeByte(6)
      ..write(obj.bgColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatOtherDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatSubCategoryNewAdapter extends TypeAdapter<CatSubCategoryNew> {
  @override
  final int typeId = 20;

  @override
  CatSubCategoryNew read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatSubCategoryNew(
      id: fields[0] as int,
      name: fields[1] as String,
      type: fields[2] as String,
      sequence: fields[3] as int,
      foodList: (fields[4] as List).cast<CatOtherDataFoodList>(),
      bgColor: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CatSubCategoryNew obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.sequence)
      ..writeByte(4)
      ..write(obj.foodList)
      ..writeByte(5)
      ..write(obj.bgColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatSubCategoryNewAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatOtherDataFoodListAdapter extends TypeAdapter<CatOtherDataFoodList> {
  @override
  final int typeId = 21;

  @override
  CatOtherDataFoodList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatOtherDataFoodList(
      id: fields[0] as int,
      oldId: fields[1] as String?,
      ownerId: fields[2] as int,
      createdAt: fields[3] as String,
      updatedAt: fields[4] as String,
      name: fields[5] as String,
      imageid: fields[6] as String?,
      price: fields[7] as String,
      discountprice: fields[8] as String,
      desc: fields[9] as String,
      restaurant: fields[10] as int,
      category: fields[11] as int,
      ingredients: fields[12] as String,
      unit: fields[13] as String,
      packageCount: fields[14] as int,
      weight: fields[15] as int,
      canDelivery: fields[16] as int,
      stars: fields[17] as int,
      published: fields[18] as int,
      extras: fields[19] as int,
      nutritions: fields[20] as int,
      contains: fields[21] as String?,
      sequence: fields[22] as int,
      soldOut: fields[23] as int,
      images: fields[24] as String?,
      showApp: fields[25] as int,
      showWeb: fields[26] as int,
      showPos: fields[27] as int,
      showQrcode: fields[28] as int,
      chooseNumberItems: fields[29] as int,
      isOwnProduct: fields[30] as int,
      prodQty: fields[31] as int,
      isTakeAway: fields[32] as int,
      isHaveInHere: fields[33] as int,
      inventoryOn: fields[34] as int,
      prodSku: fields[35] as String,
      barcodeType: fields[36] as String?,
      productSegregatePrint: fields[37] as String,
      isWeighingMachine: fields[38] as int,
      measurementUnits: fields[39] as String?,
      unitType: fields[40] as String?,
      gstTaxPercentage: fields[41] as int?,
      foodType: fields[42] as String?,
      bgColor: fields[43] as String?,
      purchaseCost: fields[44] as String,
      profitMargin: fields[45] as String,
      profitMarginPercentage: fields[46] as String,
      priceUpdateDate: fields[47] as String?,
      productExpiryDate: fields[48] as String?,
      isVariantInventoryOff: fields[49] as int,
      familyGroupId: fields[50] as int,
      isCatering: fields[51] as int,
      minimumQty: fields[52] as int,
      personText: fields[53] as String?,
      orderBeforeTime: fields[54] as String,
      orderBeforeDay: fields[55] as String,
      forDays: fields[56] as String,
      isCouponNotApplied: fields[57] as int,
      productKdsDevicesId: fields[58] as String,
      imagePath: fields[70] as String?,
      foodListWithDetails: fields[71] as CatOtherDataFoodListWithDetails?,
      brand: fields[59] as String?,
      supplier: fields[60] as String?,
      options: fields[61] as int,
      startDate: fields[62] as String?,
      startTime: fields[63] as String?,
      endDate: fields[64] as String?,
      endTime: fields[65] as String?,
      days: fields[66] as String?,
      showEntryMain: fields[67] as int,
      showCds: fields[68] as int,
      gstApplicable: fields[69] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CatOtherDataFoodList obj) {
    writer
      ..writeByte(72)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.oldId)
      ..writeByte(2)
      ..write(obj.ownerId)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.imageid)
      ..writeByte(7)
      ..write(obj.price)
      ..writeByte(8)
      ..write(obj.discountprice)
      ..writeByte(9)
      ..write(obj.desc)
      ..writeByte(10)
      ..write(obj.restaurant)
      ..writeByte(11)
      ..write(obj.category)
      ..writeByte(12)
      ..write(obj.ingredients)
      ..writeByte(13)
      ..write(obj.unit)
      ..writeByte(14)
      ..write(obj.packageCount)
      ..writeByte(15)
      ..write(obj.weight)
      ..writeByte(16)
      ..write(obj.canDelivery)
      ..writeByte(17)
      ..write(obj.stars)
      ..writeByte(18)
      ..write(obj.published)
      ..writeByte(19)
      ..write(obj.extras)
      ..writeByte(20)
      ..write(obj.nutritions)
      ..writeByte(21)
      ..write(obj.contains)
      ..writeByte(22)
      ..write(obj.sequence)
      ..writeByte(23)
      ..write(obj.soldOut)
      ..writeByte(24)
      ..write(obj.images)
      ..writeByte(25)
      ..write(obj.showApp)
      ..writeByte(26)
      ..write(obj.showWeb)
      ..writeByte(27)
      ..write(obj.showPos)
      ..writeByte(28)
      ..write(obj.showQrcode)
      ..writeByte(29)
      ..write(obj.chooseNumberItems)
      ..writeByte(30)
      ..write(obj.isOwnProduct)
      ..writeByte(31)
      ..write(obj.prodQty)
      ..writeByte(32)
      ..write(obj.isTakeAway)
      ..writeByte(33)
      ..write(obj.isHaveInHere)
      ..writeByte(34)
      ..write(obj.inventoryOn)
      ..writeByte(35)
      ..write(obj.prodSku)
      ..writeByte(36)
      ..write(obj.barcodeType)
      ..writeByte(37)
      ..write(obj.productSegregatePrint)
      ..writeByte(38)
      ..write(obj.isWeighingMachine)
      ..writeByte(39)
      ..write(obj.measurementUnits)
      ..writeByte(40)
      ..write(obj.unitType)
      ..writeByte(41)
      ..write(obj.gstTaxPercentage)
      ..writeByte(42)
      ..write(obj.foodType)
      ..writeByte(43)
      ..write(obj.bgColor)
      ..writeByte(44)
      ..write(obj.purchaseCost)
      ..writeByte(45)
      ..write(obj.profitMargin)
      ..writeByte(46)
      ..write(obj.profitMarginPercentage)
      ..writeByte(47)
      ..write(obj.priceUpdateDate)
      ..writeByte(48)
      ..write(obj.productExpiryDate)
      ..writeByte(49)
      ..write(obj.isVariantInventoryOff)
      ..writeByte(50)
      ..write(obj.familyGroupId)
      ..writeByte(51)
      ..write(obj.isCatering)
      ..writeByte(52)
      ..write(obj.minimumQty)
      ..writeByte(53)
      ..write(obj.personText)
      ..writeByte(54)
      ..write(obj.orderBeforeTime)
      ..writeByte(55)
      ..write(obj.orderBeforeDay)
      ..writeByte(56)
      ..write(obj.forDays)
      ..writeByte(57)
      ..write(obj.isCouponNotApplied)
      ..writeByte(58)
      ..write(obj.productKdsDevicesId)
      ..writeByte(59)
      ..write(obj.brand)
      ..writeByte(60)
      ..write(obj.supplier)
      ..writeByte(61)
      ..write(obj.options)
      ..writeByte(62)
      ..write(obj.startDate)
      ..writeByte(63)
      ..write(obj.startTime)
      ..writeByte(64)
      ..write(obj.endDate)
      ..writeByte(65)
      ..write(obj.endTime)
      ..writeByte(66)
      ..write(obj.days)
      ..writeByte(67)
      ..write(obj.showEntryMain)
      ..writeByte(68)
      ..write(obj.showCds)
      ..writeByte(69)
      ..write(obj.gstApplicable)
      ..writeByte(70)
      ..write(obj.imagePath)
      ..writeByte(71)
      ..write(obj.foodListWithDetails);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatOtherDataFoodListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatOtherDataFoodListWithDetailsAdapter
    extends TypeAdapter<CatOtherDataFoodListWithDetails> {
  @override
  final int typeId = 22;

  @override
  CatOtherDataFoodListWithDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatOtherDataFoodListWithDetails(
      id: fields[0] as int,
      name: fields[1] as String,
      imagePath: fields[2] as String,
      price: fields[3] as String,
      discountprice: fields[4] as String,
      desc: fields[5] as String,
      soldOut: fields[6] as int,
      prodQty: fields[7] as int,
      isWeighingMachine: fields[8] as int,
      inventoryOn: fields[9] as int,
      isVariantInventoryOff: fields[10] as int,
      ingredients: (fields[11] as List).cast<String>(),
      variantDataArray: (fields[12] as List?)?.cast<CatVariantDataArray>(),
      containsData: (fields[13] as List?)?.cast<String>(),
      contains: fields[14] as String,
      foodAddons: fields[15] as String,
      addonsDataArray: (fields[16] as List?)?.cast<CatAddonsDataArray>(),
      catId: fields[17] as int,
      catName: fields[18] as String,
      unitTypes: fields[19] as String,
      measurementUnits: fields[20] as String,
      type: fields[21] as String,
      makemyown: fields[22] as int,
      isTakeAway: fields[23] as int,
      isHaveInHere: fields[24] as int,
      chooseNumberItems: fields[25] as int,
      gstTaxPercentage: fields[26] as int,
      bgColor: fields[27] as String,
      foodBundlePrices: (fields[28] as List).cast<dynamic>(),
      isCouponNotApplied: fields[29] as int,
      familyGroupId: fields[30] as int,
      showEntryMain: fields[31] as int,
      gstApplicable: fields[32] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CatOtherDataFoodListWithDetails obj) {
    writer
      ..writeByte(33)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imagePath)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.discountprice)
      ..writeByte(5)
      ..write(obj.desc)
      ..writeByte(6)
      ..write(obj.soldOut)
      ..writeByte(7)
      ..write(obj.prodQty)
      ..writeByte(8)
      ..write(obj.isWeighingMachine)
      ..writeByte(9)
      ..write(obj.inventoryOn)
      ..writeByte(10)
      ..write(obj.isVariantInventoryOff)
      ..writeByte(11)
      ..write(obj.ingredients)
      ..writeByte(12)
      ..write(obj.variantDataArray)
      ..writeByte(13)
      ..write(obj.containsData)
      ..writeByte(14)
      ..write(obj.contains)
      ..writeByte(15)
      ..write(obj.foodAddons)
      ..writeByte(16)
      ..write(obj.addonsDataArray)
      ..writeByte(17)
      ..write(obj.catId)
      ..writeByte(18)
      ..write(obj.catName)
      ..writeByte(19)
      ..write(obj.unitTypes)
      ..writeByte(20)
      ..write(obj.measurementUnits)
      ..writeByte(21)
      ..write(obj.type)
      ..writeByte(22)
      ..write(obj.makemyown)
      ..writeByte(23)
      ..write(obj.isTakeAway)
      ..writeByte(24)
      ..write(obj.isHaveInHere)
      ..writeByte(25)
      ..write(obj.chooseNumberItems)
      ..writeByte(26)
      ..write(obj.gstTaxPercentage)
      ..writeByte(27)
      ..write(obj.bgColor)
      ..writeByte(28)
      ..write(obj.foodBundlePrices)
      ..writeByte(29)
      ..write(obj.isCouponNotApplied)
      ..writeByte(30)
      ..write(obj.familyGroupId)
      ..writeByte(31)
      ..write(obj.showEntryMain)
      ..writeByte(32)
      ..write(obj.gstApplicable);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatOtherDataFoodListWithDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatComboDataAdapter extends TypeAdapter<CatComboData> {
  @override
  final int typeId = 23;

  @override
  CatComboData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatComboData(
      id: fields[0] as int,
      name: fields[1] as String,
      discount: fields[2] as String,
      noOfItems: fields[3] as int,
      amount: fields[4] as String,
      desc: fields[5] as String,
      showApp: fields[6] as int,
      showWeb: fields[7] as int,
      showPos: fields[8] as int,
      showQrcode: fields[9] as int,
      deafultProductId: fields[10] as int,
      deafultProductName: fields[11] as String,
      allCategory: fields[12] as int,
      categoryList: (fields[13] as List).cast<CatCategoryList>(),
      allFoods: fields[14] as int,
      foodList: (fields[15] as List).cast<CatHalfNHalfFoodList>(),
    );
  }

  @override
  void write(BinaryWriter writer, CatComboData obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.discount)
      ..writeByte(3)
      ..write(obj.noOfItems)
      ..writeByte(4)
      ..write(obj.amount)
      ..writeByte(5)
      ..write(obj.desc)
      ..writeByte(6)
      ..write(obj.showApp)
      ..writeByte(7)
      ..write(obj.showWeb)
      ..writeByte(8)
      ..write(obj.showPos)
      ..writeByte(9)
      ..write(obj.showQrcode)
      ..writeByte(10)
      ..write(obj.deafultProductId)
      ..writeByte(11)
      ..write(obj.deafultProductName)
      ..writeByte(12)
      ..write(obj.allCategory)
      ..writeByte(13)
      ..write(obj.categoryList)
      ..writeByte(14)
      ..write(obj.allFoods)
      ..writeByte(15)
      ..write(obj.foodList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatComboDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatCategoryListAdapter extends TypeAdapter<CatCategoryList> {
  @override
  final int typeId = 24;

  @override
  CatCategoryList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatCategoryList(
      id: fields[0] as int,
      ownerId: fields[1] as int,
      oldId: fields[2] as int,
      createdAt: fields[3] as String,
      updatedAt: fields[4] as String,
      restaurantId: fields[5] as String,
      name: fields[6] as String,
      imageid: fields[7] as int,
      sequence: fields[8] as int,
      desc: fields[9] as String,
      visible: fields[10] as int,
      parent: fields[11] as int,
      type: fields[12] as String,
      showApp: fields[13] as int,
      showWeb: fields[14] as int,
      showPos: fields[15] as int,
      showQrcode: fields[16] as int,
      segregatePrint: fields[17] as int,
      bgColor: fields[18] as String,
      isCatering: fields[19] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CatCategoryList obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.ownerId)
      ..writeByte(2)
      ..write(obj.oldId)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.restaurantId)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.imageid)
      ..writeByte(8)
      ..write(obj.sequence)
      ..writeByte(9)
      ..write(obj.desc)
      ..writeByte(10)
      ..write(obj.visible)
      ..writeByte(11)
      ..write(obj.parent)
      ..writeByte(12)
      ..write(obj.type)
      ..writeByte(13)
      ..write(obj.showApp)
      ..writeByte(14)
      ..write(obj.showWeb)
      ..writeByte(15)
      ..write(obj.showPos)
      ..writeByte(16)
      ..write(obj.showQrcode)
      ..writeByte(17)
      ..write(obj.segregatePrint)
      ..writeByte(18)
      ..write(obj.bgColor)
      ..writeByte(19)
      ..write(obj.isCatering);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatCategoryListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatHalfNHalfDataAdapter extends TypeAdapter<CatHalfNHalfData> {
  @override
  final int typeId = 25;

  @override
  CatHalfNHalfData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatHalfNHalfData(
      id: fields[0] as int,
      name: fields[1] as String,
      desc: fields[2] as String,
      offeredPrice: fields[3] as double,
      thisPrice: fields[4] as int,
      showApp: fields[5] as int,
      showWeb: fields[6] as int,
      showPos: fields[7] as int,
      showQrcode: fields[8] as int,
      variant: fields[9] as String,
      allFoods: fields[10] as int,
      foodList: (fields[11] as List).cast<CatHalfNHalfFoodList>(),
      allBase: (fields[12] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, CatHalfNHalfData obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.desc)
      ..writeByte(3)
      ..write(obj.offeredPrice)
      ..writeByte(4)
      ..write(obj.thisPrice)
      ..writeByte(5)
      ..write(obj.showApp)
      ..writeByte(6)
      ..write(obj.showWeb)
      ..writeByte(7)
      ..write(obj.showPos)
      ..writeByte(8)
      ..write(obj.showQrcode)
      ..writeByte(9)
      ..write(obj.variant)
      ..writeByte(10)
      ..write(obj.allFoods)
      ..writeByte(11)
      ..write(obj.foodList)
      ..writeByte(12)
      ..write(obj.allBase);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatHalfNHalfDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatHalfNHalfFoodListAdapter extends TypeAdapter<CatHalfNHalfFoodList> {
  @override
  final int typeId = 26;

  @override
  CatHalfNHalfFoodList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatHalfNHalfFoodList(
      id: fields[0] as int,
      name: fields[1] as String,
      imagePath: fields[2] as String?,
      price: fields[3] as String,
      discountprice: fields[4] as String,
      desc: fields[5] as String,
      prodQty: fields[6] as int,
      soldOut: fields[7] as int,
      ingredients: fields[8] as String,
      variantDataArray: (fields[9] as List?)?.cast<CatVariantDataArray>(),
      containsData: (fields[10] as List?)?.cast<String>(),
      contains: fields[11] as String?,
      foodAddons: fields[12] as String,
      addonsDataArray: (fields[13] as List).cast<CatAddonsDataArray>(),
      catId: fields[14] as int,
      catName: fields[15] as String,
      type: fields[16] as String,
      makemyown: fields[17] as int,
      chooseNumberItems: fields[18] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CatHalfNHalfFoodList obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imagePath)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.discountprice)
      ..writeByte(5)
      ..write(obj.desc)
      ..writeByte(6)
      ..write(obj.prodQty)
      ..writeByte(7)
      ..write(obj.soldOut)
      ..writeByte(8)
      ..write(obj.ingredients)
      ..writeByte(9)
      ..write(obj.variantDataArray)
      ..writeByte(10)
      ..write(obj.containsData)
      ..writeByte(11)
      ..write(obj.contains)
      ..writeByte(12)
      ..write(obj.foodAddons)
      ..writeByte(13)
      ..write(obj.addonsDataArray)
      ..writeByte(14)
      ..write(obj.catId)
      ..writeByte(15)
      ..write(obj.catName)
      ..writeByte(16)
      ..write(obj.type)
      ..writeByte(17)
      ..write(obj.makemyown)
      ..writeByte(18)
      ..write(obj.chooseNumberItems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatHalfNHalfFoodListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatDealDataListAdapter extends TypeAdapter<CatDealDataList> {
  @override
  final int typeId = 27;

  @override
  CatDealDataList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatDealDataList(
      id: fields[0] as int,
      name: fields[1] as String,
      amount: fields[2] as String,
      desc: fields[3] as String,
      showApp: fields[4] as int,
      showWeb: fields[5] as int,
      showPos: fields[6] as int,
      showQrcode: fields[7] as int,
      dealData: (fields[8] as List).cast<CatDealData>(),
    );
  }

  @override
  void write(BinaryWriter writer, CatDealDataList obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.desc)
      ..writeByte(4)
      ..write(obj.showApp)
      ..writeByte(5)
      ..write(obj.showWeb)
      ..writeByte(6)
      ..write(obj.showPos)
      ..writeByte(7)
      ..write(obj.showQrcode)
      ..writeByte(8)
      ..write(obj.dealData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatDealDataListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatDealDataAdapter extends TypeAdapter<CatDealData> {
  @override
  final int typeId = 28;

  @override
  CatDealData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatDealData(
      numberOfItem: fields[0] as String,
      category: fields[1] as String,
      variantName: fields[2] as String,
      foodList: (fields[3] as List).cast<CatDealDataFoodList>(),
      defaultProduct: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CatDealData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.numberOfItem)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.variantName)
      ..writeByte(3)
      ..write(obj.foodList)
      ..writeByte(4)
      ..write(obj.defaultProduct);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatDealDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatDealDataFoodListAdapter extends TypeAdapter<CatDealDataFoodList> {
  @override
  final int typeId = 29;

  @override
  CatDealDataFoodList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatDealDataFoodList(
      id: fields[0] as int,
      oldId: fields[1] as String?,
      ownerId: fields[2] as int,
      createdAt: fields[3] as String,
      updatedAt: fields[4] as String,
      name: fields[5] as String,
      imageid: fields[6] as Null,
      price: fields[7] as String,
      discountprice: fields[8] as String,
      desc: fields[9] as String,
      restaurant: fields[10] as int,
      category: fields[11] as int,
      ingredients: fields[12] as String,
      unit: fields[13] as String,
      packageCount: fields[14] as int,
      weight: fields[15] as int,
      canDelivery: fields[16] as int,
      stars: fields[17] as int,
      published: fields[18] as int,
      extras: fields[19] as int,
      nutritions: fields[20] as int,
      contains: fields[21] as String?,
      sequence: fields[22] as int,
      soldOut: fields[23] as int,
      images: fields[24] as String?,
      showApp: fields[25] as int,
      showWeb: fields[26] as int,
      showPos: fields[27] as int,
      showQrcode: fields[28] as int,
      chooseNumberItems: fields[29] as int,
      isOwnProduct: fields[30] as int,
      prodQty: fields[31] as int,
      isTakeAway: fields[32] as int,
      isHaveInHere: fields[33] as int,
      inventoryOn: fields[34] as int,
      prodSku: fields[35] as String,
      barcodeType: fields[36] as String?,
      productSegregatePrint: fields[37] as String,
      isWeighingMachine: fields[38] as int,
      measurementUnits: fields[39] as String?,
      unitType: fields[40] as String?,
      gstTaxPercentage: fields[41] as int?,
      foodType: fields[42] as String?,
      bgColor: fields[43] as String?,
      purchaseCost: fields[44] as String,
      profitMargin: fields[45] as String,
      profitMarginPercentage: fields[46] as String,
      priceUpdateDate: fields[47] as String?,
      productExpiryDate: fields[48] as String?,
      isVariantInventoryOff: fields[49] as int,
      familyGroupId: fields[50] as int,
      isCatering: fields[51] as int,
      minimumQty: fields[52] as int,
      personText: fields[53] as String?,
      orderBeforeTime: fields[54] as String,
      orderBeforeDay: fields[55] as String,
      forDays: fields[56] as String,
      isCouponNotApplied: fields[57] as int,
      productKdsDevicesId: fields[58] as String,
      brand: fields[59] as String?,
      supplier: fields[60] as String?,
      options: fields[61] as int,
      startDate: fields[62] as String?,
      startTime: fields[63] as String?,
      endDate: fields[64] as String?,
      endTime: fields[65] as String?,
      days: fields[66] as String?,
      showEntryMain: fields[67] as int,
      showCds: fields[68] as int,
      gstApplicable: fields[69] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CatDealDataFoodList obj) {
    writer
      ..writeByte(70)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.oldId)
      ..writeByte(2)
      ..write(obj.ownerId)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.imageid)
      ..writeByte(7)
      ..write(obj.price)
      ..writeByte(8)
      ..write(obj.discountprice)
      ..writeByte(9)
      ..write(obj.desc)
      ..writeByte(10)
      ..write(obj.restaurant)
      ..writeByte(11)
      ..write(obj.category)
      ..writeByte(12)
      ..write(obj.ingredients)
      ..writeByte(13)
      ..write(obj.unit)
      ..writeByte(14)
      ..write(obj.packageCount)
      ..writeByte(15)
      ..write(obj.weight)
      ..writeByte(16)
      ..write(obj.canDelivery)
      ..writeByte(17)
      ..write(obj.stars)
      ..writeByte(18)
      ..write(obj.published)
      ..writeByte(19)
      ..write(obj.extras)
      ..writeByte(20)
      ..write(obj.nutritions)
      ..writeByte(21)
      ..write(obj.contains)
      ..writeByte(22)
      ..write(obj.sequence)
      ..writeByte(23)
      ..write(obj.soldOut)
      ..writeByte(24)
      ..write(obj.images)
      ..writeByte(25)
      ..write(obj.showApp)
      ..writeByte(26)
      ..write(obj.showWeb)
      ..writeByte(27)
      ..write(obj.showPos)
      ..writeByte(28)
      ..write(obj.showQrcode)
      ..writeByte(29)
      ..write(obj.chooseNumberItems)
      ..writeByte(30)
      ..write(obj.isOwnProduct)
      ..writeByte(31)
      ..write(obj.prodQty)
      ..writeByte(32)
      ..write(obj.isTakeAway)
      ..writeByte(33)
      ..write(obj.isHaveInHere)
      ..writeByte(34)
      ..write(obj.inventoryOn)
      ..writeByte(35)
      ..write(obj.prodSku)
      ..writeByte(36)
      ..write(obj.barcodeType)
      ..writeByte(37)
      ..write(obj.productSegregatePrint)
      ..writeByte(38)
      ..write(obj.isWeighingMachine)
      ..writeByte(39)
      ..write(obj.measurementUnits)
      ..writeByte(40)
      ..write(obj.unitType)
      ..writeByte(41)
      ..write(obj.gstTaxPercentage)
      ..writeByte(42)
      ..write(obj.foodType)
      ..writeByte(43)
      ..write(obj.bgColor)
      ..writeByte(44)
      ..write(obj.purchaseCost)
      ..writeByte(45)
      ..write(obj.profitMargin)
      ..writeByte(46)
      ..write(obj.profitMarginPercentage)
      ..writeByte(47)
      ..write(obj.priceUpdateDate)
      ..writeByte(48)
      ..write(obj.productExpiryDate)
      ..writeByte(49)
      ..write(obj.isVariantInventoryOff)
      ..writeByte(50)
      ..write(obj.familyGroupId)
      ..writeByte(51)
      ..write(obj.isCatering)
      ..writeByte(52)
      ..write(obj.minimumQty)
      ..writeByte(53)
      ..write(obj.personText)
      ..writeByte(54)
      ..write(obj.orderBeforeTime)
      ..writeByte(55)
      ..write(obj.orderBeforeDay)
      ..writeByte(56)
      ..write(obj.forDays)
      ..writeByte(57)
      ..write(obj.isCouponNotApplied)
      ..writeByte(58)
      ..write(obj.productKdsDevicesId)
      ..writeByte(59)
      ..write(obj.brand)
      ..writeByte(60)
      ..write(obj.supplier)
      ..writeByte(61)
      ..write(obj.options)
      ..writeByte(62)
      ..write(obj.startDate)
      ..writeByte(63)
      ..write(obj.startTime)
      ..writeByte(64)
      ..write(obj.endDate)
      ..writeByte(65)
      ..write(obj.endTime)
      ..writeByte(66)
      ..write(obj.days)
      ..writeByte(67)
      ..write(obj.showEntryMain)
      ..writeByte(68)
      ..write(obj.showCds)
      ..writeByte(69)
      ..write(obj.gstApplicable);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatDealDataFoodListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatSpecialDealDataAdapter extends TypeAdapter<CatSpecialDealData> {
  @override
  final int typeId = 30;

  @override
  CatSpecialDealData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatSpecialDealData(
      numberOfItem: fields[0] as String,
      category: fields[1] as String,
      categoryId: fields[2] as String,
      variantName: fields[3] as String,
      variantId: fields[4] as String,
      selectedVariantList: (fields[5] as List).cast<dynamic>(),
      foodList: (fields[6] as List).cast<CatSpecialDealDataFoodList>(),
      defaultProduct: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CatSpecialDealData obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.numberOfItem)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.categoryId)
      ..writeByte(3)
      ..write(obj.variantName)
      ..writeByte(4)
      ..write(obj.variantId)
      ..writeByte(5)
      ..write(obj.selectedVariantList)
      ..writeByte(6)
      ..write(obj.foodList)
      ..writeByte(7)
      ..write(obj.defaultProduct);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatSpecialDealDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatSpecialDealDataFoodListAdapter
    extends TypeAdapter<CatSpecialDealDataFoodList> {
  @override
  final int typeId = 31;

  @override
  CatSpecialDealDataFoodList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatSpecialDealDataFoodList(
      id: fields[0] as int,
      oldId: fields[1] as String?,
      ownerId: fields[2] as int,
      createdAt: fields[3] as String,
      updatedAt: fields[4] as String,
      name: fields[5] as String,
      imageid: fields[6] as Null,
      price: fields[7] as String,
      discountprice: fields[8] as String,
      desc: fields[9] as String,
      restaurant: fields[10] as int,
      category: fields[11] as int,
      ingredients: fields[12] as String,
      unit: fields[13] as String,
      packageCount: fields[14] as int,
      weight: fields[15] as int,
      canDelivery: fields[16] as int,
      stars: fields[17] as int,
      published: fields[18] as int,
      extras: fields[19] as int,
      nutritions: fields[20] as int,
      contains: fields[21] as String?,
      sequence: fields[22] as int,
      soldOut: fields[23] as int,
      images: fields[24] as String?,
      showApp: fields[25] as int,
      showWeb: fields[26] as int,
      showPos: fields[27] as int,
      showQrcode: fields[28] as int,
      chooseNumberItems: fields[29] as int,
      isOwnProduct: fields[30] as int,
      prodQty: fields[31] as int,
      isTakeAway: fields[32] as int,
      isHaveInHere: fields[33] as int,
      inventoryOn: fields[34] as int,
      prodSku: fields[35] as String,
      barcodeType: fields[36] as String?,
      productSegregatePrint: fields[37] as String,
      isWeighingMachine: fields[38] as int,
      measurementUnits: fields[39] as String?,
      unitType: fields[40] as String?,
      gstTaxPercentage: fields[41] as int?,
      foodType: fields[42] as String?,
      bgColor: fields[43] as String?,
      purchaseCost: fields[44] as String,
      profitMargin: fields[45] as String,
      profitMarginPercentage: fields[46] as String,
      priceUpdateDate: fields[47] as String?,
      productExpiryDate: fields[48] as String?,
      isVariantInventoryOff: fields[49] as int,
      familyGroupId: fields[50] as int,
      isCatering: fields[51] as int,
      minimumQty: fields[52] as int,
      personText: fields[53] as String?,
      orderBeforeTime: fields[54] as String,
      orderBeforeDay: fields[55] as String,
      forDays: fields[56] as String,
      isCouponNotApplied: fields[57] as int,
      productKdsDevicesId: fields[58] as String,
      brand: fields[59] as String?,
      supplier: fields[60] as String?,
      options: fields[61] as int,
      startDate: fields[62] as String?,
      startTime: fields[63] as String?,
      endDate: fields[64] as String?,
      endTime: fields[65] as String?,
      days: fields[66] as String?,
      showEntryMain: fields[67] as int,
      showCds: fields[68] as int,
      gstApplicable: fields[69] as String?,
      addonsDataArray: (fields[71] as List?)?.cast<CatAddonsDataArray>(),
      variantDataArray: (fields[70] as List?)?.cast<CatVariantDataArray>(),
      containsData: (fields[72] as List?)?.cast<String>(),
      foodAddons: fields[73] as String,
      specialDealVariantName: fields[74] as String,
      specialDealVariantId: fields[75] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CatSpecialDealDataFoodList obj) {
    writer
      ..writeByte(76)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.oldId)
      ..writeByte(2)
      ..write(obj.ownerId)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.imageid)
      ..writeByte(7)
      ..write(obj.price)
      ..writeByte(8)
      ..write(obj.discountprice)
      ..writeByte(9)
      ..write(obj.desc)
      ..writeByte(10)
      ..write(obj.restaurant)
      ..writeByte(11)
      ..write(obj.category)
      ..writeByte(12)
      ..write(obj.ingredients)
      ..writeByte(13)
      ..write(obj.unit)
      ..writeByte(14)
      ..write(obj.packageCount)
      ..writeByte(15)
      ..write(obj.weight)
      ..writeByte(16)
      ..write(obj.canDelivery)
      ..writeByte(17)
      ..write(obj.stars)
      ..writeByte(18)
      ..write(obj.published)
      ..writeByte(19)
      ..write(obj.extras)
      ..writeByte(20)
      ..write(obj.nutritions)
      ..writeByte(21)
      ..write(obj.contains)
      ..writeByte(22)
      ..write(obj.sequence)
      ..writeByte(23)
      ..write(obj.soldOut)
      ..writeByte(24)
      ..write(obj.images)
      ..writeByte(25)
      ..write(obj.showApp)
      ..writeByte(26)
      ..write(obj.showWeb)
      ..writeByte(27)
      ..write(obj.showPos)
      ..writeByte(28)
      ..write(obj.showQrcode)
      ..writeByte(29)
      ..write(obj.chooseNumberItems)
      ..writeByte(30)
      ..write(obj.isOwnProduct)
      ..writeByte(31)
      ..write(obj.prodQty)
      ..writeByte(32)
      ..write(obj.isTakeAway)
      ..writeByte(33)
      ..write(obj.isHaveInHere)
      ..writeByte(34)
      ..write(obj.inventoryOn)
      ..writeByte(35)
      ..write(obj.prodSku)
      ..writeByte(36)
      ..write(obj.barcodeType)
      ..writeByte(37)
      ..write(obj.productSegregatePrint)
      ..writeByte(38)
      ..write(obj.isWeighingMachine)
      ..writeByte(39)
      ..write(obj.measurementUnits)
      ..writeByte(40)
      ..write(obj.unitType)
      ..writeByte(41)
      ..write(obj.gstTaxPercentage)
      ..writeByte(42)
      ..write(obj.foodType)
      ..writeByte(43)
      ..write(obj.bgColor)
      ..writeByte(44)
      ..write(obj.purchaseCost)
      ..writeByte(45)
      ..write(obj.profitMargin)
      ..writeByte(46)
      ..write(obj.profitMarginPercentage)
      ..writeByte(47)
      ..write(obj.priceUpdateDate)
      ..writeByte(48)
      ..write(obj.productExpiryDate)
      ..writeByte(49)
      ..write(obj.isVariantInventoryOff)
      ..writeByte(50)
      ..write(obj.familyGroupId)
      ..writeByte(51)
      ..write(obj.isCatering)
      ..writeByte(52)
      ..write(obj.minimumQty)
      ..writeByte(53)
      ..write(obj.personText)
      ..writeByte(54)
      ..write(obj.orderBeforeTime)
      ..writeByte(55)
      ..write(obj.orderBeforeDay)
      ..writeByte(56)
      ..write(obj.forDays)
      ..writeByte(57)
      ..write(obj.isCouponNotApplied)
      ..writeByte(58)
      ..write(obj.productKdsDevicesId)
      ..writeByte(59)
      ..write(obj.brand)
      ..writeByte(60)
      ..write(obj.supplier)
      ..writeByte(61)
      ..write(obj.options)
      ..writeByte(62)
      ..write(obj.startDate)
      ..writeByte(63)
      ..write(obj.startTime)
      ..writeByte(64)
      ..write(obj.endDate)
      ..writeByte(65)
      ..write(obj.endTime)
      ..writeByte(66)
      ..write(obj.days)
      ..writeByte(67)
      ..write(obj.showEntryMain)
      ..writeByte(68)
      ..write(obj.showCds)
      ..writeByte(69)
      ..write(obj.gstApplicable)
      ..writeByte(70)
      ..write(obj.variantDataArray)
      ..writeByte(71)
      ..write(obj.addonsDataArray)
      ..writeByte(72)
      ..write(obj.containsData)
      ..writeByte(73)
      ..write(obj.foodAddons)
      ..writeByte(74)
      ..write(obj.specialDealVariantName)
      ..writeByte(75)
      ..write(obj.specialDealVariantId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatSpecialDealDataFoodListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatSpecialDealDataListAdapter
    extends TypeAdapter<CatSpecialDealDataList> {
  @override
  final int typeId = 32;

  @override
  CatSpecialDealDataList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatSpecialDealDataList(
      id: fields[0] as int,
      name: fields[1] as String,
      amount: fields[2] as String,
      desc: fields[3] as String,
      showApp: fields[4] as int,
      showWeb: fields[5] as int,
      showPos: fields[6] as int,
      showQrcode: fields[7] as int,
      dealData: (fields[8] as List).cast<CatSpecialDealData>(),
      options: fields[9] as int,
      startDate: fields[10] as String?,
      startTime: fields[11] as String?,
      endTime: fields[12] as String?,
      days: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CatSpecialDealDataList obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.desc)
      ..writeByte(4)
      ..write(obj.showApp)
      ..writeByte(5)
      ..write(obj.showWeb)
      ..writeByte(6)
      ..write(obj.showPos)
      ..writeByte(7)
      ..write(obj.showQrcode)
      ..writeByte(8)
      ..write(obj.dealData)
      ..writeByte(9)
      ..write(obj.options)
      ..writeByte(10)
      ..write(obj.startDate)
      ..writeByte(11)
      ..write(obj.startTime)
      ..writeByte(12)
      ..write(obj.endTime)
      ..writeByte(13)
      ..write(obj.days);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatSpecialDealDataListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatVariantDataArrayAdapter extends TypeAdapter<CatVariantDataArray> {
  @override
  final int typeId = 33;

  @override
  CatVariantDataArray read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatVariantDataArray(
      variantName: fields[0] as String,
      variantDetail: (fields[1] as List).cast<CatVariantDetail>(),
    );
  }

  @override
  void write(BinaryWriter writer, CatVariantDataArray obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.variantName)
      ..writeByte(1)
      ..write(obj.variantDetail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatVariantDataArrayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatVariantDetailAdapter extends TypeAdapter<CatVariantDetail> {
  @override
  final int typeId = 34;

  @override
  CatVariantDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatVariantDetail(
      id: fields[0] as int,
      createdAt: fields[1] as String,
      updatedAt: fields[2] as String,
      food: fields[3] as int,
      name: fields[4] as String,
      variantType: fields[5] as String,
      imageid: fields[6] as int,
      prod_qty: fields[7] as int,
      price: fields[8] as String,
      dprice: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CatVariantDetail obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.updatedAt)
      ..writeByte(3)
      ..write(obj.food)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.variantType)
      ..writeByte(6)
      ..write(obj.imageid)
      ..writeByte(7)
      ..write(obj.prod_qty)
      ..writeByte(8)
      ..write(obj.price)
      ..writeByte(9)
      ..write(obj.dprice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatVariantDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatAddonsDataArrayAdapter extends TypeAdapter<CatAddonsDataArray> {
  @override
  final int typeId = 35;

  @override
  CatAddonsDataArray read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatAddonsDataArray(
      addonsName: fields[0] as String?,
      addonsPrice: fields[1] as String?,
      addonsId: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CatAddonsDataArray obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.addonsName)
      ..writeByte(1)
      ..write(obj.addonsPrice)
      ..writeByte(2)
      ..write(obj.addonsId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatAddonsDataArrayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
