import 'package:flutter/material.dart';
import 'screen_eight_dashboard.dart';// Import the dashboard screen
import 'screen_ten_notification.dart'; // Import the notification screen
import 'screen_thirteen_user_profile.dart'; // Import the profile screen
import 'screen_sixteen_map.dart';
class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController _feedbackController = TextEditingController();  // container for the feedback text field
  String? _errorMessage;  // error message for the feedback text field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Give Feedback',
          style: TextStyle(
            color: Colors.black, // Set title color to black
          ),
        ),
        backgroundColor: const Color.fromRGBO(254, 255, 238, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),  // padding for the feedback container
              color: const Color.fromRGBO(254, 255, 238, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // align children to the start
                children: [
                  const Text(
                    'Your Feedback:',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(height: 10), // space between text and text field
                  TextField(
                    controller: _feedbackController,  // controller for the text input
                    maxLines: 5,  // allow multiple lines for feedback
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Type your feedback here...',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0), // rounded corners
                      ),
                      errorText: _errorMessage, // display error message if present
                    ),
                  ),
                  const SizedBox(height: 20), // space before the submit button
                  SizedBox(
                    width: double.infinity, // full width for the button
                    child: ElevatedButton(
                      onPressed: _submitFeedback, // call submit function on press
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 15),  // vertical padding
                      ),
                      child: const Text(
                        'Submit Feedback',
                        style: TextStyle(color: Colors.white),  // set text color to white
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom icons section for navigation
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              border: Border(
                top: BorderSide(color: Colors.grey, width: 2),  // top border for the icons section
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),  // vertical padding for the icons
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, // space icons evenly
              children: [
                // Map Icon wrapped in GestureDetector
                GestureDetector(
                  onTap: () {
                    // Navigate to the map screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MapScreen(),
                      ),
                    );
                  },
                child: Container(
                  width: 66,
                  height: 57,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/images/map_icon.png'), // map icon image
                      fit: BoxFit.fitWidth, // fit image within the container
                    ),
                  ),
                ),
            ),
                // Home Icon wrapped in GestureDetector
                GestureDetector(
                  onTap: () {
                    // Navigate to the dashboard or home screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardWidget(),
                      ),
                    );
                  },
                  child: Container(
                    width: 37,
                    height: 43,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/home_icon.png'),  // home icon image
                        fit: BoxFit.fitWidth, // fit image within the container
                      ),
                    ),
                  ),
                ),
                // Notification Icon wrapped in GestureDetector
                GestureDetector(
                  onTap: () {
                    // Navigate to notifications screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScreenTenNotification(),
                      ),
                    );
                  },
                  child: Container(
                    width: 57,
                    height: 43,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/notification_icon.png'),  // notification icon image path
                        fit: BoxFit.fitWidth, // fit image within the container
                      ),
                    ),
                  ),
                ),
                // Profile Icon wrapped in GestureDetector
                GestureDetector(
                  onTap: () {
                    // Navigate to profile screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserProfileScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 45,
                    height: 52,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/profile_icon.png'), // path to profile icon image
                        fit: BoxFit.fitWidth, // fit within the container
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // function to handle the submission feedback
  void _submitFeedback() {
    setState(() {
      // Check if the feedback field is empty
      if (_feedbackController.text.isEmpty) {
        _errorMessage = 'Please enter your feedback before submitting.';  // show error message
      } else {
        // If feedback is provided, clear the error message and proceed
        _errorMessage = null;

        // Clear the feedback input field
        _feedbackController.clear();

        // Show a success message (using a simple snackbar here)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Feedback submitted successfully!')),
        );
      }
    });
  }
}