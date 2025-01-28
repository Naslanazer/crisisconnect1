import 'package:crisisconnect1/complaint.dart';
import 'package:crisisconnect1/customeWidgets/chart.dart';
import 'package:crisisconnect1/emergency.dart';
import 'package:crisisconnect1/loginpage.dart';
import 'package:crisisconnect1/profile.dart';
import 'package:crisisconnect1/services/loginapi.dart';
import 'package:crisisconnect1/services/profilefetchapi.dart';
import 'package:crisisconnect1/services/registrationapi.dart';
import 'package:crisisconnect1/services/taskapi.dart';
import 'package:crisisconnect1/services/updatesapi.dart';
import 'package:crisisconnect1/task.dart';
import 'package:crisisconnect1/updatepage.dart';
import 'package:flutter/material.dart';

class Volunteerhome extends StatelessWidget {
  const Volunteerhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber[100], // Beige color
        title:  Text(
          "CrisisConnect",
          style: TextStyle(
            color: Color(0xFF5C3A21),
            fontWeight: FontWeight.bold,
          ),
        ),
       
      ),

      drawer: Drawer(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(decoration: BoxDecoration(color: Color(0xFFD2A671)),
              accountName: Text(volunteerusername),
              accountEmail: Text("$volunteerusername@gmail.com"),
              // currentAccountPicture: CircleAvatar(
              //   // backgroundImage: AssetImage("assets/images/flood.jpg"),
              // ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
               
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.update),
              title: Text("Updates"),
              onTap: () async{
               Map<String,dynamic>updates=     await    updateResource();
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdatesScreen(updates:updates),
                      ));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  Loginpage()));
              },
            ),
          ],
        ),
      ), // Add navigation drawer here
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome back!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
             Text(
              volunteerusername,
              style: TextStyle(fontSize: 20, color: Colors.brown),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "$baseUrl${disasterdata['Image']}", // Replace with the path to your asset image
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
             Center(
              child: Text('${disasterdata['Details']??" "}',
                // disasterdata['Disaster']??""+'.'+disasterdata['Location']??""+'.'+disasterdata['Details']??"",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Current Status:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              _StatusCard(label: "Volunteers", value: '${volentercount['volunteercount']??0}'),
                _StatusCard(label: "Donations", value: '${disasterdata['total_donation']??0}'),
              ],
            ),
            const SizedBox(height: 24),
            Center(
              child: InkWell(
                onTap: ()async {
                 Map<String,dynamic>updates=     await    updateResource();
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdatesScreen(updates:updates),
                      ));
                },
                child: Text(
                  "Check for more updates",
                  style: TextStyle(
                      color: Colors.brown, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ActionButton(
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  ReportIssueScreen()));
                  },
                  icon: Icons.edit,
                  label: "Report \na crisis",
                ),
                _ActionButton(
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EmergencyScreen()));
                  },
                  icon: Icons.contacts,
                  label: "Emergency\n contacts",
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ActionButton(
                  ontap: ()async {
            List<Map<String, dynamic>>tasks=      await  fetchTasks(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  Volunteer(tasks:tasks)));
                  },
                  icon: Icons.edit,
                  label: "View tasks",
                
                ),
              ],
            ),
            Container(
              child: CustomProgressChart(),
            )
          ],
        ),
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  final String label;
  final String value;

  const _StatusCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5DC), // Light beige color
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final ontap;

  const _ActionButton(
      {required this.icon, required this.label, required this.ontap});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF5F5DC), // Light beige color
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
