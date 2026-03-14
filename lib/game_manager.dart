import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'api_service.dart';
import 'models/player_model.dart'; 

class GameManager {
  final ApiService _api = ApiService();
  final FirebaseFirestore _bd = FirebaseFirestore.instance;

  Future<void> randonplayer() async {
    List<int> topLeagues = [39, 140, 135, 78, 61];
    final random = Random();

    bool playerFound = false;
    int maxAttempts = 5; 
    int attempts = 0;

    while (!playerFound && attempts < maxAttempts) {
      attempts++;
      int leagueId = topLeagues[random.nextInt(topLeagues.length)];
      int pagedraw = random.nextInt(3) + 1;
      
      print('sorteio definido. -> Liga: $leagueId, Pagina: $pagedraw (Tentativa $attempts)');

      try {
        List<PlayerModel> updateDailyPlayer = await _api.updateDailyPlayer(leagueId, pagedraw);
        
        if (updateDailyPlayer.isNotEmpty) {
          int indexrandon = random.nextInt(updateDailyPlayer.length);
          final player = updateDailyPlayer[indexrandon];


          if (player.statistics != null) {
            final stats = player.statistics!;

            await _bd.collection('daily_player').doc('today').set({
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
          } else {
            print('Jogador ${player.name} veio sem statistics. Sorteando novamente...');
          }
        }
      } catch (e) {
        print('Erro na tentativa $attempts: $e');
        if (attempts >= maxAttempts) {
           throw Exception('Não foi possível sortear um jogador. Tente novamente mais tarde.');
        }
      }
    }

    if (!playerFound) {
      throw Exception('Limite de tentativas excedido na API (sem dados de estatística)');
    }
  }
}