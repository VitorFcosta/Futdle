import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../models/player_model.dart';
import 'api_constants.dart';
import '../exceptions/app_exceptions.dart';

/// Serviço responsável pelas chamadas à API-Football.
class ApiService {
  final String _apiKey = dotenv.env['API_KEY'] ?? '';
  final String _baseUrl = ApiConstants.baseUrl;

  /// Busca jogadores de uma liga/página específica na API.
  /// Retorna uma lista de [PlayerModel] parseados.
  Future<List<PlayerModel>> fetchPlayers(int leagueId, int page) async {
    final season = ApiConstants.currentSeason;
    final url = Uri.parse(
      '$_baseUrl/players?league=$leagueId&season=$season&page=$page',
    );

    try {
      final response = await http.get(
        url,
        headers: {
          'x-rapidapi-key': _apiKey,
          'x-rapidapi-host': 'v3.football.api-sports.io',
        },
      );

      if (response.statusCode != 200) {
        throw ApiException(
          'API retornou status ${response.statusCode}',
          statusCode: response.statusCode,
        );
      }

      final data = jsonDecode(response.body);

      if (data['response'] != null && data['response'].isNotEmpty) {
        final List<dynamic> responseList = data['response'];
        return responseList
            .map((json) => PlayerModel.fromJson(json))
            .toList();
      }

      return [];
    } catch (e) {
      if (e is ApiException) rethrow;
      throw ApiException('Erro ao buscar jogadores: $e');
    }
  }
}
