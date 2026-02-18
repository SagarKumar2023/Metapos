// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getProductDetailsModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetProductDetailsWithDBModelAdapter
    extends TypeAdapter<GetProductDetailsWithDBModel> {
  @override
  final int typeId = 1;

  @override
  GetProductDetailsWithDBModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetProductDetailsWithDBModel(
      error: fields[0] as String,
      message: fields[1] as String,
      data: fields[2] as GetFoodListProductDetailsData,
    );
  }

  @override
  void write(BinaryWriter writer, GetProductDetailsWithDBModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.error)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetProductDetailsWithDBModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GetFoodListProductDetailsDataAdapter
    extends TypeAdapter<GetFoodListProductDetailsData> {
  @override
  final int typeId = 2;

  @override
  GetFoodListProductDetailsData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetFoodListProductDetailsData(
      id: fields[0] as int,
      name: fields[1] as String,
      imagePath: fields[2] as String,
      price: fields[3] as String,
      discountprice: fields[4] as String,
      desc: fields[5] as String,
      prodQty: fields[6] as int,
      soldOut: fields[7] as int,
      ingredients: (fields[8] as List).cast<String>(),
      variantDataArray: (fields[9] as List).cast<GetFoodListVariantDataArray>(),
      containsData: (fields[10] as List).cast<String>(),
      contains: fields[11] as String,
      foodAddons: fields[12] as String,
      addonsDataArray: (fields[13] as List).cast<GetFoodListAddonsDataArray>(),
      catId: fields[14] as int,
      catName: fields[15] as String,
      type: fields[16] as String,
      makemyown: fields[17] as int,
      chooseNumberItems: fields[18] as int,
      isTakeAway: fields[19] as int,
      isHaveInHere: fields[20] as int,
    );
  }

  @override
  void write(BinaryWriter writer, GetFoodListProductDetailsData obj) {
    writer
      ..writeByte(21)
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
      ..write(obj.chooseNumberItems)
      ..writeByte(19)
      ..write(obj.isTakeAway)
      ..writeByte(20)
      ..write(obj.isHaveInHere);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetFoodListProductDetailsDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GetFoodListVariantDataArrayAdapter
    extends TypeAdapter<GetFoodListVariantDataArray> {
  @override
  final int typeId = 3;

  @override
  GetFoodListVariantDataArray read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetFoodListVariantDataArray(
      variantName: fields[0] as String,
      variantDetail: (fields[1] as List).cast<GetFoodListVariantDetail>(),
    );
  }

  @override
  void write(BinaryWriter writer, GetFoodListVariantDataArray obj) {
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
      other is GetFoodListVariantDataArrayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GetFoodListVariantDetailAdapter
    extends TypeAdapter<GetFoodListVariantDetail> {
  @override
  final int typeId = 4;

  @override
  GetFoodListVariantDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetFoodListVariantDetail(
      id: fields[0] as int,
      createdAt: fields[1] as String,
      updatedAt: fields[2] as String,
      food: fields[3] as int,
      name: fields[4] as String,
      variantType: fields[5] as String,
      imageid: fields[6] as int,
      price: fields[7] as String,
      dprice: fields[8] as String,
      prodQty: fields[9] as int,
      prodSku: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GetFoodListVariantDetail obj) {
    writer
      ..writeByte(11)
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
      ..write(obj.price)
      ..writeByte(8)
      ..write(obj.dprice)
      ..writeByte(9)
      ..write(obj.prodQty)
      ..writeByte(10)
      ..write(obj.prodSku);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetFoodListVariantDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GetFoodListAddonsDataArrayAdapter
    extends TypeAdapter<GetFoodListAddonsDataArray> {
  @override
  final int typeId = 5;

  @override
  GetFoodListAddonsDataArray read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetFoodListAddonsDataArray(
      addonsId: fields[0] as int,
      addonsName: fields[1] as String,
      addonsPrice: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GetFoodListAddonsDataArray obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.addonsId)
      ..writeByte(1)
      ..write(obj.addonsName)
      ..writeByte(2)
      ..write(obj.addonsPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetFoodListAddonsDataArrayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
