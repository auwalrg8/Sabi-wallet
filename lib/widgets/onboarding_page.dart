import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  final String description;

  const OnboardingPage({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 31),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 30),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFF7931A),
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.75,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFA1A1B2),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 2.0,
            ),
          ),
        ],
      ),
    );
  }
}
