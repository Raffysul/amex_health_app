import 'package:amex_health_app/components/my_button.dart';
import 'package:amex_health_app/components/square_tile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? _checkBox = false;
  bool _isHidden = true;
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim(),
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
      // if (e.code == 'user-not-found') {
      //   wrongEmailMessage();
      // } else if (e.code == 'wrong-password') {
      //   wrongPasswordMessage();
      // }
    }

    //Navigator.pop(context);
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF257A84),
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        );
      },
    );
  }

  // void wrongPasswordMessage() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const AlertDialog(
  //         backgroundColor: Color(0xFF257A84),
  //         title: Text(
  //           'Incorrect Password',
  //           style: TextStyle(color: Colors.white, fontSize: 16),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/amexhealthlogo.png',
                    alignment: Alignment.center,
                    height: 100,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'Welcome!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
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
                    'Start by creating your Amex health account or log in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4C4C4C),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: TextFormField(
                    controller: _emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: Colors.black45,
                        ),
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                          color: Color(0xFF257A84),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 3,
                              color: Color(0xFF257A84),
                            ),
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: TextFormField(
                    controller: _passwordcontroller,
                    textInputAction: TextInputAction.done,
                    obscureText: _isHidden,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black45,
                      ),
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                        color: Color(0xFF257A84),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Color(0xFF257A84)),
                          borderRadius: BorderRadius.circular(15.0)),
                      suffix: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(
                          _isHidden ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        value: _checkBox,
                        checkColor: Colors.white,
                        activeColor: const Color(0xFF257A84),
                        onChanged: (val) {
                          setState(() {
                            _checkBox = val;
                          });
                        },
                      ),
                      const Text(
                        'Remind me ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF4C4C4C),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF4C4C4C),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                MyButton(
                  onTap: signUserIn,
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SquareTile(imagePath: 'assets/images/googlelogo.png'),
                    SizedBox(
                      width: 30,
                    ),
                    SquareTile(imagePath: 'assets/images/facebooklogo.png'),
                  ],
                ),
                // ElevatedButton(
                //   onPressed: () async {
                //     Navigator.of(context).pushReplacement(
                //       MaterialPageRoute(builder: (context) => const HomePage()),
                //     );
                //   },
                //   style: ElevatedButton.styleFrom(
                //       fixedSize: const Size(320, 52),
                //       elevation: 10.0,
                //       shape: const StadiumBorder(),
                //       padding: const EdgeInsets.all(20),
                //       backgroundColor: const Color(0xFF257A84),
                //       textStyle: const TextStyle(
                //           fontSize: 16,
                //           fontWeight: FontWeight.w400,
                //           color: Color(0xFFFFFFFF))),
                //   child: const Text('Login'),
                // ),
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: Text(
                    "Don't have an account yet?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4C4C4C),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Center(
                    child: Text(
                      "Sign up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF257A84),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
