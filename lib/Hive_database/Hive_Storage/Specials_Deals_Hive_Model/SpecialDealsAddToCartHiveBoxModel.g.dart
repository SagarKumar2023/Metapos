// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpecialDealsAddToCartHiveBoxModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpecialDealsAddToCartDBModelAdapter
    extends TypeAdapter<SpecialDealsAddToCartDBModel> {
  @override
  final int typeId = 11;

  @override
  SpecialDealsAddToCartDBModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpecialDealsAddToCartDBModel(
      specialDealName: fields[0] as String?,
      specialDealPrice: fields[1] as String?,
      specialDealCategory: (fields[4] as List).cast<String>(),
      specialDealNumberOfItem: (fields[3] as List).cast<String>(),
      specialDealSelectedFoodName: (fields[2] as List).cast<String?>(),
      specialDealId: fields[5] as String?,
      variantName: (fields[6] as List).cast<String>(),
      specialDealDesc: fields[7] as String,
      productCount: fields[8] as String?,
      extras: fields[9] as String?,
      images: fields[10] as String?,
      contains: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SpecialDealsAddToCartDBModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.specialDealName)
      ..writeByte(1)
      ..write(obj.specialDealPrice)
      ..writeByte(2)
      ..write(obj.specialDealSelectedFoodName)
      ..writeByte(3)
      ..write(obj.specialDealNumberOfItem)
      ..writeByte(4)
      ..write(obj.specialDealCategory)
      ..writeByte(5)
      ..write(obj.specialDealId)
      ..writeByte(6)
      ..write(obj.variantName)
      ..writeByte(7)
      ..write(obj.specialDealDesc)
      ..writeByte(8)
      ..write(obj.productCount)
      ..writeByte(9)
      ..write(obj.extras)
      ..writeByte(10)
      ..write(obj.images)
      ..writeByte(11)
      ..write(obj.contains);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpecialDealsAddToCartDBModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
