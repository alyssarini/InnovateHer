// import necessary packages
import 'package:flutter/material.dart';
import 'screen_three_login_page.dart';
import 'screen_four_register_page.dart';

// define the main widget for the login/signup page
class LoginSignupPage extends StatelessWidget {
  const LoginSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // set fixed dimensions for this container to match specific design requirements
      width: 430,
      height: 932,
      // background color for the Login/Signup screen
      decoration: const BoxDecoration(
        color: Color.fromRGBO(254, 255, 238, 1),
      ),
      child: Stack(
        // use stack to layer the logo and buttons
        children: <Widget>[
          // app logo positioned near the top
          Positioned(
            top: 56,
            left: 142,
            child: Container(
              width: 146,
              height: 118,
              decoration: const BoxDecoration(
                // display the logo image 
                image: DecorationImage(
                  image: AssetImage('lib/images/titp_asa_logo.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          // login button positioned in the middle of the screen
          Positioned(
            top: 418,
            left: 130,
            child: SizedBox(
              width: 170,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(247, 153, 64, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),  // rounded button corners
                  ),
                ),
                onPressed: () {
                  // navigate to login page when pressed
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const UserLoginPage()),
                  );
                },
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
          // sign up button positioned below the login button
          Positioned(
            top: 499,
            left: 130,
            child: SizedBox(
              width: 170,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(247, 153, 64, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),  // rounded button corners
                  ),
                ),
                onPressed: () {
                  // navigate to the register page when pressed
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                  );
                },
                child: const Text(
                  'SIGN UP',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}