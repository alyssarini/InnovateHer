// import necessary flutter packages and custom screens
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'screen_four_register_page.dart';
import 'screen_six_reset_pass.dart';
import 'screen_eight_dashboard.dart';

void main() {
  runApp(const UserLoginPage());
}

// root widget of the login app
class UserLoginPage extends StatelessWidget {
  const UserLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47), // dark theme background color
      ),
      home: Scaffold(
        body: ListView(children: const [
          LoginPage(),  // display the login page widget
        ]),
      ),
    );
  }
}

// stateful widget for the login page
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

// state for the login page, including UI elements and login logic
class _LoginPageState extends State<LoginPage> {
  // Controllers for username and password fields
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorMessage; // Variable to hold error message

  // function to validate fields and login
  void _login() {
    String username = usernameController.text.trim(); // get trimmed username
    String password = passwordController.text.trim(); // get trimmed password

    if (username.isEmpty || password.isEmpty) {
      // set an error message if either field is empty
      setState(() {
        errorMessage = 'Please fill in both username and password.';
      });
    } else {
      // clear the error message if login is successful
      setState(() {
        errorMessage = null;
      });
      // navigate to the Dashboard page if both fields are filled in
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const DashboardWidget(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // main container for the login screen
        Container(
          width: 430,
          height: 932,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(254, 255, 238, 1),  // background color
          ),
          child: Stack(
            children: [
              // app logo
              Positioned(
                left: 142,
                top: 56,
                child: Container(
                  width: 146,
                  height: 118,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/images/titp_asa_logo.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              // 'LOGIN' tile
              const Positioned(
                left: 173,
                top: 301,
                child: SizedBox(
                  width: 105,
                  height: 34,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              // username label
              const Positioned(
                left: 50,
                top: 414,
                child: Text(
                  'Username',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              // username input field
              Positioned(
                left: 50,
                top: 438,
                child: SizedBox(
                  width: 330,
                  child: TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Type your username',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              // password label
              const Positioned(
                left: 50,
                top: 511,
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              // password input field
              Positioned(
                left: 50,
                top: 535,
                child: SizedBox(
                  width: 330,
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,  // hide input text for security
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Type your password',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              // forgot password link
              Positioned(
                left: 277,
                top: 600,
                child: GestureDetector(
                  onTap: () {
                    // navigate to the reset password page
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ResetPassword(),
                      ),
                    );
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.69),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              // login button
              Positioned(
                left: 143,
                top: 682,
                child: SizedBox(
                  width: 170,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(247, 153, 64, 1),
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: _login, // call the login function
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              // text to sign up if no account exists
              Positioned(
                left: 159,
                top: 732,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don’t have an account?\n',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.87),
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.87),
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // navigate to the RegisterPage when tapped
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // display error message directly on the screen
              if (errorMessage != null)
                Positioned(
                  left: 50,
                  top: 600, // adjust position as needed
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      errorMessage!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}