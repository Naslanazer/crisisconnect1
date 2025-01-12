import 'package:flutter/material.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
          'Profile',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Center(
              //   child: CircleAvatar(
              //     radius: 50,
              //     backgroundImage: const AssetImage('assets/default_profile.png'), // Replace with your default image asset path
              //     backgroundColor: Colors.grey[300],
              //   ),
              // ),
              const SizedBox(height: 16),
              buildTextField('Name'),
              buildTextField('Age'),
              buildTextField('Gender'),
              buildTextField('Phone'),
              buildTextField('Email'),
              buildTextField('Address'),
              buildTextField('Skill'),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Save profile functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[300],
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
     
    );
  }

  Widget buildTextField(String labelText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 16, color: Colors.brown),
        ),
        const SizedBox(height: 8),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
