import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/player_model.dart';
import '../exceptions/app_exceptions.dart';

/// Serviço responsável por toda interação com o Firestore.
/// Isola a lógica de banco do restante do app.
class FirestoreService {
  final FirebaseFirestore _db;

  FirestoreService({FirebaseFirestore? db})
      : _db = db ?? FirebaseFirestore.instance;

  /// Salva o jogador do dia na collection `daily_player`, documento `today`.
  Future<void> saveDailyPlayer(PlayerModel player) async {
    try {
      final stats = player.statistics;

      await _db.collection('daily_player').doc('today').set({
        'name': player.name,
        'age': player.age,
        'nationality': player.nationality,
        'team': stats?.teamName,
        'league': stats?.leagueName,
        'position': stats?.position,
        'photo': player.photo,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw FirestoreException('Erro ao salvar jogador do dia: $e');
    }
  }

  /// Busca o jogador do dia salvo no Firestore.
  /// Retorna `null` se não existir.
  Future<Map<String, dynamic>?> getDailyPlayer() async {
    try {
      final doc = await _db.collection('daily_player').doc('today').get();
      return doc.data();
    } catch (e) {
      throw FirestoreException('Erro ao buscar jogador do dia: $e');
    }
  }
}
