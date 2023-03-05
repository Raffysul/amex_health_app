import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/container1.png'),
          alignment: Alignment.topLeft,
          fit: BoxFit.contain,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/container2.png'),
            alignment: Alignment.bottomCenter,
            fit: BoxFit.contain,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/chat.png'),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
// Navigator.of(context).pushReplacement(
//   MaterialPageRoute(builder: (context) => const HomePage()),
// );
                },
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                    fixedSize: const Size(150, 50),
                    elevation: 10.0,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.all(8),
                    backgroundColor: const Color(0xFF257A84),
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF))),
                child: const Center(
                  child: Text(
                    'Start Chat',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
