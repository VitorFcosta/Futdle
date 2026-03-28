import 'package:flutter/material.dart';

/// Representa um mini jogo diário exibido na grade da Home.
class MiniGameModel {
  final String id;
  final String name;
  final IconData icon;
  final Color color;
  final bool isAvailable;
  final bool isCompleted;

  const MiniGameModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    this.isAvailable = true,
    this.isCompleted = false,
  });

  /// Lista padrão dos mini jogos disponíveis.
  static List<MiniGameModel> defaultGames() {
    return const [
      MiniGameModel(
        id: 'wordle',
        name: 'Wordle',
        icon: Icons.person_search,
        color: Color(0xFF2980B9),
      ),
      MiniGameModel(
        id: 'silhouette',
        name: 'Silhueta',
        icon: Icons.person_outline,
        color: Color(0xFF8E44AD),
      ),
      MiniGameModel(
        id: 'shirt_number',
        name: 'Camisa',
        icon: Icons.sports_soccer,
        color: Color(0xFF27AE60),
      ),
      MiniGameModel(
        id: 'career_path',
        name: 'Carreira',
        icon: Icons.timeline,
        color: Color(0xFFE67E22),
      ),
      MiniGameModel(
        id: 'stats_quiz',
        name: 'Stats',
        icon: Icons.bar_chart,
        color: Color(0xFFE74C3C),
      ),
      MiniGameModel(
        id: 'logo_quiz',
        name: 'Escudo',
        icon: Icons.shield,
        color: Color(0xFF1ABC9C),
        isAvailable: false,
      ),
    ];
  }
}
