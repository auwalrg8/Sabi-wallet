import 'package:flutter/material.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _onGetStarted();
    }
  }

  void _onSkipPressed() {
    _onGetStarted();
  }

  void _onGetStarted() {
    // TODO: Navigate to home or main app screen
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => const HomeScreen()),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C0C1A),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 13, right: 31),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _onSkipPressed,
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Color(0xFFA1A1B2),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.71,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  OnboardingPage(
                    icon: _buildBitcoinIcon(),
                    title: 'Your Bitcoin, Your Control',
                    subtitle: 'No problems with banks or government',
                    description:
                        'Keep your Bitcoin safe. Nobody fit block your money or freeze your account.',
                  ),
                  OnboardingPage(
                    icon: _buildLightningIcon(),
                    title: 'Send Money Fast',
                    subtitle: 'Lightning fast payments',
                    description:
                        'Send Bitcoin to anybody for free or small fee. i will  reach in seconds, not days.',
                  ),
                  OnboardingPage(
                    icon: _buildHandshakeIcon(),
                    title: 'Trade P2P, No Middleman',
                    subtitle: 'Buy and sell Bitcoin directly',
                    description:
                        'Connect with other Nigerians to buy and sell Bitcoin. Your money, your rules.',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 31, right: 31, bottom: 26),
              child: Column(
                children: [
                  PageIndicator(
                    currentPage: _currentPage,
                    pageCount: 3,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onNextPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF7931A),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _currentPage == 2 ? 'Get started' : 'Next',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.71,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBitcoinIcon() {
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: const BoxDecoration(
              color: Color(0xFF111128),
              shape: BoxShape.circle,
            ),
          ),
          Center(
            child: CustomPaint(
              size: const Size(80, 80),
              painter: BitcoinLogoPainter(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLightningIcon() {
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: const BoxDecoration(
              color: Color(0xFF111128),
              shape: BoxShape.circle,
            ),
          ),
          Center(
            child: CustomPaint(
              size: const Size(80, 80),
              painter: LightningPainter(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHandshakeIcon() {
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: const BoxDecoration(
              color: Color(0xFF111128),
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            left: 40,
            top: 48,
            child: CustomPaint(
              size: const Size(80, 64),
              painter: HandshakePainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class BitcoinLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFF7931A)
      ..style = PaintingStyle.fill;

    final path = Path();
    
    final scaleX = size.width / 160;
    final scaleY = size.height / 160;
    
    path.moveTo(109.895 * scaleX, 72.1283 * scaleY);
    path.cubicTo(111.119 * scaleX, 63.7384 * scaleY, 104.801 * scaleX, 59.198 * scaleY, 96.0838 * scaleX, 56.1875 * scaleY);
    path.lineTo(98.9244 * scaleX, 44.7872 * scaleY);
    path.lineTo(92.0678 * scaleX, 43.0598 * scaleY);
    path.lineTo(89.3252 * scaleX, 54.1641 * scaleY);
    path.cubicTo(87.5131 * scaleX, 53.7199 * scaleY, 85.6521 * scaleX, 53.2758 * scaleY, 83.791 * scaleX, 52.8809 * scaleY);
    path.lineTo(86.5336 * scaleX, 41.7273 * scaleY);
    path.lineTo(79.677 * scaleX, 40 * scaleY);
    path.lineTo(76.8854 * scaleX, 51.351 * scaleY);
    path.cubicTo(75.3672 * scaleX, 51.0055 * scaleY, 73.8979 * scaleX, 50.6601 * scaleY, 72.4776 * scaleX, 50.3146 * scaleY);
    path.lineTo(72.4776 * scaleX, 50.2653 * scaleY);
    path.lineTo(62.9764 * scaleX, 47.8964 * scaleY);
    path.lineTo(61.1643 * scaleX, 55.2992 * scaleY);
    path.cubicTo(61.1643 * scaleX, 55.2992 * scaleY, 66.2578 * scaleX, 56.4836 * scaleY, 66.1598 * scaleX, 56.533 * scaleY);
    path.cubicTo(68.9514 * scaleX, 57.2239 * scaleY, 69.4412 * scaleX, 59.0993 * scaleY, 69.3432 * scaleX, 60.5799 * scaleY);
    path.lineTo(66.1108 * scaleX, 73.5595 * scaleY);
    path.cubicTo(66.3067 * scaleX, 73.6089 * scaleY, 66.5516 * scaleX, 73.6582 * scaleY, 66.8455 * scaleX, 73.8063 * scaleY);
    path.cubicTo(66.6006 * scaleX, 73.7569 * scaleY, 66.3557 * scaleX, 73.7076 * scaleY, 66.1108 * scaleX, 73.6089 * scaleY);
    path.lineTo(61.6051 * scaleX, 91.7705 * scaleY);
    path.cubicTo(61.2623 * scaleX, 92.6095 * scaleY, 60.3807 * scaleX, 93.8927 * scaleY, 58.4707 * scaleX, 93.3991 * scaleY);
    path.cubicTo(58.5196 * scaleX, 93.4978 * scaleY, 53.4752 * scaleX, 92.1653 * scaleY, 53.4752 * scaleX, 92.1653 * scaleY);
    path.lineTo(50.0469 * scaleX, 100.111 * scaleY);
    path.lineTo(59.0094 * scaleX, 102.381 * scaleY);
    path.cubicTo(60.6746 * scaleX, 102.825 * scaleY, 62.2907 * scaleX, 103.22 * scaleY, 63.9069 * scaleX, 103.664 * scaleY);
    path.lineTo(61.0664 * scaleX, 115.163 * scaleY);
    path.lineTo(67.9229 * scaleX, 116.891 * scaleY);
    path.lineTo(70.7635 * scaleX, 105.49 * scaleY);
    path.cubicTo(72.6246 * scaleX, 105.984 * scaleY, 74.4856 * scaleX, 106.477 * scaleY, 76.2488 * scaleX, 106.922 * scaleY);
    path.lineTo(73.4572 * scaleX, 118.273 * scaleY);
    path.lineTo(80.3137 * scaleX, 120 * scaleY);
    path.lineTo(83.1543 * scaleX, 108.501 * scaleY);
    path.cubicTo(94.9084 * scaleX, 110.722 * scaleY, 103.724 * scaleX, 109.833 * scaleY, 107.397 * scaleX, 99.124 * scaleY);
    path.cubicTo(110.385 * scaleX, 90.5367 * scaleY, 107.25 * scaleX, 85.5521 * scaleY, 101.079 * scaleX, 82.2949 * scaleY);
    path.cubicTo(105.634 * scaleX, 81.2585 * scaleY, 109.013 * scaleX, 78.248 * scaleY, 109.895 * scaleX, 72.1283 * scaleY);
    path.close();
    
    path.moveTo(94.1738 * scaleX, 94.3368 * scaleY);
    path.cubicTo(92.0678 * scaleX, 102.924 * scaleY, 77.6691 * scaleX, 98.285 * scaleY, 73.0164 * scaleX, 97.1006 * scaleY);
    path.lineTo(76.7875 * scaleX, 81.8507 * scaleY);
    path.cubicTo(81.4402 * scaleX, 83.0352 * scaleY, 96.4267 * scaleX, 85.3547 * scaleY, 94.1738 * scaleX, 94.3368 * scaleY);
    path.close();
    
    path.moveTo(96.3287 * scaleX, 71.9803 * scaleY);
    path.cubicTo(94.3697 * scaleX, 79.8273 * scaleY, 82.4197 * scaleX, 75.8297 * scaleY, 78.5506 * scaleX, 74.8427 * scaleY);
    path.lineTo(81.9789 * scaleX, 61.0241 * scaleY);
    path.cubicTo(85.848 * scaleX, 62.0111 * scaleY, 98.3367 * scaleX, 63.8371 * scaleY, 96.3287 * scaleX, 71.9803 * scaleY);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LightningPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFF7931A)
      ..style = PaintingStyle.fill;

    final path = Path();
    
    path.moveTo(43.7767, 7.93);
    path.cubicTo(44.2357, 7.35123, 44.8741, 6.94135, 45.5914, 6.76476);
    path.cubicTo(46.3087, 6.58816, 47.0643, 6.65484, 47.7396, 6.95434);
    path.cubicTo(48.4149, 7.25383, 48.9716, 7.76917, 49.3222, 8.41939);
    path.cubicTo(49.6728, 9.06962, 49.7975, 9.81789, 49.6767, 10.5467);
    path.lineTo(46.16, 31.6667);
    path.lineTo(58.89, 31.6667);
    path.cubicTo(59.5166, 31.6665, 60.1306, 31.843, 60.6614, 32.1759);
    path.cubicTo(61.1923, 32.5088, 61.6186, 32.9846, 61.8914, 33.5487);
    path.cubicTo(62.1643, 34.1128, 62.2726, 34.7423, 62.2039, 35.3652);
    path.cubicTo(62.1353, 35.988, 61.8925, 36.5789, 61.5033, 37.07);
    path.lineTo(35.1133, 70.4033);
    path.cubicTo(34.6543, 70.9821, 34.0159, 71.392, 33.2986, 71.5686);
    path.cubicTo(32.5813, 71.7452, 31.8257, 71.6785, 31.1504, 71.379);
    path.cubicTo(30.4751, 71.0795, 29.9184, 70.5642, 29.5678, 69.9139);
    path.cubicTo(29.2172, 69.2637, 29.0925, 68.5154, 29.2133, 67.7867);
    path.lineTo(32.73, 46.6667);
    path.lineTo(20, 46.6667);
    path.cubicTo(19.3737, 46.6662, 18.7602, 46.4892, 18.2298, 46.1561);
    path.cubicTo(17.6994, 45.823, 17.2736, 45.3471, 17.0012, 44.7832);
    path.cubicTo(16.7288, 44.2192, 16.6208, 43.5899, 16.6895, 42.9673);
    path.cubicTo(16.7583, 42.3448, 17.0011, 41.7542, 17.39, 41.2633);
    path.lineTo(43.7767, 7.93);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HandshakePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFF7931A)
      ..style = PaintingStyle.fill;

    final path = Path();
    
    path.moveTo(68, 31);
    path.lineTo(68, 31.4125);
    path.lineTo(76.7125, 22.7);
    path.cubicTo(79.45, 19.9625, 79.45, 15.5375, 76.7125, 12.8);
    path.lineTo(66.95, 3.05);
    path.cubicTo(64.2125, 0.3125, 59.7875, 0.3125, 57.05, 3.05);
    path.lineTo(52.0375, 8.0625);
    path.cubicTo(51.7, 8.025, 51.35, 8, 51, 8);
    path.lineTo(37, 8);
    path.cubicTo(32.3625, 8, 28.55, 11.5, 28.05, 16);
    path.lineTo(28, 16);
    path.lineTo(28, 31);
    path.cubicTo(28, 33.7625, 30.2375, 36, 33, 36);
    path.cubicTo(35.7625, 36, 38, 33.7625, 38, 31);
    path.lineTo(38, 20);
    path.lineTo(58, 20);
    path.cubicTo(63.525, 20, 68, 24.475, 68, 30);
    path.lineTo(68, 31);
    path.close();
    
    path.moveTo(42, 24);
    path.lineTo(42, 31);
    path.cubicTo(42, 35.975, 37.975, 40, 33, 40);
    path.cubicTo(28.025, 40, 24, 35.975, 24, 31);
    path.lineTo(24, 16.175);
    path.cubicTo(19.5125, 16.95, 15.775, 20.2125, 14.5, 24.7);
    path.lineTo(12.4375, 31.9);
    path.lineTo(3.2875, 41.05);
    path.cubicTo(0.55, 43.7875, 0.55, 48.2125, 3.2875, 50.95);
    path.lineTo(13.05, 60.7125);
    path.cubicTo(15.7875, 63.45, 20.2125, 63.45, 22.95, 60.7125);
    path.lineTo(27.6625, 56);
    path.cubicTo(27.775, 56, 27.8875, 56.0125, 28, 56.0125);
    path.lineTo(48, 56.0125);
    path.cubicTo(51.3125, 56.0125, 54, 53.325, 54, 50.0125);
    path.cubicTo(54, 49.3125, 53.875, 48.6375, 53.6625, 48.0125);
    path.lineTo(54, 48.0125);
    path.cubicTo(57.3125, 48.0125, 60, 45.325, 60, 42.0125);
    path.cubicTo(60, 40.4125, 59.375, 38.9625, 58.35, 37.8875);
    path.cubicTo(61.5625, 37.2625, 63.9875, 34.4375, 64, 31.0375);
    path.lineTo(64, 30.9875);
    path.cubicTo(63.9875, 27.1375, 60.8625, 24.0125, 57, 24.0125);
    path.lineTo(42, 24);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
