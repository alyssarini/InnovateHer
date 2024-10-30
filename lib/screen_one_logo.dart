// import necessary packages
import 'package:flutter/material.dart';
import 'screen_two_login_signup.dart';

void main() {
  runApp(const TitipAsaApp());
}

// define the main widget of the app
class TitipAsaApp extends StatelessWidget {
  const TitipAsaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 251, 248),
      ),
      home: const SplashScreen(), // define splash screen as the initial page
    );
  }
}

// splash screen widget displayed upon startup
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

// state management for the splash screen
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginSignupPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // set background color matching app design
      backgroundColor: const Color.fromRGBO(254, 255, 238, 1),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(0),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(254, 255, 238, 1),  // background color
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,  // center content vertically
            children: [
              // display app logo in center of splash screen
              Container(
                width: 306,
                height: 322,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/images/titp_asa_logo.png"),  // app logo image
                    fit: BoxFit.contain,
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
