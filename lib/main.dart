

import 'package:crisisconnect1/bottombarscreen.dart';
import 'package:crisisconnect1/donationpage.dart';
import 'package:crisisconnect1/homescreen.dart';
import 'package:crisisconnect1/loginpage.dart';
import 'package:crisisconnect1/mapScreen.dart';
import 'package:crisisconnect1/signup.dart';
import 'package:crisisconnect1/task.dart';
import 'package:crisisconnect1/volunteerhome.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home:Volunteerhome(),
      debugShowCheckedModeBanner: false,
     
    );
  }
}





 