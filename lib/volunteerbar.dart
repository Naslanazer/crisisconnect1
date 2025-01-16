
import 'package:crisisconnect1/donationpage.dart';
import 'package:crisisconnect1/homescreen.dart';
import 'package:crisisconnect1/mapScreen.dart';
import 'package:crisisconnect1/profile.dart';
import 'package:crisisconnect1/task.dart';
import 'package:crisisconnect1/volunteerhome.dart';
import 'package:flutter/material.dart';



class Volunteerbar extends StatefulWidget {
  const Volunteerbar({super.key});

  @override
  _VolunteerbarState createState() => _VolunteerbarState();
}

class _VolunteerbarState extends State<Volunteerbar> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const Volunteerhome(),
    const DonationPage(),
     WebViewScreen(),
    const ProfileScreen(),
    const Volunteer(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.amber[100],
        selectedItemColor: Colors.amber[900],
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Donate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}


// 