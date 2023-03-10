import 'package:amex_health_app/bottomnavigationscreens/profilepage_nav.dart';
import 'package:flutter/material.dart';
import 'package:awesome_icons/awesome_icons.dart';

import 'booktest_nav.dart';
import 'chatpage_nav.dart';

class User {
  final String doctorName;
  final String doctorInfo;
  final String docAvatar;

  const User({
    required this.doctorName,
    required this.doctorInfo,
    required this.docAvatar,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [
    const User(
        doctorName: 'Dr. Emmanuel Effiong',
        doctorInfo: '10 Jan, 2023 - 2:00 PM',
        docAvatar: 'assets/images/doc1.png'),
    const User(
        doctorName: 'Dr. Josephine Attoh',
        doctorInfo: '10 Jan, 2023 - 2:30 PM',
        docAvatar: 'assets/images/doc2.png'),
    const User(
        doctorName: 'Dr. Grace Adovon',
        doctorInfo: '10 Jan, 2023 - 2:00 PM',
        docAvatar: 'assets/images/doc3.png'),
    const User(
        doctorName: 'Dr. Daniel Ogunwole',
        doctorInfo: '21 Jan, 2023 - 2:00 PM',
        docAvatar: 'assets/images/doc4.png'),
    const User(
        doctorName: 'Dr. Yusuf Lawal',
        doctorInfo: '21 Jan, 2023 - 2:30 PM',
        docAvatar: 'assets/images/doc5.png'),
    const User(
        doctorName: 'Dr. Grace Adovon',
        doctorInfo: '10 Jan, 2023 - 2:30 PM',
        docAvatar: 'assets/images/doc3.png'),
    const User(
        doctorName: 'Dr. Josephine Attoh',
        doctorInfo: '10 Jan, 2023 - 2:00 PM',
        docAvatar: 'assets/images/doc2.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          highlightColor: const Color(0xFF257A84),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          },
          icon: const Icon(
            Icons.format_align_left,
            size: 25.0,
            color: Color(0xFF257A84),
          ),
        ),
        actions: [
          Container(
            height: 35,
            width: 35,
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              onPressed: () {},
              alignment: Alignment.center,
              hoverColor: const Color(0xFF257A84),
              highlightColor: const Color(0xFF257A84),
              icon: const Icon(
                Icons.notifications_active,
                size: 25.0,
                color: Color(0xFF257A84),
              ),
            ),
          ),
          Container(
            height: 35,
            width: 35,
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              onPressed: () {},
              alignment: Alignment.center,
              hoverColor: const Color(0xFF257A84),
              highlightColor: const Color(0xFF257A84),
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 25.0,
                color: Color(0xFF257A84),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFEFF5F6),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.all(12),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            'Amex Health ID: 56785921',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Center(
                          child: Text(
                            'Joined Date: 08 Feb, 2022',
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
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 32,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                        radius: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'What are you looking for?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF4C4C4C),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFF257A84),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const TestScreen()),
                              );
                            },
                            icon: const Icon(
                              FontAwesomeIcons.vial,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(
                        child: Text(
                          'Book Test\n Appointment',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF257A84)),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFF257A84),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const ChatScreen()),
                              );
                            },
                            icon: const Icon(
                              FontAwesomeIcons.stethoscope,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(
                        child: Text(
                          'Chat with a\n Doctor',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF257A84)),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFF257A84),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.book,
                              color: Colors.white,
                              size: 30,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(
                        child: Text(
                          'Download\n Test Result',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF257A84)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Upcoming Appointments',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4C4C4C),
                    ),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4C4C4C),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return Card(
                      elevation: 8,
                      child: ListTile(
                        leading: Image.asset(user.docAvatar),
                        // CircleAvatar(
                        //   radius: 28,
                        //   backgroundImage: AssetImage(user.docAvatar),
                        // ),
                        title: Text(
                          user.doctorInfo,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        ),
                        subtitle: Text(
                          user.doctorName,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        ),
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) => UserPage(user: user),
                          // ));
                        },
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
