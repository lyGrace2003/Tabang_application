// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClientsAdapter extends TypeAdapter<Clients> {
  @override
  final int typeId = 1;

  @override
  Clients read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Clients(
      firstName: fields[0] as String,
      lastName: fields[1] as String,
      contactNum: fields[2] as String,
      emailAd: fields[3] as String,
      password: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Clients obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.contactNum)
      ..writeByte(3)
      ..write(obj.emailAd)
      ..writeByte(4)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
