import 'package:flutter/material.dart';

class DailyGamesGrid extends StatelessWidget {
  const DailyGamesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'jogos diários',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Color(0xFF2980B9),
          ),
        ),
        const SizedBox(height: 24),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 60),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 40,
            crossAxisSpacing: 40,
            childAspectRatio: 1,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF2C3E50), width: 2.5),
              ),
              child: Material(
                color: Colors.transparent,
                shape: const CircleBorder(),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
