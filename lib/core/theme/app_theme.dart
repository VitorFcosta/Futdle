import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Tema global do app.
/// Usa duas fontes:
/// - **Outfit** → títulos (displayLarge, headlineMedium, titleLarge, titleMedium)
/// - **JetBrains Mono** → corpo de texto e labels

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    // textTheme base usando JetBrains Mono pra todo o corpo
    final bodyTheme = GoogleFonts.jetBrainsMonoTextTheme();

    // Sobrescreve APENAS os níveis de título com a fonte Outfit
    final combinedTheme = bodyTheme.copyWith(
      // displayLarge: textos enormes (raramente usado, mas fica coberto)
      displayLarge: GoogleFonts.outfit(
        fontSize: 34,
        fontWeight: FontWeight.w800,
        color: AppColors.dark,
      ),
      // headlineMedium: subtítulos grandes como "jogos diários"
      headlineMedium: GoogleFonts.outfit(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      ),
      // titleLarge: títulos de seção como "Streaks de vitórias"
      titleLarge: GoogleFonts.outfit(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.dark,
      ),
      // titleMedium: subtítulos menores como "Maior streak"
      titleMedium: GoogleFonts.outfit(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.dark,
      ),
    );

    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      textTheme: combinedTheme,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        surface: AppColors.background,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
      ),
    );
  }
}
