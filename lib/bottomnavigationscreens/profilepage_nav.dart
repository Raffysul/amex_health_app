import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF4C4C4C),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: const Color(0xFFEFF5F6),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFF257A84),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 32,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/avatar.png'),
                            radius: 30,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Center(
                              child: Text(
                                'Grace Williams',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Center(
                              child: Text(
                                'gracewilliams@gmail.com',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.edit,
                          color: Colors.black54,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 450,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.history,
                              color: Color(0xFF257A84),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('History'),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.location_on_outlined,
                              color: Color(0xFF257A84),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Address'),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.book_outlined,
                              color: Color(0xFF257A84),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Download Test Result'),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.payment_outlined,
                              color: Color(0xFF257A84),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Payment Details'),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.security_outlined,
                              color: Color(0xFF257A84),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Multi-factor Authentication'),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.info_outline,
                              color: Color(0xFF257A84),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('About Us'),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.help_outline,
                              color: Color(0xFF257A84),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Help'),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              Icons.logout,
                              color: Color(0xFF257A84),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Log Out'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
