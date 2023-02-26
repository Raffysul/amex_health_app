import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'Auth_Screens/loginpage.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final _controller = LiquidController();
  bool isLastPage = false;

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(
                child: Image.asset(
                  'assets/images/amexhealthlogo.png',
                  fit: BoxFit.cover,
                  height: 40,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset(
                urlImage,
                fit: BoxFit.fill,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF4C4C4C),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color(0xFF4C4C4C),
                    fontWeight: FontWeight.normal,
                    fontSize: 14),
              ),
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 50),
        child: Stack(
          children: [
            LiquidSwipe(
              liquidController: _controller,
              enableSideReveal: true,
              onPageChangeCallback: (index) {
                setState(() => isLastPage = index == 3);
              },
              slideIconWidget: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF257A84),
              ),
              positionSlideIcon: 0.6,
              pages: [
                buildPage(
                  color: const Color(0xFFFFFFFF),
                  urlImage: 'assets/images/onboard1.png',
                  title: 'Book your test appointment online with ease',
                  subtitle: 'Book your test online with ease',
                ),
                buildPage(
                  color: const Color(0xFFFFFFFF),
                  urlImage: 'assets/images/onboard2.png',
                  title: 'Get detailed explanation for your tests',
                  subtitle: 'Chat with an in-house doctor',
                ),
                buildPage(
                  color: const Color(0xFFFFFFFF),
                  urlImage: 'assets/images/onboard3.png',
                  title: 'Request Home Service',
                  subtitle: 'Book your test online with ease',
                ),
                buildPage(
                  color: const Color(0xFFFFFFFF),
                  urlImage: 'assets/images/onboard4.png',
                  title: 'Welcome',
                  subtitle: 'Book your test online with ease',
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF257A84),
                minimumSize: const Size.fromHeight(60),
              ),
              onPressed: () async {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text(
                'Get Started',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        _controller.jumpToPage(page: 3);
                      },
                      child: const Text(
                        'SKIP',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF257A84),
                        ),
                      )),
                  Center(
                    child: AnimatedSmoothIndicator(
                      activeIndex: _controller.currentPage,
                      count: 4,
                      effect: const WormEffect(
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: Color(0xFF257A84),
                      ),
                      onDotClicked: (index) {
                        _controller.animateToPage(
                          page: index,
                        );
                      },
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        final page = _controller.currentPage + 1;
                        _controller.animateToPage(
                          page: page > 4 ? 0 : page,
                          duration: 600,
                        );
                      },
                      child: const Text(
                        'NEXT',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF257A84),
                        ),
                      )),
                ],
              ),
            ),
    );
  }
}
