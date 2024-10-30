import 'package:flutter/material.dart';
import 'screen_eight_dashboard.dart';// Import the screen eight file
import 'screen_ten_notification.dart'; // Import the notification screen
import 'screen_thirteen_user_profile.dart';
import 'screen_sixteen_map.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  // Keeps track of which panels are expanded (true = expanded, false = collapsed)
  late List<bool> _isExpanded;

  // List of explanations for each FAQ
  final List<String?> _explanations = [
    'Titip Asa is a food bank initiative where food donations are collected and distributed to those in need. It serves as a bridge between donors and recipients, ensuring that food is accessible to everyone.',
    'Anyone who wishes to support the cause can donate. There are no restrictions on who can contribute, as long as the items donated meet the guidelines for accepted donations.',
    'Donation locations can be found through the Titip Asa app or website, where all designated drop-off points are listed. Each location is marked to help donors find the nearest and most convenient spot.',
    'Donations are primarily accepted in the form of food items. This includes non-perishable goods such as canned foods, dried beans, rice, and pasta, as well as fresh ingredients like fruits, vegetables, and dairy products. Additionally, we welcome prepared meals that are sealed and safe for distribution. Our goal is to provide essentials that can help feed those in need, ensuring that everyone has access to nutritious and wholesome food. While food items are the focus, we may also consider other essential items, such as toiletries or hygiene products, based on current community needs.',
  ];

  // controller for the inquiry text field
  final TextEditingController _inquiryController = TextEditingController();
  String? _inquiryErrorMessage; // error message for the inquiry text field

  @override
  void initState() {
    super.initState();
    // Initialize _isExpanded list based on the number of explanations
    _isExpanded = List<bool>.filled(_explanations.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FAQ',
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
              padding: const EdgeInsets.all(16.0),
              color: const Color.fromRGBO(254, 255, 238, 1),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // FAQ List
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),  // prevent scrolling in this list
                      shrinkWrap: true, // allow the ListView to take only the necessary space
                      itemCount: _explanations.length,  // total number of FAQs
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  // toggle the expanded state of the FAQ panel
                                  _isExpanded[index] = !_isExpanded[index];
                                });
                              },
                              child: ListTile(
                                title: Text(
                                  _getTitle(index), // get the title for the FAQ
                                  style: const TextStyle(color: Colors.black), // Set title color to black
                                ),
                                trailing: Icon(
                                  _isExpanded[index]
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                  color: Colors.black, // Set arrow icon color to black
                                ),
                              ),
                            ),
                            // show explanation if the FAQ is expanded
                            if (_isExpanded[index])
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  _explanations[index] ?? 'No explanation available.',  // show explanation or fallback text 
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black, // Set explanation color to black
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    // Inquiry Section
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Text(
                            'Send us an inquiry:',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 10),
                  // text field for user inquiries
                  TextField(
                    controller: _inquiryController,
                    maxLines: 5,  // allow multiple lines
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Type your inquiry here...',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0), // rounded corners for the border
                      ),
                      errorText: _inquiryErrorMessage,  // show error message if present
                    ),
                  ),
                    const SizedBox(height: 20),
                    // submit button for the inquiry
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submitInquiry,  // call the submit function on press
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 15),  // vertical padding
                        ),
                        child: const Text(
                          'Submit Inquiry',
                          style: TextStyle(color: Colors.white),  // set text color to white
                        ),
                      ),
                    ),
                  ],
                ),
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
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround, // space icons evenly
              children: [
                // Map Icon
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
                        image: AssetImage('lib/images/map_icon.png'),
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
                        image: AssetImage('lib/images/home_icon.png'),
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
                        image: AssetImage('lib/images/notification_icon.png'),
                        fit: BoxFit.fitWidth, // fit image within the container
                      ),
                    ),
                  ),
                ),
                // Profile Icon
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
                        image: AssetImage('lib/images/profile_icon.png'),
                        fit: BoxFit.fitWidth, // fit image within the container
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

  // function to handle the submission of inquiries
  void _submitInquiry() {
    setState(() {
      // Check if the inquiry field is empty
      if (_inquiryController.text.isEmpty) {
        _inquiryErrorMessage = 'Please enter your inquiry before submitting.';  // show error message
      } else {
        // If inquiry is provided, clear the error message and proceed
        _inquiryErrorMessage = null;

        // Clear the inquiry input field
        _inquiryController.clear();

        // Show a success message (using a simple snackbar here)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Inquiry submitted successfully!')),
        );
      }
    });
  }

  // function to get the title for each FAQ
  String _getTitle(int index) {
    switch (index) {
      case 0:
        return 'How Does Titip Asa Work?';  // title for the first FAQ
      case 1:
        return 'Who Can Donate?'; // title for the second FAQ
      case 2:
        return 'How Do I Find Donation Locations?'; // title for the third FAQ
      case 3:
        return 'What Type of Donations Are Accepted?';  // title for the fourth FAQ
      default:
        return '';  // default case for unrecognized indices
    }
  }
}

