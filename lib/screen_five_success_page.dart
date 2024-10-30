import 'package:flutter/material.dart';
import 'screen_three_login_page.dart'; // Import the login page

// SuccessRegister widget with StatefulWidget to show success message and navigate to login
class SuccessRegister extends StatefulWidget {
  const SuccessRegister({super.key});

  @override
  _SuccessRegister createState() => _SuccessRegister();
}

// state for SuccessRegister
class _SuccessRegister extends State<SuccessRegister> {
  @override
  void initState() {
    super.initState();
    // delay for 5 seconds and then navigate to the login page
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const UserLoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430,
      height: 932,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(254, 255, 238, 1),  // set background color
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
          // success message displayed on the screen
          const Positioned(
            top: 231,
            left: 91,
            child: Text(
              'Registration successful!',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Inter',
                fontSize: 20,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          // message indicating redirection to login page
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
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          // positioned widget to display the check icon
          Positioned(
            top: 299,
            left: 100,
            child: Container(
              width: 219,
              height: 217,
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
    );
  }
}
