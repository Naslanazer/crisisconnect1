import 'package:flutter/material.dart';

class Volunteer extends StatelessWidget {
  const Volunteer({super.key});

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
          'Tasks',
          style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Task list header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Available Tasks',
              
            ),
          ),
          
          // ListView to display tasks
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ExpansionTile(
                  leading: Icon(Icons.task), // Icon for task
                  title: Text('Task ${index + 1}'), // Task name
                  subtitle: Text('Description of task ${index + 1}'), // Task description
                  // trailing: Icon(Icons.arrow_forward_ios), // Icon to indicate more details
                 children: [
                  ListTile(title: Text('wxtyduyfkuyfjfykufjymhdc'),trailing: Icon(Icons.radio_button_off_outlined),)
                 ],
                );
              },
              itemCount: 5, // Number of tasks to show
            ),
          ),
        ],
      ),
    );
  }
}
