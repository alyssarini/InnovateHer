import 'package:flutter/material.dart';
// import necessary screens
import 'screen_ten_notification.dart'; // Import the notification screen
import 'screen_fourteen_faq.dart'; // Import the FAQ screen
import 'screen_fifteen_feedback.dart';
import 'screen_sixteen_map.dart';
import 'screen_eight_dashboard.dart';

// UserProfileScreen widget to display and edit user profile information
class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState(); // create state for this widget
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  // Sample user data
  final String username = "john_doe"; // user's username
  String email = "johndoe@google.com"; // user email
  String phone = "+0123456789"; // mutable phone
  String address = "1234 Elm Street, City, Country"; // mutable user address
  final String profileImagePath = 'lib/images/profile_icon.png';  // path to the profile image

  // Controllers for text fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController(); // Controller for address

  @override
  void initState() {
    super.initState();
    // Initialize text fields with current values
    emailController.text = email;
    phoneController.text = phone;
    addressController.text = address; // Initialize address controller
  }

  // function to show dialog for editing phone number
  void showEditPhoneDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Phone Number'),
          content: TextField(
            controller: phoneController,
            decoration: const InputDecoration(labelText: 'Phone Number'), // text field for phone number
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  phone = phoneController.text; // Update phone number
                });
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  // function to show dialog for editing address
  void showEditAddressDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Address'),
          content: TextField(
            controller: addressController,
            decoration: const InputDecoration(labelText: 'Address'),  // text field for address
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  address = addressController.text; // Update address
                });
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Profile',
          style: TextStyle(
            color: Colors.black,  // title text color
          ),
        ),
        backgroundColor: const Color.fromRGBO(254, 255, 238, 1),  // AppBar background color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),  // Back button
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Container(
        width: 420,
        height: 932,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(254, 255, 238, 1),  // background color
        ),
        child: Column(
          children: [
            const SizedBox(height: 80), // Space for title
            // Profile Picture
            CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage(profileImagePath), // display profile image
            ),
            const SizedBox(height: 80), // Space between image and text
            // User Information
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username: $username',  // display username
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 38), // space below username
                  // Email display
                  Text(
                    'Email: $email',
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 35), // space below email
                  // Phone display with edit icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Phone: $phone',  // display phone number
                          style: const TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit), // edit icon
                        onPressed: () {
                          showEditPhoneDialog(context); // Show the phone edit dialog
                        },
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // space below phone number
                  // Address display with edit icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Address: $address',  // display address
                          style: const TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          showEditAddressDialog(context); // Show the address edit dialog
                        },
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 66), // Space before buttons
            // Buttons for Give Feedback and FAQ
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to feedback page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FeedbackScreen()
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue, // Background color
                        padding: const EdgeInsets.symmetric(vertical: 10),  // button padding
                      ),
                      child: const Text('Give Feedback'), // button text
                    ),
                  ),
                  const SizedBox(width: 10), // Space between buttons
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to FAQ screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FAQScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue, // Background color
                        padding: const EdgeInsets.symmetric(vertical: 10),  // button padding
                      ),
                      child: const Text('FAQ'), // button text
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30), // Space before icons
            // Icons Section with Background Border
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                border: Border(
                  top: BorderSide(color: Colors.grey, width: 2),  // top border
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Map Icon
                  GestureDetector(
                    onTap: () {
                      // Navigate to map screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MapScreen(),
                        ),
                      );
                    },
                    child:
                  Container(
                    width: 66,
                    height: 57,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/map_icon.png'), // map icon image path
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
              ),
                  // Home Icon wrapped in GestureDetector
                  GestureDetector(
                    onTap: () {
                      // Navigate to dashboard screen
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
                          image: AssetImage('lib/images/home_icon.png'),  // home icon image path
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  // Notification Icon wrapped in GestureDetector
                  GestureDetector(
                    onTap: () {
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
                          image: AssetImage('lib/images/notification_icon.png'),  // notification icon image
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  // Profile Icon
                  Container(
                    width: 45,
                    height: 52,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/profile_icon.png'), // profile photo image path
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
