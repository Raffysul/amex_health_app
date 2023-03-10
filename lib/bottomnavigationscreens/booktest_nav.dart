import 'package:flutter/material.dart';

import '../Screens/homescreen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _namecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _namecontroller.addListener(onListen);
  }

  @override
  void dispose() {
    _namecontroller.dispose();
    _namecontroller.removeListener(onListen);
    super.dispose();
  }

  void onListen() => setState(() {});

  void _showDatePicker(){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2026),);
  }
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
        title: const Text(
          'Book Test Appointment',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4C4C4C),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFEFF5F6),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Full Name',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: _namecontroller,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    textInputAction: TextInputAction.done,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.black45,
                      ),
                      suffixIcon: _namecontroller.text.isEmpty
                          ? Container(width: 0)
                          : IconButton(
                          onPressed: () => _namecontroller.clear(),
                          icon: const Icon(Icons.close)),
                      hintText: 'Type your full name',
                      hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                      labelText: 'Full Name',
                      labelStyle: const TextStyle(
                        color: Color(0xFF257A84),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.5,
                            color: Color(0xFF257A84),
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.5,
                            color: Color(0xFF257A84),
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.5,
                            color: Color(0xFF257A84),
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.5,
                            color: Color(0xFF257A84),
                          ),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Select Your Age',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 15,
                        color: const Color(0xFFEFF5F6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              //color: const Color(0xFFEFF5F6),
                              shape: BoxShape.rectangle),
                          child: const Center(
                            child: Text(
                              '10+',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Card(
                        elevation: 15,
                        color: const Color(0xFFEFF5F6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              //color: const Color(0xFFEFF5F6),
                              shape: BoxShape.rectangle),
                          child: const Center(
                            child: Text(
                              '20+',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Card(
                        elevation: 15,
                        color: const Color(0xFFEFF5F6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              //color: const Color(0xFFEFF5F6),
                              shape: BoxShape.rectangle),
                          child: const Center(
                            child: Text(
                              '30+',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Card(
                        elevation: 15,
                        color: const Color(0xFFEFF5F6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              //color: const Color(0xFFEFF5F6),
                              shape: BoxShape.rectangle),
                          child: const Center(
                            child: Text(
                              '40+',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Today, 5 March',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF4C4C4C),
                        ),
                      ),
                      GestureDetector(
                        onTap: _showDatePicker,
                        child: const Text(
                          'Choose Another Date',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF257A84),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    ' Afternoon Time Slots',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4C4C4C),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 29,
                        width: 65,
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: const Color(0xFF257A84), width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFEFF5F6),
                            shape: BoxShape.rectangle),
                        child: const Center(
                          child: Text(
                            '1:00 PM',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 29,
                        width: 65,
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: const Color(0xFF257A84), width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFEFF5F6),
                            shape: BoxShape.rectangle),
                        child: const Center(
                          child: Text(
                            '1:30 PM',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 29,
                        width: 65,
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: const Color(0xFF257A84), width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFEFF5F6),
                            shape: BoxShape.rectangle),
                        child: const Center(
                          child: Text(
                            '2:00 PM',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 29,
                        width: 65,
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: const Color(0xFF257A84), width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFEFF5F6),
                            shape: BoxShape.rectangle),
                        child: const Center(
                          child: Text(
                            '2:30 PM',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 5,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 29,
                        width: 65,
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: const Color(0xFF257A84), width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFEFF5F6),
                            shape: BoxShape.rectangle),
                        child: const Center(
                          child: Text(
                            '3:00 PM',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 29,
                        width: 65,
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: const Color(0xFF257A84), width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFEFF5F6),
                            shape: BoxShape.rectangle),
                        child: const Center(
                          child: Text(
                            '3:30 PM',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 29,
                        width: 65,
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: const Color(0xFF257A84), width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFEFF5F6),
                            shape: BoxShape.rectangle),
                        child: const Center(
                          child: Text(
                            '4:00 PM',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 29,
                        width: 65,
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: const Color(0xFF257A84), width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFEFF5F6),
                            shape: BoxShape.rectangle),
                        child: const Center(
                          child: Text(
                            '4:30 PM',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    ' Evening Time Slots',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4C4C4C),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 29,
                        width: 65,
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: const Color(0xFF257A84), width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFEFF5F6),
                            shape: BoxShape.rectangle),
                        child: const Center(
                          child: Text(
                            '5:00 PM',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 29,
                        width: 65,
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: const Color(0xFF257A84), width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFEFF5F6),
                            shape: BoxShape.rectangle),
                        child: const Center(
                          child: Text(
                            '5:30 PM',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 29,
                        width: 65,
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: const Color(0xFF257A84), width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFEFF5F6),
                            shape: BoxShape.rectangle),
                        child: const Center(
                          child: Text(
                            '6:00 PM',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 29,
                        width: 65,
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: const Color(0xFF257A84), width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFEFF5F6),
                            shape: BoxShape.rectangle),
                        child: const Center(
                          child: Text(
                            '6:30 PM',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 50,),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    //() async {
                    //   Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(
                    //         builder: (context) => const VerificationPage()),
                    //   );
                    //},
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        fixedSize: const Size(250, 50),
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.all(8),
                        backgroundColor: const Color(0xFF257A84),
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFFFFFF))),
                    child: const Center(
                      child: Text(
                        'Choose Test',
                        textAlign: TextAlign.center,
                      ),
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
