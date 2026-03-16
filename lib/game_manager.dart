import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'api_service.dart';
import 'models/player_model.dart'; 

class GameManager {
  final ApiService _apiService;
  final FirebaseFirestore _db;

  GameManager({ApiService? apiService, FirebaseFirestore? db})
      : _apiService = apiService ?? ApiService(),
        _db = db ?? FirebaseFirestore.instance;

  Future<void> randomPlayer() async {
    List<int> topLeagues = [39, 140, 135, 78, 61];
    final random = Random();

    bool playerFound = false;
    int maxAttempts = 5; 
    int attempts = 0;

    while (!playerFound && attempts < maxAttempts) {
      attempts++;
      int leagueId = topLeagues[random.nextInt(topLeagues.length)];
      int randomPage = random.nextInt(3) + 1;
      
      print('sorteio definido. -> Liga: $leagueId, Pagina: $randomPage (Tentativa $attempts)');

      try {
        List<PlayerModel> players = await _apiService.updateDailyPlayer(leagueId, randomPage);
        
        if (players.isEmpty) {
          continue;
        }

        int randomIndex = random.nextInt(players.length);
        final player = players[randomIndex];

        if (player.statistics == null) {
          print('Jogador ${player.name} veio sem statistics. Sorteando novamente...');
          continue;
        }

        final stats = player.statistics!;

        await _db.collection('daily_player').doc('today').set({
            'name': player.name,
            'age': player.age,
            'nationality': player.nationality,
            'team': stats.teamName,
            'league': stats.leagueName,
            'position': stats.position,
            'photo': player.photo,
            'updatedAt': FieldValue.serverTimestamp(),
          }
        );
        print('jogador sorteado com sucesso "${player.name}"');
        playerFound = true; 

      } catch (e) {
        print('Erro na tentativa $attempts: $e');
        if (attempts >= maxAttempts) {
           throw 'Não foi possível sortear um jogador. Tente novamente mais tarde.';
        }
      }
    }

    if (!playerFound) {
      throw 'Limite de tentativas excedido na API (sem dados de estatística)';
    }
  }
}