import 'package:crisisconnect1/services/profilefetchapi.dart';
import 'package:crisisconnect1/services/profileupdateapi.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController skillController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    fetch();
    super.initState();
  }

  void fetch() async {
    await fetchUserProfile();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    nameController.text = profiledata['Name'];
    ageController.text = profiledata['age'].toString();
    genderController.text = profiledata['Gender'];
    phoneController.text = profiledata['Phone'].toString();
    emailController.text = profiledata['Email'];
    addressController.text = profiledata['Address'];
    skillController.text = profiledata['Skill'];


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[100],
        elevation: 0,
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
              buildTextField('Name', nameController),
              buildTextField('Age', ageController),
              buildTextField('Gender', genderController),
              buildTextField('Phone', phoneController),
              buildTextField('Email', emailController),
              buildTextField('Address', addressController),
              buildTextField('Skill', skillController),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await updateUserProfile(data: {
                      'Name': nameController.text,
                      'age': ageController.text,
                      'Gender': genderController.text,
                      'Phone': phoneController.text,
                      'Email': emailController.text,
                      'Address': addressController.text,
                    }, context: context);
                     await fetchUserProfile();
                    setState(() {});
                    // Save profile functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[300],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
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

  Widget buildTextField(String labelText, controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 16, color: Colors.brown),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
