import 'package:flutter/material.dart';
import 'dart:async'; // Import for using the timer
import 'screen_three_login_page.dart'; // Import the login page

// StatefulWidget for displaying the password reset success message
class SuccessResetPass extends StatefulWidget {
  const SuccessResetPass({super.key});

  @override
  _SuccessResetPass createState() => _SuccessResetPass();
}

// state for SuccessResetPass
class _SuccessResetPass extends State<SuccessResetPass> {
  @override
  void initState() {
    super.initState();
    // Set a timer to navigate to the login screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const UserLoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 430, // set container width
        height: 932, // set container height
        decoration: const BoxDecoration(
          color: Color.fromRGBO(254, 255, 238, 1), // background color
        ),
        child: Stack(
          children: <Widget>[
            // positioned widget to display the app logo
            Positioned(
              top: 56,
              left: 142,
              child: Container(
                width: 146,
                height: 118,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/images/titp_asa_logo.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            // text for "Password Reset Successful" message
            const Positioned(
              top: 231,
              left: 91,
              child: Text(
                'Password Reset Successful',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            // text to inform user they will be directed to the login page
            const Positioned(
              top: 571,
              left: 74,
              child: Text(
                'You will be directed to the login page...',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.58),
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            // positioned widget for check icon
            Positioned(
              top: 302,
              left: 105,
              child: Container(
                width: 224,
                height: 223,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/images/check_icon.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
