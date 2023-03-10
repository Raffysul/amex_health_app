import 'package:amex_health_app/Screens/Auth_Screens/login_or_register_page.dart';
//import 'package:amex_health_app/Screens/Auth_Screens/verification_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:liquid_swipe/Helpers/Helpers.dart';

//import '../../components/my_button.dart';

class ForgotPassword extends StatefulWidget {
  //final Function()? onTap;
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _emailcontroller.addListener(onListen);
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _emailcontroller.removeListener(onListen);
    super.dispose();
  }

  void onListen() => setState(() {});

  Future resetPassword() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Color(0xFF257A84),
          ),
        );
      },
    );

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailcontroller.text.trim());
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          elevation: 6,
          backgroundColor: Color(0xFF257A84),
          content: Text(
            'Password Reset Link Sent! Check your email',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      );
      //Utils.showSnackBar('Password Reset Email Sent');
      if (!mounted) return;
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          elevation: 6,
          backgroundColor: const Color(0xFF257A84),
          content: Text(
            e.message.toString(),
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      );
      // Utils.showSnackBar(e.message);
      if (!mounted) return;
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => const LoginOrRegisterPage()),
            );
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xFF257A84),
            size: 25,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: Image.asset(
                      'assets/images/amexlogo.png',
                      fit: BoxFit.cover,
                      height: 40,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Center(
                  child: Text(
                    'Forgot Password?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4C4C4C),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Don't worry, it happens. Please, enter the email address linked with your account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4C4C4C),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    textInputAction: TextInputAction.done,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Enter a valid email'
                            : null,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.mail,
                        color: Colors.black45,
                      ),
                      suffixIcon: _emailcontroller.text.isEmpty
                          ? Container(width: 0)
                          : IconButton(
                              onPressed: () => _emailcontroller.clear(),
                              icon: const Icon(Icons.close)),
                      hintText: 'Example@gmail.com',
                      hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                      labelText: 'Email',
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
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: resetPassword,
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
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.all(8),
                      backgroundColor: const Color(0xFF257A84),
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF))),
                  child: const Center(
                    child: Text(
                      'Get OTP',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // MyButton(
                //   text: "Login",
                //   onTap: signUserIn,
                // ),
                const SizedBox(
                  height: 50,
                ),
                const Center(
                  child: Text(
                    "Remember Password?",
                    textAlign: TextAlign.center,
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const LoginOrRegisterPage()),
                    );
                  },
                  child: const Center(
                    child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF257A84),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
