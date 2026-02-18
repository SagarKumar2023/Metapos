// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getProductModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetProductDataAdapter extends TypeAdapter<GetProductData> {
  @override
  final int typeId = 32;

  @override
  GetProductData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetProductData(
      id: fields[0] as int,
      name: fields[1] as String,
      imagePath: fields[2] as String,
      price: fields[3] as String,
      discountprice: fields[4] as String,
      desc: fields[5] as String,
      soldOut: fields[6] as int,
      showApp: fields[7] as int,
      showPos: fields[8] as int,
      showQrcode: fields[9] as int,
      makemyown: fields[10] as int,
      chooseNumberItems: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, GetProductData obj) {
    writer
      ..writeByte(12)
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
      ..write(obj.showApp)
      ..writeByte(8)
      ..write(obj.showPos)
      ..writeByte(9)
      ..write(obj.showQrcode)
      ..writeByte(10)
      ..write(obj.makemyown)
      ..writeByte(11)
      ..write(obj.chooseNumberItems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetProductDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
