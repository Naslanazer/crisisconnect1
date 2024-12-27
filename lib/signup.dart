import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isVolenteer = false;
  String? selectedSkill = 'se';
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 500,
          width: 450,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text('Signup'),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Gender', style: TextStyle(fontSize: 16)),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Male',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                        ),
                        const Text('Male'),
                        Radio<String>(
                          value: 'Female',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                        ),
                        const Text('Female'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Checkbox(
                      value: isVolenteer,
                      onChanged: (val) {
                        setState(() {
                          isVolenteer = !isVolenteer;
                          selectedSkill = null;
                        });
                      },
                    ),
                    const Text('Volunteer')
                  ],
                ),
                if (isVolenteer)
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Choose Skill',
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'sel',
                        child: Text('sel'),
                      ),
                      DropdownMenuItem(
                        value: 'data',
                        child: Text('data'),
                      ),
                      DropdownMenuItem(
                        value: 'data1',
                        child: Text('data1'),
                      ),
                    ],
                    onChanged: (val) {
                      setState(() {
                        selectedSkill = val;
                      });
                    },
                  ),
                if (selectedSkill == 'other' && isVolenteer)
                  const SizedBox(height: 30),
                if (selectedSkill == 'other' && isVolenteer)
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter Skill',
                      border: OutlineInputBorder(),
                    ),
                  ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: () {}, child: const Text('Signup')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
