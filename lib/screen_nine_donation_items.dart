import 'package:flutter/material.dart';
import 'screen_eight_dashboard.dart';
import 'screen_ten_notification.dart';
import 'screen_eleven_cart.dart';
import 'screen_thirteen_user_profile.dart';

// main widget for displaying donation items
class DonationItems extends StatefulWidget {
  const DonationItems({super.key});

  @override
  _DonationItemsState createState() => _DonationItemsState();
}

// State class for DonationItems
class _DonationItemsState extends State<DonationItems> {
  // path for the logo image
  final String logoPath = 'lib/images/titp_asa_logo.png';

  // list of donation items with their images and names
  final List<Map<String, String>> donationItems = [
    {'image': 'lib/images/rice_image.png', 'name': 'Rice'},
    {'image': 'lib/images/cooking_oil_one.png', 'name': 'Cooking Oil'},
    {'image': 'lib/images/salt_image.png', 'name': 'Salt'},
    {'image': 'lib/images/sugar_image.png', 'name': 'Sugar'},
    {'image': 'lib/images/soy_sauce_sweet.png', 'name': 'Sweet Soy Sauce'},
    {'image': 'lib/images/soy_sauce_salty.png', 'name': 'Salty Soy Sauce'},
    {'image': 'lib/images/sardine_can.png', 'name': 'Sardines'},
    {'image': 'lib/images/sunquick_bottle.png', 'name': 'Sunquick'},
    {'image': 'lib/images/flour_image.png', 'name': 'Wheat Flour'},
    {'image': 'lib/images/rice_flour.png', 'name': 'Rice Flour'},
    {'image': 'lib/images/eggs_image.png', 'name': 'Eggs'},
    {'image': 'lib/images/noodles_image.png', 'name': 'Noodles'},
  ];

  // list to hold filtered donation items based on search
  late List<Map<String, String>> filteredItems;
  // controller for the search input field
  late TextEditingController searchController;

  // map to hold item quantities for the cart
  Map<String, int> itemQuantities = {};
  // total count of items in the cart
  int totalCartCount = 0;

  @override
  void initState() {
    super.initState();
    // initialize filtered items to the full list of donation items
    filteredItems = donationItems;
    // initialize the search controller
    searchController = TextEditingController();

    // initialize item quantities to 0 for each donation item
    for (var item in donationItems) {
      itemQuantities[item['name']!] = 0;
    }
  }

  // funtion to filter items based on the search query
  void filterItems(String query) {
    if (query.isEmpty) {
      setState(() {
        // if the search query is empty, reset to the original list
        filteredItems = donationItems;
      });
    } else {
      setState(() {
        // filter items based on the search query
        filteredItems = donationItems
            .where((item) =>
                item['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  // function to increment the quantity of a specific item
  void incrementQuantity(String itemName) {
    setState(() {
      itemQuantities[itemName] = (itemQuantities[itemName] ?? 0) + 1;
      totalCartCount++;
    });
  }

  // function to decrement the quantity of a specific item
  void decrementQuantity(String itemName) {
    if ((itemQuantities[itemName] ?? 0) > 0) {
      setState(() {
        itemQuantities[itemName] = (itemQuantities[itemName] ?? 0) - 1;
        totalCartCount--;
      });
    }
  }

  @override
  void dispose() {
    // dispose of the search controller when no longer needed
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(254, 255, 238, 1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // navigate back to the previous screen
            Navigator.pop(context);
          },
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.black),
                iconSize: 30.0,
                onPressed: () {
                  // Navigate to the cart screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(
                        // pass items with quantities greater than 0 to the cart
                        cartItems: Map.fromEntries(
                          itemQuantities.entries.where((entry) => entry.value > 0),
                        ),
                        itemImages: {
                          // map item names to their corresponding images
                          for (var item in donationItems)
                            item['name']!: item['image']!,
                        },
                      ),
                    ),
                  );
                },
              ),
              // display a badge with the total cart count
              Positioned(
                right: 8,
                top: 8,
                child: totalCartCount > 0
                    ? Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '$totalCartCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Container(),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        width: 420,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(254, 255, 238, 1),
        ),
        child: Column(
          children: [
            // display the logo at the top
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Image.asset(
                logoPath,
                width: 180,
                height: 180,
              ),
            ),
            // search input field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: searchController,
                style: const TextStyle(color: Colors.black),
                onChanged: filterItems, // call filterItems on text change
                decoration: const InputDecoration(
                  labelText: 'Search for items to donate',
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              // GridView to display filtered items
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  String itemName = filteredItems[index]['name']!;
                  return GestureDetector(
                    onTap: () {
                      // Add navigation logic for other items if needed
                    },
                    child: Column(
                      children: [
                        // display the item image
                        Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              filteredItems[index]['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // display the item name
                        Text(
                          itemName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        // row for incrementing/decrementing item quantity
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon:
                                  const Icon(Icons.remove, color: Colors.black),
                              onPressed: () {
                                decrementQuantity(itemName);
                              },
                            ),
                            Text(
                              '${itemQuantities[itemName] ?? 0}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, color: Colors.black),
                              onPressed: () {
                                incrementQuantity(itemName);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // bottom navigation bar
            Container(
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
                  Container(
                    width: 66,
                    height: 57,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/images/map_icon.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
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
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
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
                          image: AssetImage('lib/images/notification_icon.png'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}