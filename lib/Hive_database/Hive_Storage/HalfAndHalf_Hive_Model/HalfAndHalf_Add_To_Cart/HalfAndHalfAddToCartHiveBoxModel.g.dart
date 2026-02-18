// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HalfAndHalfAddToCartHiveBoxModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HalfAndHalfAddToCartDBModelAdapter
    extends TypeAdapter<HalfAndHalfAddToCartDBModel> {
  @override
  final int typeId = 9;

  @override
  HalfAndHalfAddToCartDBModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HalfAndHalfAddToCartDBModel(
      firstHalfSelectedAddons: (fields[0] as List).cast<CatAddonsDataArray>(),
      secondHalfSelectedAddons: (fields[1] as List).cast<CatAddonsDataArray>(),
      firstHalfSelect: fields[2] as String?,
      firstHalfSelectedName: fields[3] as String?,
      firstHalfSelectedNameId: fields[4] as String?,
      firstHalfSelectedVariant: fields[5] as String?,
      firstHalfSelectedPrice: fields[6] as String?,
      secondHalfSelect: fields[7] as String?,
      secondHalfSelectedName: fields[8] as String?,
      secondHalfSelectedNameId: fields[9] as String?,
      secondHalfSelectedVariant: fields[10] as String?,
      secondHalfSelectedPrice: fields[11] as String?,
      firstHalfSelectedRemoveItems: (fields[12] as List).cast<String>(),
      secondHalfSelectedRemoveItems: (fields[13] as List).cast<String>(),
      productName: fields[14] as String,
      totalPrice: fields[15] as String,
      productId: fields[16] as String,
      productDesc: fields[17] as String,
      productCount: fields[18] as String?,
      catId: fields[21] as String?,
      catName: fields[19] as String?,
      type: fields[20] as String?,
      contains: fields[22] as String?,
      image: fields[23] as String?,
      firstHalfSelectedAddonsAvailable: fields[24] as String?,
      secondHalfSelectedAddonsAvailable: fields[25] as String?,
      gtpOfQtyInToProductPrice: fields[26] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HalfAndHalfAddToCartDBModel obj) {
    writer
      ..writeByte(27)
      ..writeByte(0)
      ..write(obj.firstHalfSelectedAddons)
      ..writeByte(1)
      ..write(obj.secondHalfSelectedAddons)
      ..writeByte(2)
      ..write(obj.firstHalfSelect)
      ..writeByte(3)
      ..write(obj.firstHalfSelectedName)
      ..writeByte(4)
      ..write(obj.firstHalfSelectedNameId)
      ..writeByte(5)
      ..write(obj.firstHalfSelectedVariant)
      ..writeByte(6)
      ..write(obj.firstHalfSelectedPrice)
      ..writeByte(7)
      ..write(obj.secondHalfSelect)
      ..writeByte(8)
      ..write(obj.secondHalfSelectedName)
      ..writeByte(9)
      ..write(obj.secondHalfSelectedNameId)
      ..writeByte(10)
      ..write(obj.secondHalfSelectedVariant)
      ..writeByte(11)
      ..write(obj.secondHalfSelectedPrice)
      ..writeByte(12)
      ..write(obj.firstHalfSelectedRemoveItems)
      ..writeByte(13)
      ..write(obj.secondHalfSelectedRemoveItems)
      ..writeByte(14)
      ..write(obj.productName)
      ..writeByte(15)
      ..write(obj.totalPrice)
      ..writeByte(16)
      ..write(obj.productId)
      ..writeByte(17)
      ..write(obj.productDesc)
      ..writeByte(18)
      ..write(obj.productCount)
      ..writeByte(19)
      ..write(obj.catName)
      ..writeByte(20)
      ..write(obj.type)
      ..writeByte(21)
      ..write(obj.catId)
      ..writeByte(22)
      ..write(obj.contains)
      ..writeByte(23)
      ..write(obj.image)
      ..writeByte(24)
      ..write(obj.firstHalfSelectedAddonsAvailable)
      ..writeByte(25)
      ..write(obj.secondHalfSelectedAddonsAvailable)
      ..writeByte(26)
      ..write(obj.gtpOfQtyInToProductPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HalfAndHalfAddToCartDBModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
