import 'package:flutter/material.dart';
import 'screen_eight_dashboard.dart';

// SuccessDonate widget for displaying a success message after donation
class SuccessDonate extends StatefulWidget {
  const SuccessDonate({super.key}); // constructor

  @override
  _SuccessDonate createState() => _SuccessDonate(); // create state for this widget
}

class _SuccessDonate extends State<SuccessDonate> {
  @override
  void initState() {
    super.initState();
    // Delay for 5 seconds and then navigate to the login page
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const DashboardWidget()), // navigate to the dashboard screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430,
      height: 932,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(254, 255, 238, 1),  // background color
      ),
      child: Stack(
        children: <Widget>[
          // logo positioned
          Positioned(
            top: 56,  // distance from the top 
            left: 142,  // distance from the left
            child: Container(
              width: 146, // width of the logo container
              height: 118,  // height of the logo container
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/titp_asa_logo.png'),  // logo image path
                  fit: BoxFit.fitWidth, // fit the image width
                ),
              ),
            ),
          ),
          // donation success message
          const Positioned(
            top: 231, // position form the top
            left: 91, // position from the left
            child: Text(
              'Donation Successful!', // success message text
              textAlign: TextAlign.left,  // align text to the left
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),  // text color
                fontFamily: 'Inter',
                fontSize: 20,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          // redirect message
          const Positioned(
            top: 571, // position from the top
            left: 74, // positione from the left
            child: Text(
              'You will be directed back to homepage...', // redirect message text
              textAlign: TextAlign.left,  // align text to the left
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.58), // text color
                fontFamily: 'Inter',
                fontSize: 15,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          // check the icon position
          Positioned(
            top: 299, // position from the top
            left: 100,  // position from the left
            child: Container(
              width: 219, // width of the check icon computer
              height: 217,  // height of the check icon container
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/check_icon.png'), // check icon image
                  fit: BoxFit.fitWidth, // fit the image width
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}