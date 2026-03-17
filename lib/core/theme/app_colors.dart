import 'package:flutter/material.dart';

/// Paleta de cores centralizada do app.
class AppColors {
  AppColors._(); // impede instanciação

  /// Azul principal — títulos, destaques, botões primários.
  static const Color primary = Color(0xFF2980B9);

  /// Preto — bordas, textos fortes, ícones.
  static const Color dark = Color(0xFF2C3E50);

  /// Fundo creme claro das telas e cards.
  static const Color background = Color(0xFFFEF9E7);

  /// Branco puro para textos sobre fundos escuros.
  static const Color white = Colors.white;

  /// Verde para feedbacks de sucesso.
  static const Color success = Color(0xFF27AE60);

  /// Vermelho para feedbacks de erro.
  static const Color error = Color(0xFFE74C3C);

  /// Cinza para textos secundários e placeholders.
  static const Color grey = Color(0xFF95A5A6);

  /// Amarelo para feedbacks parciais (ex: atributo parecido no Wordle).
  static const Color warning = Color(0xFFF39C12);
}
