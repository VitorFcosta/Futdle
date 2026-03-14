class PlayerModel {
  final int id;
  final String name;
  final int? age;
  final String? nationality;
  final String? photo;
  final PlayerStatistics? statistics;

  PlayerModel({
    required this.id,
    required this.name,
    this.age,
    this.nationality,
    this.photo,
    this.statistics,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    final player = json['player'];
    final statsList = json['statistics'] as List?;
    PlayerStatistics? stats;
    
    // Pegar apenas a primeira estatística se a lista não for vazia
    if (statsList != null && statsList.isNotEmpty) {
      stats = PlayerStatistics.fromJson(statsList[0]);
    }

    return PlayerModel(
      id: player['id'],
      name: player['name'],
      age: player['age'],
      nationality: player['nationality'],
      photo: player['photo'],
      statistics: stats,
    );
  }
}

class PlayerStatistics {
  final String? teamName;
  final String? leagueName;
  final String? position;

  PlayerStatistics({
    this.teamName,
    this.leagueName,
    this.position,
  });

  factory PlayerStatistics.fromJson(Map<String, dynamic> json) {
    return PlayerStatistics(
      teamName: json['team']?['name'],
      leagueName: json['league']?['name'],
      position: json['games']?['position'],
    );
  }
}
