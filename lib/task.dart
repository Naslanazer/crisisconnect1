import 'package:crisisconnect1/services/taskapi.dart';
import 'package:flutter/material.dart';

class Volunteer extends StatelessWidget {
  const Volunteer({super.key, required this.tasks});
  final tasks;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[100],
        elevation: 0,
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
                  title: Text(
                      '${tasks[index]['Date'].toString().substring(0, 10)}'), // Task name
                  subtitle: Text(
                      'Status ${tasks[index]['Status']}'), // Task description
                  // trailing: Icon(Icons.arrow_forward_ios), // Icon to indicate more details
                  children: [
                    ListTile(
                      title: Text('Task: ${tasks[index]['Task']}'),
                      trailing: tasks[index]['Status']=='completed'?Icon(Icons.check_box):
                      
                      IconButton(onPressed: ()async{
                     await   markTaskAsComplete(tasks[index]['Task_no'], context);
                     Navigator.pop(context);

                      }, icon: Icon(Icons.check_box_outline_blank_outlined)),

                    )
                  ],
                );
              },
              itemCount: tasks.length, // Number of tasks to show
            ),
          ),
        ],
      ),
    );
  }
}
