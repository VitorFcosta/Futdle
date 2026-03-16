import 'package:flutter/material.dart';

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
          const Text(
            'FutDLE',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              color: Color(0xFF2980B9)
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color:Color(0xFF2C3E50), width: 2),
                ),
                padding: const EdgeInsets.all(4),
                child: const Text(
                  '@',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ), 
              ),
              const SizedBox(width: 8),
              Text(
                username,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2C3E50)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
