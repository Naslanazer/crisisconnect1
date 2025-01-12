import 'package:flutter/material.dart';


class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[100],
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () {
        //     // Navigate back
        //   },
        // ),
        title: const Text(
          'Emergency',
          style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Icon(
                  Icons.notifications_active,
                  size: 100,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              buildEmergencyButton('National Emergency no : 112'),
              buildEmergencyButton('Police : 100'),
              buildEmergencyButton('Fire : 101'),
              buildEmergencyButton('Ambulance : 102'),
              buildEmergencyButton('Women : 1091'),
              buildEmergencyButton('Air Ambulance : 9540161344'),
              buildEmergencyButton('Disaster Management : 1078'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget buildEmergencyButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          // Add call functionality if needed
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber[100],
          padding: const EdgeInsets.symmetric(vertical: 16),
          minimumSize: const Size(double.infinity, 50), // Ensures equal width and height
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.brown, fontSize: 16),
        ),
      ),
    );
  }
}
