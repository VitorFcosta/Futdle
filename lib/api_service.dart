import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Importando o dotenv
import 'models/player_model.dart'; // Importando o modelo que acabamos de criar

class ApiService {
  // Agora a chave não fica mais visível no GitHub! O dotenv lê ela direto do arquivo .env
  final String apikey = dotenv.env['API_KEY'] ?? '';
  final String baseUrl = 'https://v3.football.api-sports.io';

  Future<List<PlayerModel>> updateDailyPlayer(int leagueId, int pagedraw) async {
    final url = Uri.parse('$baseUrl/players?league=$leagueId&season=2024&page=$pagedraw');

    try {
      final response = await http.get(
        url,
        headers: {
          'x-rapidapi-key': apikey,
          'x-rapidapi-host': 'v3.football.api-sports.io'
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['response'] != null && data['response'].isNotEmpty) {
          
          // Mágica do Dart: Transformamos a lista de mapas em uma lista de PlayerModel
          List<dynamic> responseList = data['response'];
          return responseList.map((json) => PlayerModel.fromJson(json)).toList();
        }
      }
    } catch (e) {
      throw Exception('Erro ao buscar jogadores: $e');
    }

    throw Exception('Erro ao buscar jogadores na API ou dados vazios');
  }
}
