import 'package:flutter/material.dart';
import 'screen_nine_donation_items.dart';
import 'screen_ten_notification.dart'; // Import ScreenTenNotification
import 'screen_thirteen_user_profile.dart';
import 'screen_two_login_signup.dart';
import 'screen_sixteen_map.dart';

// main widget for the Dashboard page
class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

// state class for DashboardWidget
class _DashboardWidgetState extends State<DashboardWidget> {  // controller for the feedback section
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Placeholder for the profile photo path
  final String _profilePhotoPath = 'lib/images/profile_icon.png';

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();  // dispose of the page controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(254, 255, 238, 1),
        iconTheme: const IconThemeData(color: Colors.black),  // set icon color
        elevation: 0,
      ),
      drawer: _buildDrawer(), // Hamburger menu
      body: Container(
        width: 420,
        height: 932,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(254, 255, 238, 1),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildLogoSection(),
              _buildUserProfileSection(),
              _buildUserFeedbackSection(),
              _buildDonationSection(),
              _buildIconsSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for the hamburger menu (Drawer)
  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        color: const Color.fromRGBO(
            254, 255, 238, 1), // Light background color for the entire drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(
                    254, 255, 238, 1), // Same light background color
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(_profilePhotoPath),
                    radius: 40,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'john_doe',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.black),
              title:
                  const Text('About Us', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
                _showAboutUsDialog(context);
              },
            ),
            const Divider(), // Add a Divider here
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black),
              title:
                  const Text('Log Out', style: TextStyle(color: Colors.black)),
              onTap: () {
                _confirmLogout(context);
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  // show About Us details in a dialog
  void _showAboutUsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('About Us'),
          content: const Text(
            '"Titip Asa" is a mobile app designed to bridge the gap by providing a seamless connection '
            'between food donors and organizations that can distribute food to vulnerable communities. '
            'The app helps coordinate donations, reduce food waste, and increase awareness of food insecurity.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // to confirm log out with a dialog
  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log Out'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginSignupPage()),
                );
              },
              child: const Text('Log Out'),
            ),
          ],
        );
      },
    );
  }
  //

  // Widget for the logo section
  Widget _buildLogoSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Image.asset(
        'lib/images/titp_asa_logo.png', // Logo image path
        width: 180,
        height: 180,
      ),
    );
  }

  // Widget for the user profile section
  Widget _buildUserProfileSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: const Color.fromRGBO(254, 255, 238, 1),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage:
                AssetImage(_profilePhotoPath), // Use profile photo path
            radius: 60,
          ),
          const SizedBox(height: 10),
          const Text(
            'john_doe', // Replace with dynamic user name
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // Widget for the User Feedback section with PageView
  Widget _buildUserFeedbackSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: const Color.fromRGBO(254, 255, 238, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'User Feedback',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: PageView(
              controller: _pageController,
              children: [
                _feedbackCard("Great app! It really helps reduce food waste."),
                _feedbackCard("I love how easy it is to donate food."),
                _feedbackCard(
                    "The app has made a significant impact in my community."),
              ],
            ),
          ),
          _buildDotsIndicator(),
        ],
      ),
    );
  }

  // Widget for the Donation section with a call-to-action button
  Widget _buildDonationSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: const Color.fromRGBO(254, 255, 238, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Make a Difference!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '"Giving is not just about making a donation; it is about making a difference!"',
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DonationItems()),
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
            ),
            child: const Text('Donate Food'),
          ),
        ],
      ),
    );
  }

  // Widget for the icons section with navigation buttons for map, home, notifications, and profile
  Widget _buildIconsSection() {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        border: Border(
          top: BorderSide(color: Colors.grey, width: 2),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Map Icon
          GestureDetector(
            onTap: () {
              // Navigate to screen eight
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
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),

          // Home Icon wrapped in GestureDetector
          Container(
            width: 37,
            height: 43,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/home_icon.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),

          // Notification Icon
          GestureDetector(
            onTap: () {
              // Navigate to screen eight
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
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          // Profile Icon
          GestureDetector(
            onTap: () {
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
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // to create feedback cards
  Widget _feedbackCard(String feedback) {
    return Card(
      color: const Color.fromARGB(247, 255, 186, 231),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            feedback,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  // to build the dots indicator
  Widget _buildDotsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.blue : Colors.grey,
          ),
        );
      }),
    );
  }
}