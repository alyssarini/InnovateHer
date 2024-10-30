// import necessary flutter material package for UI componenets
import 'package:flutter/material.dart';

// import custom screen for displaying the logo
import 'package:titip_asa_app/screen_one_logo.dart';

void main() { // main entry point for the app
  runApp(const MyApp());  // run the MyApp widget
}

// root widget of the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',  // set app title
      theme: ThemeData(
        useMaterial3: false,  // disable material 3 design for default material 2 theme
      ),
      home: const TitipAsaApp(),  // set the initial screen to TitipAsaApp
    );
  }
}