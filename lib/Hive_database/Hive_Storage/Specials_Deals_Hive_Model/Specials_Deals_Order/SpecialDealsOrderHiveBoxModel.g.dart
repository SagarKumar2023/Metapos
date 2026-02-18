// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpecialDealsOrderHiveBoxModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpecialDealsHoldSingleOrderListDBModelAdapter
    extends TypeAdapter<SpecialDealsHoldSingleOrderListDBModel> {
  @override
  final int typeId = 14;

  @override
  SpecialDealsHoldSingleOrderListDBModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpecialDealsHoldSingleOrderListDBModel(
      dealCategory: (fields[4] as List).cast<String>(),
      dealFoodName: (fields[3] as List).cast<String?>(),
      dealNoOfItem: (fields[6] as List).cast<String>(),
      dealId: fields[7] as String,
      dealName: fields[0] as String,
      dealTotalPrice: fields[2] as String,
      dealQty: fields[5] as int,
      dealDesc: fields[8] as String,
      dealPrice: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SpecialDealsHoldSingleOrderListDBModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.dealName)
      ..writeByte(1)
      ..write(obj.dealPrice)
      ..writeByte(2)
      ..write(obj.dealTotalPrice)
      ..writeByte(3)
      ..write(obj.dealFoodName)
      ..writeByte(4)
      ..write(obj.dealCategory)
      ..writeByte(5)
      ..write(obj.dealQty)
      ..writeByte(6)
      ..write(obj.dealNoOfItem)
      ..writeByte(7)
      ..write(obj.dealId)
      ..writeByte(8)
      ..write(obj.dealDesc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpecialDealsHoldSingleOrderListDBModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
