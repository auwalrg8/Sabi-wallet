import 'package:flutter/material.dart';

class RecoverySetScreen extends StatelessWidget {
  const RecoverySetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = [
      Contact(
        name: 'Auwal Abubakar',
        phone: '+234 803 456 7890',
      ),
      Contact(
        name: 'Muhammad buhari',
        phone: '+234 803 456 7890',
      ),
      Contact(
        name: 'Musa Auwal',
        phone: '+234 803 456 7890',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0C0C1A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 30),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Container(
                        width: 96,
                        height: 96,
                        decoration: BoxDecoration(
                          color: const Color(0xFF00FFB2).withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: CustomPaint(
                            size: const Size(56, 56),
                            painter: CheckCirclePainter(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Recovery Set!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF00FFB2),
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          height: 1.38,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(
                        width: 337,
                        child: Text(
                          'Your wallet is now protected. These people can  help you recover if your phone loss or spoil.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFA1A1B2),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.71,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: const Color(0xFF111128),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomPaint(
                                  size: const Size(20, 20),
                                  painter: ShieldIconPainter(),
                                ),
                                const SizedBox(width: 17),
                                const Text(
                                  'Your Recovery Guys',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    height: 1.87,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            ...contacts.asMap().entries.map((entry) {
                              final contact = entry.value;
                              final isLast = entry.key == contacts.length - 1;
                              return Padding(
                                padding: EdgeInsets.only(bottom: isLast ? 0 : 17),
                                child: _buildContactItem(contact),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(21),
                        decoration: BoxDecoration(
                          color: const Color(0xFF111128),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFF7931A).withOpacity(0.3),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const SizedBox(
                          width: 309,
                          child: Text(
                            'Each person don receive one encrypted share via Nostr DM. If you need to recover, any 3 of them go help you get your wallet back.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFA1A1B2),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.83,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to wallet
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF7931A),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Continue to Wallet',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.71,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactItem(Contact contact) {
    return Row(
      children: [
        SizedBox(
          width: 56,
          height: 56,
          child: Stack(
            children: [
              Container(
                width: 56,
                height: 56,
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
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      height: 1.65,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00FFB2),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF0C0C1A),
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: CustomPaint(
                      size: const Size(14, 14),
                      painter: SmallCheckIconPainter(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: 2),
              Text(
                contact.phone,
                style: const TextStyle(
                  color: Color(0xFFA1A1B2),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.67,
                ),
              ),
              const SizedBox(height: 2),
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
        ),
      ],
    );
  }
}

class CheckCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00FFB2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.425;
    
    path.addArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.9,
      5.5,
    );

    canvas.drawPath(path, paint);

    final checkPath = Path();
    checkPath.moveTo(size.width * 0.375, size.height * 0.46);
    checkPath.lineTo(size.width * 0.5, size.height * 0.583);
    checkPath.lineTo(size.width * 0.917, size.height * 0.167);

    canvas.drawPath(checkPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ShieldIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFF7931A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    path.moveTo(size.width * 0.833, size.height * 0.542);
    path.cubicTo(
      size.width * 0.833, size.height * 0.75,
      size.width * 0.687, size.height * 0.853,
      size.width * 0.515, size.height * 0.915,
    );
    path.cubicTo(
      size.width * 0.507, size.height * 0.918,
      size.width * 0.493, size.height * 0.918,
      size.width * 0.486, size.height * 0.914,
    );
    path.cubicTo(
      size.width * 0.313, size.height * 0.853,
      size.width * 0.167, size.height * 0.75,
      size.width * 0.167, size.height * 0.542,
    );
    path.lineTo(size.width * 0.167, size.height * 0.25);
    path.cubicTo(
      size.width * 0.167, size.height * 0.227,
      size.width * 0.176, size.height * 0.206,
      size.width * 0.191, size.height * 0.191,
    );
    path.cubicTo(
      size.width * 0.206, size.height * 0.176,
      size.width * 0.227, size.height * 0.167,
      size.width * 0.25, size.height * 0.167,
    );
    path.cubicTo(
      size.width * 0.333, size.height * 0.167,
      size.width * 0.479, size.height * 0.095,
      size.width * 0.57, size.height * 0.012,
    );
    path.cubicTo(
      size.width * 0.582, size.height * 0.002,
      size.width * 0.599, size.height * -0.004,
      size.width * 0.617, size.height * -0.004,
    );
    path.cubicTo(
      size.width * 0.635, size.height * -0.004,
      size.width * 0.652, size.height * 0.002,
      size.width * 0.664, size.height * 0.012,
    );
    path.cubicTo(
      size.width * 0.755, size.height * 0.095,
      size.width * 0.896, size.height * 0.167,
      size.width * 0.979, size.height * 0.167,
    );
    path.cubicTo(
      size.width * 1.002, size.height * 0.167,
      size.width * 1.023, size.height * 0.176,
      size.width * 1.038, size.height * 0.191,
    );
    path.cubicTo(
      size.width * 1.053, size.height * 0.206,
      size.width * 1.062, size.height * 0.227,
      size.width * 1.062, size.height * 0.25,
    );
    path.lineTo(size.width * 1.062, size.height * 0.542);

    canvas.drawPath(path, paint);

    final checkPath = Path();
    checkPath.moveTo(size.width * 0.375, size.height * 0.5);
    checkPath.lineTo(size.width * 0.458, size.height * 0.583);
    checkPath.lineTo(size.width * 0.625, size.height * 0.417);

    canvas.drawPath(checkPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SmallCheckIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.45;
    
    path.addArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.9,
      5.5,
    );

    canvas.drawPath(path, paint);

    final checkPath = Path();
    checkPath.moveTo(size.width * 0.375, size.height * 0.46);
    checkPath.lineTo(size.width * 0.5, size.height * 0.583);
    checkPath.lineTo(size.width * 0.917, size.height * 0.167);

    canvas.drawPath(checkPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Contact {
  final String name;
  final String phone;

  Contact({
    required this.name,
    required this.phone,
  });
}
