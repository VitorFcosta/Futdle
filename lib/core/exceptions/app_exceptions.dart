/// Exceção lançada quando a API retorna erro ou dados inválidos.
class ApiException implements Exception {
  final String message;
  final int? statusCode;

  const ApiException(this.message, {this.statusCode});

  @override
  String toString() => 'ApiException: $message (status: $statusCode)';
}

/// Exceção lançada quando nenhum jogador válido foi encontrado após todas as tentativas.
class PlayerNotFoundException implements Exception {
  final String message;

  const PlayerNotFoundException([this.message = 'Nenhum jogador encontrado']);

  @override
  String toString() => 'PlayerNotFoundException: $message';
}

/// Exceção lançada quando o Firestore falha ao salvar/buscar dados.
class FirestoreException implements Exception {
  final String message;

  const FirestoreException(this.message);

  @override
  String toString() => 'FirestoreException: $message';
}

/// Exceção lançada quando a autenticação falha (login, registro, etc.)
class AuthException implements Exception {
  final String message;

  const AuthException(this.message);

  @override
  String toString() => 'AuthException: $message';
}
