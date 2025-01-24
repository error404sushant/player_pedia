// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayerDetailAdapter extends TypeAdapter<PlayerDetail> {
  @override
  final int typeId = 0;

  @override
  PlayerDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayerDetail(
      id: fields[0] as String?,
      name: fields[1] as String?,
      age: fields[2] as int?,
      bestPerformance: fields[3] as String?,
      aboutPlayer: fields[9] as String?,
      totalScoreDay: fields[4] as int?,
      totalScoreYear: fields[5] as int?,
      totalWickets: fields[6] as int?,
      photoUrl: fields[7] as String?,
      createdAt: fields[8] as String?,
      isLiked: fields[10] as bool?,
      totalPeriodicScore: fields[11] as TotalPeriodicScore?,
    );
  }

  @override
  void write(BinaryWriter writer, PlayerDetail obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.bestPerformance)
      ..writeByte(4)
      ..write(obj.totalScoreDay)
      ..writeByte(5)
      ..write(obj.totalScoreYear)
      ..writeByte(6)
      ..write(obj.totalWickets)
      ..writeByte(7)
      ..write(obj.photoUrl)
      ..writeByte(8)
      ..write(obj.createdAt)
      ..writeByte(9)
      ..write(obj.aboutPlayer)
      ..writeByte(10)
      ..write(obj.isLiked)
      ..writeByte(11)
      ..write(obj.totalPeriodicScore);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayerDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TotalPeriodicScoreAdapter extends TypeAdapter<TotalPeriodicScore> {
  @override
  final int typeId = 1;

  @override
  TotalPeriodicScore read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TotalPeriodicScore(
      day: fields[0] as int?,
      yearly: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, TotalPeriodicScore obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.yearly);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TotalPeriodicScoreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
