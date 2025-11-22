import 'package:flutter/material.dart';
import '../screens/social_recovery_screen.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  final bool isSelected;
  final bool showStatus;

  const ContactCard({
    super.key,
    required this.contact,
    this.isSelected = false,
    this.showStatus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF0A0A17) : const Color(0xFF111128),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? const Color(0xFFF7931A) : Colors.transparent,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFF7931A),
                      Color(0xFFEA580C),
                    ],
                    stops: [0.25, 0.96],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    contact.name[0].toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      height: 1.87,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        contact.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.71,
                        ),
                      ),
                      if (contact.isNostr) ...[
                        const SizedBox(width: 15),
                        const Text(
                          'Nostr',
                          style: TextStyle(
                            color: Color(0xFF00FFB2),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ],
                  ),
                  Text(
                    contact.phone,
                    style: const TextStyle(
                      color: Color(0xFFA1A1B2),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.67,
                    ),
                  ),
                  if (showStatus)
                    const Text(
                      '✓ Share is send',
                      style: TextStyle(
                        color: Color(0xFF00FFB2),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        height: 1.6,
                      ),
                    ),
                ],
              ),
            ],
          ),
          if (isSelected)
            Container(
              width: 28,
              height: 28,
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Color(0xFFF7931A),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 18,
              ),
            ),
        ],
      ),
    );
  }
}
