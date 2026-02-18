// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DealsAddToCartHiveBoxModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DealsAddToCartDBModelAdapter extends TypeAdapter<DealsAddToCartDBModel> {
  @override
  final int typeId = 10;

  @override
  DealsAddToCartDBModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DealsAddToCartDBModel(
      dealName: fields[0] as String?,
      dealPrice: fields[1] as String?,
      dealsCategory: (fields[4] as List).cast<String>(),
      dealsNumberOfItem: (fields[3] as List).cast<String>(),
      dealSelectedFoodName: (fields[2] as List).cast<String?>(),
      dealId: fields[5] as String?,
      dealDesc: fields[6] as String?,
      productCount: fields[7] as String?,
      extras: fields[8] as String?,
      image: fields[9] as String?,
      contains: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DealsAddToCartDBModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.dealName)
      ..writeByte(1)
      ..write(obj.dealPrice)
      ..writeByte(2)
      ..write(obj.dealSelectedFoodName)
      ..writeByte(3)
      ..write(obj.dealsNumberOfItem)
      ..writeByte(4)
      ..write(obj.dealsCategory)
      ..writeByte(5)
      ..write(obj.dealId)
      ..writeByte(6)
      ..write(obj.dealDesc)
      ..writeByte(7)
      ..write(obj.productCount)
      ..writeByte(8)
      ..write(obj.extras)
      ..writeByte(9)
      ..write(obj.image)
      ..writeByte(10)
      ..write(obj.contains);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DealsAddToCartDBModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
