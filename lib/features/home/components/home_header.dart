import 'package:flutter/material.dart';
import 'package:futdle/core/theme/app_colors.dart';

/// O avatar usa [CircleAvatar] mostrando a primeira letra do nome do usuário
/// dentro de um círculo com a cor primária do app.
class HomeHeader extends StatelessWidget {
  final String username;

  const HomeHeader({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Título do app — usa headlineMedium (Outfit, bold, cor primária)
          Text(
            'FutDLE',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
            ),
          ),
          Row(
            children: [
              // CircleAvatar mostra a primeira letra do username em maiúscula
              // dentro de um círculo azul. Substitui o antigo ícone "@".
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primary,
                child: Text(
                  username.isNotEmpty ? username[0].toUpperCase() : '?',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Nome do usuário ao lado do avatar
              Text(
                username,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 18,
                  color: AppColors.dark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

