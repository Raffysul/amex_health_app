import 'package:amex_health_app/bottomnavigationscreens/booktest_nav.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../Screens/homescreen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => const HomeScreen()),
            );
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xFF257A84),
            size: 25,
          ),
        ),
        title: const Text(
          'Test History',
          style: TextStyle(
            color: Color(0xFF4C4C4C),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.bottomCenter,
                  image: AssetImage("assets/images/container2.png"),
                  fit: BoxFit.contain),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'No test history to display.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4C4C4C),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text: 'Click Here ',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF257A84),
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const TestScreen()),
                    );
                  },
                  children: const [
                    TextSpan(
                      text: 'to book a test.',
                      style: TextStyle(
                        color: Color(0xFF4C4C4C),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
