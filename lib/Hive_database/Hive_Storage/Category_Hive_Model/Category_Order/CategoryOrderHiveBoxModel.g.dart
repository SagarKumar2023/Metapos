// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CategoryOrderHiveBoxModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryHoldSingleOrderModelAdapter
    extends TypeAdapter<CategoryHoldSingleOrderModel> {
  @override
  final int typeId = 12;

  @override
  CategoryHoldSingleOrderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryHoldSingleOrderModel(
      productId: fields[0] as int,
      productName: fields[1] as String,
      productPrice: fields[2] as String,
      productTotalPrice: fields[5] as String,
      qty: fields[7] as int,
      productDesc: fields[4] as String,
      variantOption: fields[3] as String,
      grandTotalPrice: fields[6] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryHoldSingleOrderModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.productPrice)
      ..writeByte(3)
      ..write(obj.variantOption)
      ..writeByte(4)
      ..write(obj.productDesc)
      ..writeByte(5)
      ..write(obj.productTotalPrice)
      ..writeByte(6)
      ..write(obj.grandTotalPrice)
      ..writeByte(7)
      ..write(obj.qty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryHoldSingleOrderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
