import 'package:flutter/material.dart';
import 'package:futdle/features/home/components/home_header.dart';
import 'package:futdle/features/home/components/daily_games_grid.dart';
import 'package:futdle/features/home/components/streak_card.dart';
import 'package:futdle/models/mini_game_model.dart';
import 'package:futdle/core/theme/app_colors.dart';

/// Página inicial do Futdle.
/// Exibe o header, grade de mini jogos diários e card de streaks.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final games = MiniGameModel.defaultGames();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HomeHeader(username: 'User'),
              const SizedBox(height: 30),
              DailyGamesGrid(games: games),
              const SizedBox(height: 40),
              const StreakCard(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
