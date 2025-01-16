import 'package:crisisconnect1/loginpage.dart';
import 'package:crisisconnect1/services/registrationapi.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isVolunteer = false;
  String? selectedSkill = 'se';
  String? selectedGender;

  // Controllers for input fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100], // Light brown background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 20),

                // Title and Subtitle
                Center(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5C3A21),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: const Text(
                    'Create your account',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Form Section
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Username Field
                      InputField(
                        controller: _usernameController,
                        label: 'Username',
                        hintText: 'Enter your username',
                      ),
                      const SizedBox(height: 20),

                      // Name Field
                      InputField(
                        controller: _nameController,
                        label: 'Name',
                        hintText: 'Enter your name',
                      ),
                      const SizedBox(height: 20),

                      // Password Field
                      InputField(
                        controller: _passwordController,
                        label: 'Password',
                        hintText: 'Enter your password',
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),

                      // Email Field
                      InputField(
                        controller: _emailController,
                        label: 'Email',
                        hintText: 'Enter your email',
                      ),
                      const SizedBox(height: 20),

                      // Age Field
                      InputField(
                        controller: _ageController,
                        label: 'Age',
                        hintText: 'Enter your age',
                      ),
                      const SizedBox(height: 20),

                      // Gender Field
                      const Text(
                        'Gender',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<String>(
                              value: 'Male',
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                              title: const Text('Male'),
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<String>(
                              value: 'Female',
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                              title: const Text('Female'),
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      
                      Row(
                        children: [

                          Text("Are you a volunteer?"),
                          Checkbox(
                            value: isVolunteer,
                            onChanged: (val) {
                              setState(() {
                                isVolunteer = val ?? false;
                                selectedSkill = null;
                              });
                            },
                          ),
                          const Text(
                            'Volunteer',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      if (isVolunteer)
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF6E9D8), // Light beige background
                            labelText: 'Choose Skill',
                          ),
                          items: const [
                            DropdownMenuItem(value: 'sel', child: Text('sel')),
                            DropdownMenuItem(value: 'data', child: Text('data')),
                            DropdownMenuItem(value: 'data1', child: Text('data1')),
                          ],
                          onChanged: (val) {
                            setState(() {
                              selectedSkill = val as String?;
                            });
                          },
                        ),
                      const SizedBox(height: 20),

                      // Phone Field
                      InputField(
                        controller: _phoneController,
                        label: 'Phone',
                        hintText: 'Enter your phone number',
                      ),
                      const SizedBox(height: 20),

                      // Address Field
                      InputField(
                        controller: _addressController,
                        label: 'Address',
                        hintText: 'Enter your address',
                      ),
                      const SizedBox(height: 30),

                      // Sign Up Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
Map<String,dynamic>data={
  'Name':_nameController.text,
   'Username': _usernameController.text,
      'Password':_passwordController.text,
      'age': _ageController.text,
      'Gender': selectedGender,
      'Address': _addressController.text,
      'Type': isVolunteer?'volunteer':'user',
      'Skill': selectedSkill,
      'Email': _emailController.text,
      'Phone':_phoneController.text,

      
};

                            registerUserApi(data,context);
                            // Add your signup logic here
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => Loginpage(),
                            //   ),
                            // );

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD2A671),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            'Sign up',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// InputField Widget
class InputField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const InputField({
    required this.controller,
    required this.label,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: const Color(0xFFF6E9D8), // Light beige field background
            contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
