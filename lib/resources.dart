import 'package:flutter/material.dart';

class SupplyResourcesScreen extends StatelessWidget {
  const SupplyResourcesScreen({super.key});

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
          'Supply Resources',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Supply Resources',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Add a little bit of body text here...',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 5),
            buildDropdownField('Select items'),
            buildTextField('Quantity'),
            buildTextField('Details'),
            buildTextField('Date'),
            const SizedBox(height: 5),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Submit functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text(
                  'Donate',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.amber[100],
      //   selectedItemColor: Colors.amber[900],
      //   unselectedItemColor: Colors.black,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite),
      //       label: 'Donate',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
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
        const SizedBox(height: 5),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }

  Widget buildDropdownField(String labelText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 16, color: Colors.brown),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField(
          items: const [
            DropdownMenuItem(
              value: 'Food',
              child: Text('Food'),
            ),
            DropdownMenuItem(
              value: 'Clothes',
              child: Text('Clothes'),
            ),
            DropdownMenuItem(
              value: 'Medicines',
              child: Text('Medicines'),
            ),
          ],
          onChanged: (value) {
            // Handle change
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
