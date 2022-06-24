import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Portal(
      child: GetMaterialApp(
        title: 'Profile Screen',
        theme: ThemeData(
          textTheme: const TextTheme().copyWith(bodyText2: GoogleFonts.montserrat()),
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const ProfileScreen(),
      ),
    );
  }
}
