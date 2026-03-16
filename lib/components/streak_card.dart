import 'package:flutter/material.dart';

class StreakCard extends StatelessWidget {
  const StreakCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF9E7),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF2C3E50), width: 2.5),
      ),
      child: Column(
        children: [
          const Text(
            'Streaks de vitorias',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Maior streak',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      // Substitua esses placeholders textuais pelos valores reais do backend depois
                      const Text(
                        '--',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '--',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(
                  color: const Color(0xFF2C3E50),
                  thickness: 2,
                  width: 32,
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Jogos com mais vitorias',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                       // Substitua esses placeholders textuais pelos dados reais
                      const Text(
                        '---',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '---',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
