import 'package:flutter/material.dart';
import '../widgets/contact_card.dart';
import 'recovery_set_screen.dart';

class SocialRecoveryScreen extends StatefulWidget {
  const SocialRecoveryScreen({super.key});

  @override
  State<SocialRecoveryScreen> createState() => _SocialRecoveryScreenState();
}

class _SocialRecoveryScreenState extends State<SocialRecoveryScreen> {
  final List<Contact> contacts = [
    Contact(
      name: 'Auwal Abubakar',
      phone: '+234 803 456 7890',
      isNostr: true,
    ),
    Contact(
      name: 'Mubarak ibrahim',
      phone: '+234 803 456 7890',
      isNostr: false,
    ),
    Contact(
      name: 'Muhammad buhari',
      phone: '+234 803 456 7890',
      isNostr: true,
    ),
    Contact(
      name: 'Musa Auwal',
      phone: '+234 803 456 7890',
      isNostr: true,
    ),
  ];

  final Set<int> selectedIndices = {};

  void _toggleContact(int index) {
    setState(() {
      if (selectedIndices.contains(index)) {
        selectedIndices.remove(index);
      } else if (selectedIndices.length < 3) {
        selectedIndices.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool hasSelection = selectedIndices.length == 3;
    
    return Scaffold(
      backgroundColor: const Color(0xFF0C0C1A),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 29),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: CustomPaint(
                            size: const Size(24, 24),
                            painter: BackArrowPainter(),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Social Recovery',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            height: 1.78,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Container(
                      padding: const EdgeInsets.all(21),
                      decoration: BoxDecoration(
                        color: const Color(0xFF111128),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFF7931A)),
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
                              Container(
                                width: 48,
                                height: 48,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF7931A).withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: CustomPaint(
                                  painter: ShieldIconPainter(),
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: Text(
                                  'Who you want to trust with your money if phone loss or  spoil?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    height: 1.87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'No seed phrase.  ',
                                  style: TextStyle(
                                    color: Color(0xFFF7931A),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    height: 1.83,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                                TextSpan(
                                  text: 'Just pick 3 of your people who use Bitcoin/Nostr. We go split your wallet into secret shares and send to them via encrypted Nostr DM.',
                                  style: TextStyle(
                                    color: Color(0xFFA1A1B2),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 1.83,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Selected: ${selectedIndices.length}/3',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.71,
                              ),
                            ),
                            const Text(
                              'Pick 3 people wey you trust',
                              style: TextStyle(
                                color: Color(0xFFA1A1B2),
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomPaint(
                              size: const Size(16, 16),
                              painter: PlusIconPainter(),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'Add Contact',
                              style: TextStyle(
                                color: Color(0xFFF7931A),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 1.67,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: contacts.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 15),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => _toggleContact(index),
                          child: ContactCard(
                            contact: contacts[index],
                            isSelected: selectedIndices.contains(index),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(31),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: hasSelection
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RecoverySetScreen(),
                                ),
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: hasSelection
                            ? const Color(0xFFF7931A)
                            : const Color(0xFF814F1A),
                        disabledBackgroundColor: const Color(0xFF814F1A),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Encrypt & send recovery shares',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.71,
                        ),
                      ),
                    ),
                  ),
                  if (hasSelection) ...[
                    const SizedBox(height: 20),
                    const Text(
                      'Each person will receive one encrypted share via Nostr DM',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFA1A1B2),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        height: 1.6,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    path.moveTo(size.width * 0.5, size.width * 0.79);
    path.lineTo(size.width * 0.21, size.width * 0.5);
    path.lineTo(size.width * 0.5, size.width * 0.21);

    canvas.drawPath(path, paint);

    canvas.drawLine(
      Offset(size.width * 0.79, size.width * 0.5),
      Offset(size.width * 0.21, size.width * 0.5),
      paint,
    );
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

class PlusIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFF7931A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawLine(
      Offset(size.width * 0.208, size.height * 0.5),
      Offset(size.width * 0.792, size.height * 0.5),
      paint,
    );

    canvas.drawLine(
      Offset(size.width * 0.5, size.height * 0.208),
      Offset(size.width * 0.5, size.height * 0.792),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Contact {
  final String name;
  final String phone;
  final bool isNostr;

  Contact({
    required this.name,
    required this.phone,
    required this.isNostr,
  });
}
