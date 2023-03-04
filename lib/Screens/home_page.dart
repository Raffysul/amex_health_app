import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Signed in as : ${user.email!}',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // Text(
              //   user.email!,
              //   style: const TextStyle(
              //       fontSize: 20, fontWeight: FontWeight.normal),
              // ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50),
                    elevation: 10.0,
                    shape: const StadiumBorder(),
                    backgroundColor: const Color(0xFF257A84),
                    //minimumSize: const Size.fromHeight(50),
                  ),
                  icon: const Icon(Icons.arrow_forward, size: 32),
                  label: const Center(
                    child: Text(
                      'Proceed to Dashboard',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // onPressed: () {
                  //   FirebaseAuth.instance.signOut();
                  onPressed: () async {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return const HomeScreen();
                    //     },
                    //   ),
                    // );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 45),
                    elevation: 10.0,
                    shape: const StadiumBorder(),
                    backgroundColor: const Color(0xFF257A84),
                    //minimumSize: const Size.fromHeight(50),
                  ),
                  icon: const Icon(Icons.arrow_back, size: 30),
                  label: const Center(
                    child: Text(
                      'Log Out',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  // onPressed: () async {
                  //   Navigator.of(context).pushReplacement(
                  //     MaterialPageRoute(
                  //         builder: (context) => const HomeScreen()),
                  //   );
                  // },
                ),
              ),
            ],
          ),
        ));
  }
}
