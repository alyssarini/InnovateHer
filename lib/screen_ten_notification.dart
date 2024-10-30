import 'package:flutter/material.dart';
import 'screen_thirteen_user_profile.dart';
import 'screen_sixteen_map.dart';
import 'screen_eight_dashboard.dart';

// notification screen widget
class ScreenTenNotification extends StatelessWidget {
  const ScreenTenNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',  // title of the app bar
          style: TextStyle(
            color: Colors.black,  // text color for the title
          ),
        ),
        backgroundColor: const Color.fromRGBO(254, 255, 238, 1),  // app bar background color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),  // back button icon
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen when pressed
          },
        ),
      ),
      body: Container(
        width: 420, // width of the notification body
        height: 932,  // height of the notification body
        decoration: const BoxDecoration(
          color: Color.fromRGBO(254, 255, 238, 1),  // background color for the container
        ),
        child: Column(
          children: [
            const SizedBox(height: 20), // Space for title
            const SizedBox(height: 200), // Space before the icon
            // Center Icon Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  // Notification Icon in Center
                  Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/notification_icon.png'), // path to the notification icon image
                        fit: BoxFit.contain,  // fit the image within the container
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Space between icon and text
                  // No Message Notification Text
                  const Text(
                    'No new notifications', // message displayed when there are no notifications
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(), // Push icons section to the bottom
            // Icons Section with Background Border
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),  // background color of the icon container
                border: Border(
                  top: BorderSide(color: Colors.grey, width: 2),  // border on top of the container
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),  // vertical padding for the container
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, // space icons evenly
                children: [
                  // Map Icon
                  GestureDetector(
                    onTap: () {
                      // Navigate to the map screen when tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MapScreen(),
                        ),
                      );
                    },
                    child:Container(
                    width: 66,
                    height: 57,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/map_icon.png'), // path to the map icon image
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  ),
                  // Home Icon wrapped in GestureDetector
                  GestureDetector(
                    onTap: () {
                      // Navigate to dashboard screen when tapped
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
                          image: AssetImage('lib/images/home_icon.png'),  // path to the home icon image
                          fit: BoxFit.fitWidth, // fit the image width
                        ),
                      ),
                    ),
                  ),
                  // Notification Icon (not wrapped in GestureDetector for interaction)
                  Container(
                    width: 57,
                    height: 43,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/notification_icon.png'),  // path to the notification icon image
                        fit: BoxFit.fitWidth, // fit the image width
                      ),
                    ),
                  ),
                  // Profile Icon
                  GestureDetector(
                    onTap: () {
                      // navigate to the user profile screen when tapped
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
                        image: AssetImage('lib/images/profile_icon.png'), // pathh to the profile icon image
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
