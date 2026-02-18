// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Category_Hold_Multiple_order_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryHoldMultipleOrderDBAdapter extends TypeAdapter<CategoryHoldMultipleOrderDB> {
  @override
  final int typeId = 41;

  @override
  CategoryHoldMultipleOrderDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryHoldMultipleOrderDB(
      id: fields[0] as int,
      productName: fields[1] as String,
      productPrice: fields[2] as String,
      productTotalPrice: fields[3] as String,
      variantOptionSelectedName: fields[5] as String?,
      variantLargeSelectedName: fields[4] as String?,
      variantXLargeSelectedName: fields[6] as String?,
      variantOptionSelectedId: fields[8] as String?,
      variantLargeSelectedId: fields[7] as String?,
      variantXLargeSelectedId: fields[9] as String?,
      desc: fields[10] as String,
      productCount: fields[11] as String?,
      selectedAddons: (fields[12] as List?)?.cast<String>(),
      extras: fields[13] as String?,
      contains: fields[15] as String?,
      images: fields[14] as String?,
      type: fields[16] as String?,
      catName: fields[17] as String?,
      catId: fields[18] as String?,
      gstApplicable: fields[19] as String?,
      gstTaxPercentage: fields[20] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryHoldMultipleOrderDB obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.productPrice)
      ..writeByte(3)
      ..write(obj.productTotalPrice)
      ..writeByte(4)
      ..write(obj.variantLargeSelectedName)
      ..writeByte(5)
      ..write(obj.variantOptionSelectedName)
      ..writeByte(6)
      ..write(obj.variantXLargeSelectedName)
      ..writeByte(7)
      ..write(obj.variantLargeSelectedId)
      ..writeByte(8)
      ..write(obj.variantOptionSelectedId)
      ..writeByte(9)
      ..write(obj.variantXLargeSelectedId)
      ..writeByte(10)
      ..write(obj.desc)
      ..writeByte(11)
      ..write(obj.productCount)
      ..writeByte(12)
      ..write(obj.selectedAddons)
      ..writeByte(13)
      ..write(obj.extras)
      ..writeByte(14)
      ..write(obj.images)
      ..writeByte(15)
      ..write(obj.contains)
      ..writeByte(16)
      ..write(obj.type)
      ..writeByte(17)
      ..write(obj.catName)
      ..writeByte(18)
      ..write(obj.catId)
      ..writeByte(19)
      ..write(obj.gstApplicable)
      ..writeByte(20)
      ..write(obj.gstTaxPercentage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryHoldMultipleOrderDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
