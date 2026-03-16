import 'dart:math';
import 'core/api/api_service.dart';
import 'core/api/api_constants.dart';
import 'core/firebase/firestore_service.dart';
import 'core/exceptions/app_exceptions.dart';
import 'core/logger/app_logger.dart';

/// Gerenciador principal dos jogos.
/// Orquestra a lógica de negócio (sortear jogador) usando
/// [ApiService] para buscar dados e [FirestoreService] para persistir.
class GameManager {
  final ApiService _apiService;
  final FirestoreService _firestoreService;

  GameManager({
    ApiService? apiService,
    FirestoreService? firestoreService,
  })  : _apiService = apiService ?? ApiService(),
        _firestoreService = firestoreService ?? FirestoreService();

  /// Sorteia um jogador aleatório das top ligas e salva no Firestore.
  /// Tenta até [maxAttempts] vezes caso o jogador não tenha estatísticas.
  Future<void> randomPlayer() async {
    final random = Random();
    const int maxAttempts = 5;

    for (int attempt = 1; attempt <= maxAttempts; attempt++) {
      final leagueId = ApiConstants.topLeagues[
          random.nextInt(ApiConstants.topLeagues.length)];
      final randomPage = random.nextInt(3) + 1;

      AppLogger.info(
        'Sorteio definido -> Liga: $leagueId, Página: $randomPage '
        '(Tentativa $attempt)',
      );

      try {
        final players = await _apiService.fetchPlayers(leagueId, randomPage);

        if (players.isEmpty) continue;

        final player = players[random.nextInt(players.length)];

        if (player.statistics == null) {
          AppLogger.warning(
            'Jogador ${player.name} sem statistics. Tentando novamente...',
          );
          continue;
        }

        await _firestoreService.saveDailyPlayer(player);
        AppLogger.info('Jogador sorteado com sucesso: "${player.name}"');
        return;
      } catch (e) {
        AppLogger.error('Erro na tentativa $attempt', e);

        if (attempt >= maxAttempts) {
          throw const PlayerNotFoundException(
            'Não foi possível sortear um jogador. Tente novamente mais tarde.',
          );
        }
      }
    }

    throw const PlayerNotFoundException(
      'Limite de tentativas excedido (sem dados de estatística)',
    );
  }
}