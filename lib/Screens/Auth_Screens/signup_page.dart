import 'package:amex_health_app/components/my_button.dart';
import 'package:amex_health_app/components/square_tile.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../services/auth_service.dart';

class SignUpPage extends StatefulWidget {
  final Function()? onTap;
  const SignUpPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //final formKey = GlobalKey<FormState>();
  //bool? _checkBox = false;
  bool _isHidden = true;
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();
  final _namecontroller = TextEditingController();

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void initState() {
    super.initState();

    _emailcontroller.addListener(onListen);
  }

  Future  signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      if (_passwordcontroller.text == _confirmpasswordcontroller.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailcontroller.text.trim(),
            password: _passwordcontroller.text.trim(),);
      } else {
        showErrorMessage("Passwords don't match");
      }

      //Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
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

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _namecontroller.dispose();
    _confirmpasswordcontroller.dispose();
    _emailcontroller.removeListener(onListen);
    super.dispose();
  }

  void onListen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // const SizedBox(
                //   height: 30,
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Center(
                    child: Image.asset(
                      'assets/images/amexlogo.png',
                      fit: BoxFit.cover,
                      height: 40,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // const Center(
                //   child: Text(
                //     'Welcome!',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.w600,
                //       color: Color(0xFF4C4C4C),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Create your account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4C4C4C),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _namecontroller,
                    keyboardType: TextInputType.name,
                    autofillHints: const [AutofillHints.name],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textInputAction: TextInputAction.next,
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
                        hintText: 'Type your Full Name',
                        hintStyle: const TextStyle(color: Color(0xFF4C4C4C)),
                        labelText: 'Name',
                        labelStyle: const TextStyle(
                          color: Color(0xFF257A84),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                              color: Color(0xFF257A84),
                            ),
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Enter a valid email'
                            : null,
                    textInputAction: TextInputAction.next,
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
                        //hintText: 'Email',
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                          color: Color(0xFF257A84),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                              color: Color(0xFF257A84),
                            ),
                            borderRadius: BorderRadius.circular(15.0))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _passwordcontroller,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 6
                        ? 'Enter min. of 6 characters'
                        : null,
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
                              width: 2, color: Color(0xFF257A84)),
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
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _confirmpasswordcontroller,
                    textInputAction: TextInputAction.done,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 6
                        ? 'Enter min. of 6 characters'
                        : null,
                    obscureText: _isHidden,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black45,
                      ),
                      labelText: 'Confirm Password',
                      labelStyle: const TextStyle(
                        color: Color(0xFF257A84),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2, color: Color(0xFF257A84)),
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
                // const SizedBox(
                //   height: 10,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: <Widget>[
                //       Checkbox(
                //         value: _checkBox,
                //         checkColor: Colors.white,
                //         activeColor: const Color(0xFF257A84),
                //         onChanged: (val) {
                //           setState(() {
                //             _checkBox = val;
                //           });
                //         },
                //       ),
                //       const Text(
                //         'Remind me ',
                //         style: TextStyle(
                //           fontSize: 12,
                //           fontWeight: FontWeight.w500,
                //           color: Color(0xFF4C4C4C),
                //         ),
                //       ),
                //       const Spacer(),
                //       const Text(
                //         'Forgot Password?',
                //         style: TextStyle(
                //           fontSize: 12,
                //           fontWeight: FontWeight.w500,
                //           color: Color(0xFF4C4C4C),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 50,
                ),
                MyButton(
                  text: "Create Account",
                  onTap: signUserUp,
                ),
                const SizedBox(
                  height: 30,
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
                          'Or sign up with',
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
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                        onTap: () => AuthService().signInWithGoogle(),
                        imagePath: 'assets/images/googlelogo.png'),
                    const SizedBox(
                      width: 30,
                    ),
                    SquareTile(
                        onTap: () {},
                        imagePath: 'assets/images/facebooklogo.png'),
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
                  height: 25,
                ),
                const Center(
                  child: Text(
                    "Already have an account?",
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
                      "Login",
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
