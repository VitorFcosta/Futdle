import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  List<int> topLeagues = [39, 140, 135, 78, 61];
  final random = Random();
  int leagueId = topLeagues[random.nextInt(topLeagues.length)];
  int pagedraw = random.nextInt(15) + 1;
  print('sorteio definido. -> Liga: $leagueId, Pagina: $pagedraw');

  final url = Uri.parse('https://v3.football.api-sports.io/players?league=$leagueId&season=2024&page=$pagedraw');

  try {
    final response = await http.get(
      url,
      headers: {
        'x-rapidapi-key': '49b448b538943d3383dbfdf2f46b7364',
        'x-rapidapi-host': 'v3.football.api-sports.io'
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['response'] != null && data['response'].isNotEmpty) {
        List<dynamic> updateDailyPlayer = data['response'];
        int indexrandon = random.nextInt(updateDailyPlayer.length);
        
        final testr = updateDailyPlayer[indexrandon];
        print('Player: ${testr['player']['name']}');
        
        if (testr['statistics'].isEmpty) {
          print('STATISTICS EMPTY!');
        } else {
          final statistics = testr['statistics'][0];
          print('Team: ${statistics['team']['name']}');
        }
      } else {
        print('Response is empty. Pages limit reached maybe?');
        if (data['errors'] != null) print('Errors: ${data['errors']}');
        if (data['paging'] != null) print('Paging: ${data['paging']}');
      }
    } else {
      print('Status: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro: $e');
  }
}
