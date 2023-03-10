import 'package:amex_health_app/Screens/Auth_Screens/auth_page.dart';
import 'package:amex_health_app/Screens/Auth_Screens/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/OnboardScreen.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Future.delayed(const Duration(seconds: 3));
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  // final prefs = await SharedPreferences.getInstance();
  // final showHome = prefs.getBool('showHome') ?? false;
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.green,
      ),
        initialRoute:
    initScreen == 0 || initScreen == null ? 'onboard' : 'home',
    routes: {
      'home': (context) => const AuthPage(),
      'onboard': (context) => const OnBoardScreen(),
    });
  }
}
