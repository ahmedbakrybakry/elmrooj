import 'package:flutter/material.dart';

import 'about_us.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      theme: ThemeData(
        
       fontFamily: "cairo",
        useMaterial3: true,
      ),
      home: const AboutUs(),
    );
  }
}
