class PlayerDetail {
  String? id;
  String? name;
  int? age;
  String? bestPerformance;
  int? totalScoreDay;
  int? totalScoreYear;
  int? totalWickets;
  String? photoUrl;
  String? createdAt;
  String? aboutPlayer;
  bool? isLiked = false;
  TotalPeriodicScore? totalPeriodicScore;

  PlayerDetail(
      {this.id,
        this.name,
        this.age,
        this.bestPerformance,
        this.aboutPlayer,
        this.totalScoreDay,
        this.totalScoreYear,
        this.totalWickets,
        this.photoUrl,
        this.createdAt,
        this.totalPeriodicScore
      });

  PlayerDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    bestPerformance = json['best_performance'];
    totalScoreDay = json['total_score_day'];
    totalScoreYear = json['total_score_year'];
    totalWickets = json['total_wickets'];
    aboutPlayer = json['about_player'];
    photoUrl = json['photo_url'];
    createdAt = json['created_at'];
    totalPeriodicScore = json['total_periodic_score'] != null
        ? new TotalPeriodicScore.fromJson(json['total_periodic_score'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    data['best_performance'] = this.bestPerformance;
    data['total_score_day'] = this.totalScoreDay;
    data['about_player'] = this.aboutPlayer;
    data['total_score_year'] = this.totalScoreYear;
    data['total_wickets'] = this.totalWickets;
    data['photo_url'] = this.photoUrl;
    data['created_at'] = this.createdAt;
    if (totalPeriodicScore != null) {
      data['total_periodic_score'] = this.totalPeriodicScore!.toJson();
    }
    return data;
  }
}
class TotalPeriodicScore {
  int? day;
  int? yearly;

  TotalPeriodicScore({this.day, this.yearly});

  TotalPeriodicScore.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    yearly = json['yearly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['yearly'] = this.yearly;
    return data;
  }
}


