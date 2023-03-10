import 'package:flutter/material.dart';

import '../Screens/homescreen.dart';

class TableCalendar extends StatefulWidget {
  const TableCalendar({Key? key}) : super(key: key);

  @override
  State<TableCalendar> createState() => _TableCalendarState();
}

class _TableCalendarState extends State<TableCalendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        // title: const Text(
        //   'Book Test Appointment',
        //   style: TextStyle(
        //     fontSize: 16,
        //     fontWeight: FontWeight.w500,
        //     color: Color(0xFF4C4C4C),
        //   ),
        // ),
        // centerTitle: true,
      ),
    );
  }
}
