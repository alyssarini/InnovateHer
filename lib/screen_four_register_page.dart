import 'package:flutter/material.dart';
import 'screen_five_success_page.dart';

// RegisterPage widget with StatefulWidget to handle user input and form validation
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

// State for RegisterPage
class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>(); // Key for the form
  final TextEditingController usernameController = TextEditingController(); // controller for username input
  final TextEditingController emailController = TextEditingController();  // controller for email input
  final TextEditingController passwordController = TextEditingController(); // controller for password input
  final TextEditingController confirmPasswordController = TextEditingController();  // controller for confirm password input

  @override
  void dispose() {
    // dispose controllers to free up memory when the widget is removed
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // method to submit the form and navigate to SuccessRegister page if valid
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // if orm is valid, navigate to the success page and replace current page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const SuccessRegister(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(254, 255, 238, 1),  // background color
      body: SingleChildScrollView(
        child: SizedBox(
          width: 430,
          height: 932,
          child: Stack(
            children: <Widget>[
              // logo positioned at the top of the screen
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
              // "SIGN UP" title text
              const Positioned(
                top: 203,
                left: 150,
                child: Text(
                  'SIGN UP',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 32,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              // subtitle text under "SIGN UP" title
              const Positioned(
                top: 246,
                left: 162,
                child: Text(
                  'Create your account',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.6899999976158142),
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              // form for registration input fields
              Positioned(
                top: 316,
                left: 50,
                right: 50,
                child: Form(
                  key: _formKey, // assign the key to the form
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // username label and input field
                      const Text(
                        'Username',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Inter',
                          fontSize: 12,
                        ),
                      ),
                      TextFormField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          hintText: 'Type your username',
                          prefixIcon: Icon(Icons.person),
                        ),
                        style: const TextStyle(color: Colors.black),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20), // spacing between fields
                      // email label and input field
                      const Text(
                        'Email',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Inter',
                          fontSize: 12,
                        ),
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: 'Type your email',
                          prefixIcon: Icon(Icons.email),
                        ),
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // password label and input field
                      const Text(
                        'Password',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Inter',
                          fontSize: 12,
                        ),
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          hintText: 'Type your password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                        style: const TextStyle(color: Colors.black),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // confirm password label and input field
                      const Text(
                        'Confirm Password',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Inter',
                          fontSize: 12,
                        ),
                      ),
                      TextFormField(
                        controller: confirmPasswordController,
                        decoration: const InputDecoration(
                          hintText: 'Confirm your password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                        style: const TextStyle(color: Colors.black),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // sign up button to submit the form
              Positioned(
                left: 143,
                top: 732,
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
                    onPressed: _submitForm, // call the _submitForm method
                    child: const Text(
                      'SIGN UP',
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
            ],
          ),
        ),
      ),
    );
  }
}
