import 'package:flutter/material.dart';
import 'screen_ten_notification.dart';
import 'package:intl/intl.dart'; // Import intl for date formatting
import 'screen_twelve_success_donate.dart';
import 'screen_eight_dashboard.dart';

// cart screen widget for displaying  items in the donation cart
class CartScreen extends StatelessWidget {
  final Map<String, int> cartItems; // map to hold cart item names and their quantities
  final Map<String, String> itemImages; // map to hold item names and their corresponding image paths

  // Text editing controller for the drop-off location input field
  final TextEditingController dropOffLocationController =
      TextEditingController();

  // constructor to initialize cart items and images
  CartScreen({
    super.key,
    required this.cartItems,  // required parameter for cart items
    required this.itemImages, // required parameter for item images
  });

  @override
  Widget build(BuildContext context) {
    // Get the current date and time formatted as 'yyyy-MM-dd – kk:mm
    final String currentDateTime =
        DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart', // title of the app bar
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.normal, color: Colors.black),
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
        padding: const EdgeInsets.all(0), // Remove padding around the container
        color: const Color.fromRGBO(254, 255, 238, 1),  // background color of the body
        child: Column(
          children: [
            // Cart Items List
            Expanded(
              child: cartItems.isEmpty
                  ? const Center(
                      child: Text(
                        'You have no items in your donation cart.', // message when cart is empty
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    )
                  : Column(
                      children: [
                        // Donation Items List
                        Expanded(
                          child: ListView.builder(
                            itemCount: cartItems.length,  // count of items in the cart
                            itemBuilder: (context, index) {
                              String itemName = cartItems.keys.elementAt(index);  // get item name
                              int quantity = cartItems[itemName]!;  // get item quantity
                              String imagePath = itemImages[itemName]!; // get item image path

                              return Card(
                                color: const Color.fromARGB(255, 255, 255, 255),  // card background color
                                elevation: 3, // elevation for shadow effect
                                margin: const EdgeInsets.symmetric(vertical: 8.0),  // vertical margin for spacing
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),  // padding inside the card
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      // Item Image
                                      Container(
                                        width: 80,  // width of the item image
                                        height: 80, // height of the itemimage
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8), // rounded corners
                                          border: Border.all(color: Colors.grey), // border color
                                          image: DecorationImage(
                                            image: AssetImage(imagePath), // load image from asset
                                            fit: BoxFit.cover,  // cover the entire container
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16), // space between image and text
                                      // Item Name and Quantity
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: // align text to the start
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              itemName, // display item name
                                              style: const TextStyle(
                                                fontSize: 18, // font size for item name
                                                fontWeight: FontWeight.bold,  // font weight
                                                color: Colors.black, // text color
                                              ),
                                            ),
                                            const SizedBox(height: 8),  // space between item name and quantity
                                            Text(
                                              'Quantity: $quantity',  // display item quantity
                                              style: const TextStyle(
                                                fontSize: 16, // font size for quantity
                                                color: Colors.grey, // text color for quantity
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        // Donation Date and Time
                        Padding(
                          padding: const EdgeInsets.all(9.0), // padding around the text
                          child: Text(
                            'Donate Time: $currentDateTime',  // display current date and time
                            style: const TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                        // Drop Off Location Input
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),  // horizontal padding for the text field
                          child: TextField(
                            controller: dropOffLocationController,  // text editing controller
                            style: const TextStyle(color: Colors.black), // input text color
                            decoration: const InputDecoration(
                              labelText: 'Enter Drop-off Location', // label for the text field
                              labelStyle: TextStyle(color: Colors.grey),  // label text color
                              border: OutlineInputBorder(), // border for the text field
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),  // space below the text field
                        // Donate Button
                        Padding(
                          padding: const EdgeInsets.all(9.0), // padding around the button
                          child: ElevatedButton(
                            onPressed: () {
                              // Check if the drop-off location is filled
                              if (dropOffLocationController.text.isEmpty) {
                                // Show a message if the field is empty
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please fill in the drop-off location.'), // SnackBar message
                                  ),
                                );
                              } else {
                                // Handle donation logic here
                                String dropOffLocation = dropOffLocationController.text;  // get drop-off location
                                print('Donating items from: $dropOffLocation'); // print drop-off location to console

                                // Navigate to SuccessDonate screen
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) => const SuccessDonate()), // navigate to success screen
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,  // text color for button
                              backgroundColor: Colors.green, // background color for button
                            ),
                            child: const Text('Donate Items'),  // button text
                          ),
                        ),
                      ],
                    ),
            ),
            // Icons Section
            Container(
              height: 80, // Fixed height for icons section
              decoration: const BoxDecoration(
                color: Colors.white, // Background color for icons section
                border: Border(
                  top: BorderSide(color: Colors.grey, width: 2),  // top border for section
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, // space icons evenly
                children: [
                  // map icon
                  Container(
                    width: 66,
                    height: 57,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/map_icon.png'), // path to the map icon image
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  // home icon wrapped in GestureDetector
                  GestureDetector(
                    onTap: () {
                      // navigate to the dashboard screen when tapped
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
                          image: AssetImage('lib/images/home_icon.png'), // path to the home icon image
                          fit: BoxFit.fitWidth, // fit image width
                        ),
                      ),
                    ),
                  ),
                  // notification icon wrapped in GestureDetector
                  GestureDetector(
                    onTap: () {
                      // navigate to the notifications screen when tapped
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
                          image: AssetImage('lib/images/notification_icon.png'),  // path to the notification icon image
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  // profile icon
                  Container(
                    width: 45,
                    height: 52,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/profile_icon.png'), // path to the profile icon image
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
