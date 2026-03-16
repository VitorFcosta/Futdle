import 'package:flutter/material.dart';
import '../components/home_header.dart';
import '../components/daily_games_grid.dart';
import '../components/streak_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF9E7), // Fundo branco baseado no rascunho
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              HomeHeader(username: 'User'),
              SizedBox(height: 30),
              DailyGamesGrid(),
              SizedBox(height: 40),
              StreakCard(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
