// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelclass.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VideoDatassAdapter extends TypeAdapter<VideoDatass> {
  @override
  final int typeId = 1;

  @override
  VideoDatass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VideoDatass(
      title: fields[1] as String,
      folderName: fields[2] as String,
      size: fields[3] as String,
      duration: fields[4] as String,
      path: fields[5] as String,
      Date: fields[6] as String,
    )..id = fields[0] as int?;
  }

  @override
  void write(BinaryWriter writer, VideoDatass obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.folderName)
      ..writeByte(3)
      ..write(obj.size)
      ..writeByte(4)
      ..write(obj.duration)
      ..writeByte(5)
      ..write(obj.path)
      ..writeByte(6)
      ..write(obj.Date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoDatassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
