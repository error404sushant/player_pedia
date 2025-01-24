import 'package:hive/hive.dart';

part 'player_detail.g.dart'; // Required for generated adapter code

@HiveType(typeId: 0) // Unique typeId for PlayerDetail
class PlayerDetail extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  int? age;

  @HiveField(3)
  String? bestPerformance;

  @HiveField(4)
  int? totalScoreDay;

  @HiveField(5)
  int? totalScoreYear;

  @HiveField(6)
  int? totalWickets;

  @HiveField(7)
  String? photoUrl;

  @HiveField(8)
  String? createdAt;

  @HiveField(9)
  String? aboutPlayer;

  @HiveField(10)
  bool? isLiked;

  @HiveField(11)
  TotalPeriodicScore? totalPeriodicScore;

  PlayerDetail({
    this.id,
    this.name,
    this.age,
    this.bestPerformance,
    this.aboutPlayer,
    this.totalScoreDay,
    this.totalScoreYear,
    this.totalWickets,
    this.photoUrl,
    this.createdAt,
    this.isLiked = false,
    this.totalPeriodicScore,
  });

  factory PlayerDetail.fromJson(Map<String, dynamic> json) {
    return PlayerDetail(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      bestPerformance: json['best_performance'],
      totalScoreDay: json['total_score_day'],
      totalScoreYear: json['total_score_year'],
      totalWickets: json['total_wickets'],
      aboutPlayer: json['about_player'],
      photoUrl: json['photo_url'],
      createdAt: json['created_at'],
      totalPeriodicScore: json['total_periodic_score'] != null
          ? TotalPeriodicScore.fromJson(json['total_periodic_score'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['age'] = age;
    data['best_performance'] = bestPerformance;
    data['total_score_day'] = totalScoreDay;
    data['total_score_year'] = totalScoreYear;
    data['total_wickets'] = totalWickets;
    data['about_player'] = aboutPlayer;
    data['photo_url'] = photoUrl;
    data['created_at'] = createdAt;
    if (totalPeriodicScore != null) {
      data['total_periodic_score'] = totalPeriodicScore!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 1) // Unique typeId for TotalPeriodicScore
class TotalPeriodicScore extends HiveObject {
  @HiveField(0)
  int? day;

  @HiveField(1)
  int? yearly;

  TotalPeriodicScore({this.day, this.yearly});

  factory TotalPeriodicScore.fromJson(Map<String, dynamic> json) {
    return TotalPeriodicScore(
      day: json['day'],
      yearly: json['yearly'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['day'] = day;
    data['yearly'] = yearly;
    return data;
  }
}
