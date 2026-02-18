// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HalfAndHalfOrderHiveBoxModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HalfAndHalfHoldSingleOrderDBModelAdapter
    extends TypeAdapter<HalfAndHalfHoldSingleOrderDBModel> {
  @override
  final int typeId = 13;

  @override
  HalfAndHalfHoldSingleOrderDBModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HalfAndHalfHoldSingleOrderDBModel(
      productPrice: fields[2] as String,
      productName: fields[0] as String,
      productTotalPrice: fields[4] as String,
      productId: fields[3] as String,
      secondHalfSelectedRemoveItems: (fields[9] as List).cast<String>(),
      grandTotalPrice: fields[5] as String,
      qty: fields[1] as int,
      secondHalfRemoveData: (fields[10] as List).cast<String>(),
      secondHalfAddonData: (fields[7] as List).cast<CatAddonsDataArray>(),
      firstHalfRemoveData: (fields[8] as List).cast<String>(),
      firstHalfAddonData: (fields[6] as List).cast<CatAddonsDataArray>(),
      productDesc: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HalfAndHalfHoldSingleOrderDBModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.productName)
      ..writeByte(1)
      ..write(obj.qty)
      ..writeByte(2)
      ..write(obj.productPrice)
      ..writeByte(3)
      ..write(obj.productId)
      ..writeByte(4)
      ..write(obj.productTotalPrice)
      ..writeByte(5)
      ..write(obj.grandTotalPrice)
      ..writeByte(6)
      ..write(obj.firstHalfAddonData)
      ..writeByte(7)
      ..write(obj.secondHalfAddonData)
      ..writeByte(8)
      ..write(obj.firstHalfRemoveData)
      ..writeByte(9)
      ..write(obj.secondHalfSelectedRemoveItems)
      ..writeByte(10)
      ..write(obj.secondHalfRemoveData)
      ..writeByte(11)
      ..write(obj.productDesc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HalfAndHalfHoldSingleOrderDBModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
