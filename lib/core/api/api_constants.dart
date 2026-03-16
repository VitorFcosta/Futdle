class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://v3.football.api-sports.io';

  /// IDs das top 5 ligas europeias na API-Football.
  /// Premier League (39), La Liga (140), Serie A (135), Bundesliga (78), Ligue 1 (61).
  static const List<int> topLeagues = [39, 140, 135, 78, 61];

  /// Calcula a temporada atual baseado na data.
  static int get currentSeason {
    final now = DateTime.now();
    return now.month >= 8 ? now.year : now.year - 1;
  }
}
