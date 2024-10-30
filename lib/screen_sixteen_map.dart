import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String? _selectedAddress; // To store selected address
  String? _selectedMapImage; // To store selected map image

  // List of donation organizations in Kuching
  final List<Map<String, String>> _donationOrganizations = [
    {'name': 'The Green Ribbon Association Kuching', 'address': 'No. 54, Lorong 2, Jalan Laksamana Cheng Ho, Sarawak, 93350 Kuching', 'mapImage': 'lib/images/the_green_ribbon_society.png'},
    {'name': 'The Salvation Army', 'address': '1956, Jalan Sekama, Sekama, 93300 Kuching, Sarawak', 'mapImage': 'lib/images/the_salvation_army.png'},
    {'name': 'Mimie Majid Enterprise', 'address': 'Taman Arbi, 93450 Kuching, Sarawak', 'mapImage': 'lib/images/mimie_majid_enterprise.png'},
    {'name': 'Hope Place Kuching', 'address': 'Survey Lot 3238, Sublot 25, TT3 Commercial Centre, Jalan Canna, 93350 Kuching, Sarawak', 'mapImage': 'lib/images/hope_place_kuching.png'},
    {'name': 'Kuching Community Social Support Centre', 'address': 'Wisma Ho Ho Lim, 291, Jalan Abell, 93100 Kuching, Sarawak', 'mapImage': 'lib/images/kuching_community_social_support.png'},
  ];

  // function to handle organization selection
  void _onOrganizationTap(Map<String, String> organization) {
    setState(() {
      _selectedAddress = organization['address']; // update selected address
      _selectedMapImage = organization['mapImage']; // update selected map image
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation Organizations in Kuching'), // app bar title
        backgroundColor: Colors.green,  // app bar color
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (_selectedMapImage != null)
              Column(
                children: [
                  Image.asset(
                    _selectedMapImage!, // display selected map image
                    height: 710,
                    width: 414,
                    fit: BoxFit.cover,  // fit image to cover the space
                  ),
                  const SizedBox(height: 4.0),  // space between image and address
                  Text(
                    _selectedAddress ?? '', // display selected address
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,  // center align the address text
                  ),
                  const SizedBox(height: 8.0),  // space after the address
                ],
              ),
            const Padding(
              padding: EdgeInsets.all(8.0), // padding around the text
              child: Text(
                'Donation Organizations based on your location:', // description text
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            // list of donation organizations
            ListView.builder(
              itemCount: _donationOrganizations.length, // number of organizations in the list
              itemBuilder: (context, index) {
                final organization = _donationOrganizations[index]; // get organization data
                return ListTile(
                  title: Text(organization['name']!), // display organization name
                  onTap: () => _onOrganizationTap(organization),  // handle tap event
                );
              },
              shrinkWrap: true,  // allow list to take up only needed space
              physics: const NeverScrollableScrollPhysics(), // disable scrolling for the list
            ),
          ],
        ),
      ),
    );
  }
}