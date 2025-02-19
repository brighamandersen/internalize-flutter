// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passage_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PassageAdapter extends TypeAdapter<Passage> {
  @override
  final int typeId = 0;

  @override
  Passage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Passage(
      id: fields[0] as String,
      title: fields[1] as String,
      body: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Passage obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.body);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PassageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
