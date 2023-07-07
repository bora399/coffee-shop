import 'package:coffee_shop/pages/homepage.dart';
import 'package:coffee_shop/pages/splashpage.dart';
import 'package:coffee_shop/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Coffee Shop",
      theme: ThemeData(
        primaryColor:COLOR_WHITE,
          textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context).textTheme,
      )),
      home: Splash(),
    );
  }
}
