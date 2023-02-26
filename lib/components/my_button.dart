import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
   final Function()? onTap;
  const MyButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF257A84),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
            child: Text(
              'Login',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFFFFFFF)),
            ),
          ),
        ),
      ),
    );
  }
}
