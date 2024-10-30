import 'package:flutter/material.dart';
import 'screen_seven_pass_reset_success.dart'; // Import the next screen

// StatefulWidget to manage the password reset functionality
class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  _ResetPassword createState() => _ResetPassword();
}

// state for ResetPassword
class _ResetPassword extends State<ResetPassword> {
  // key to identify and validate the form
  final _formKey = GlobalKey<FormState>();
  // controllers to manage password input fields
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // dispose of controllers to free up resources
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // method to handle form submission
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // if form is valid, navigate to the password reset success screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SuccessResetPass(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 430,
        height: 932,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(254, 255, 238, 1),  // background color
        ),
        child: Stack(
          // positioned widget to display the app logo
          children: <Widget>[
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
            // positioned widget to create the form for password reset
            Positioned(
              top: 350,
              left: 53,
              right: 53,
              child: Form(
                key: _formKey,  // attach the form key to the Form widget
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // text label for "Reset Password" section
                    const Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 10), // space between elements
                    Row(
                      children: [
                        // icon for password field
                        Container(
                          width: 14,
                          height: 13,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'lib/images/padlock_icon.png',
                              ),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),  // space between icon and field
                        Expanded(
                          // TextFormField for entering new password
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            style: const TextStyle(color: Colors.black), // Set text color to black
                            decoration: const InputDecoration(
                              labelText: 'Type your new password',
                              border: OutlineInputBorder(),
                            ),
                            // validate password input
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a new password';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20), // space between password fields
                    Row(
                      children: [
                        // icon for confirm password field
                        Container(
                          width: 14,
                          height: 13,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('lib/images/padlock_icon.png'),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),  // space between icon and field
                        Expanded(
                          // TextFormField for confirming password
                          child: TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: true,
                            style: const TextStyle(color: Colors.black), // Set text color to black
                            decoration: const InputDecoration(
                              labelText: 'Confirm your new password',
                              border: OutlineInputBorder(),
                            ),
                            // validate confirm password input
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // positioned widget for submit button
            Positioned(
              top: 600,
              left: 133,
              child: GestureDetector(
                onTap: _submitForm, // trigger _submitForm on tap
                child: Container(
                  width: 164,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(247, 153, 64, 1),   // button color
                    borderRadius: BorderRadius.circular(8),   // rounded corners
                  ),
                  child: const Center(
                    // text displayed inside the button
                    child: Text(
                      'SUBMIT',
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
            ),
          ],
        ),
      ),
    );
  }
}
