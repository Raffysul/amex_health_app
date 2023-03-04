import 'package:flutter/material.dart';

import '../bottomnavigationscreens/booktest_nav.dart';
import '../bottomnavigationscreens/chatpage_nav.dart';
import '../bottomnavigationscreens/historypage_nav.dart';
import '../bottomnavigationscreens/homepage_nav.dart';
import '../bottomnavigationscreens/profilepage_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;
  final List<Widget> _tabList = [
    const HomePage(),
    const TestScreen(),
    const HistoryScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _tabList.elementAt(_pageIndex),
          Align(
            alignment: const Alignment(0.0, 1.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              child: BottomNavigationBar(
                selectedItemColor: const Color(0xFF257A84),
                unselectedItemColor: Colors.white70,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                backgroundColor: Colors.white,
                currentIndex: _pageIndex,
                iconSize: 25,
                onTap: (int index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.grey,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.calendar_month,
                      color: Colors.grey,
                    ),
                    label: 'Book Test',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.history,
                      color: Colors.grey,
                    ),
                    label: 'History',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.chat,
                      color: Colors.grey,
                    ),
                    label: 'Chat',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
