import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool isVolenteer = false;
  String? selectedSkill='se';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              
              width: 450,
              child: Column(children: [
                const Text('Signup'),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: isVolenteer,
                        onChanged: (val) {
                          setState(() {
                            isVolenteer = !isVolenteer;
                            selectedSkill=null;
                          });
                        }),
                    const Text('volunteer')
                  ],
                ),
                if (isVolenteer)
                
                DropdownButtonFormField(
                  decoration: const InputDecoration(border: OutlineInputBorder(),labelText: 'Choose Skill'),
                    // value: selectedSkill,
                    items: const [
                      DropdownMenuItem(value: 'sel',child: Text('sel'),),
                      DropdownMenuItem(value: 'data',child: Text('data'),),
                      DropdownMenuItem(value: 'data1', child: Text('data1')),
                      DropdownMenuItem(value: 'other',child: Text('other'),),
          
                    ],
                    onChanged: (val) {
                      setState(() {
                         selectedSkill = val;
                      });
                     
                    }),
                     if(selectedSkill=='other'&&isVolenteer)
                const SizedBox(
                  height: 30,
                ),
                // Text('register as a volunteer?'),
                if(selectedSkill=='other'&&isVolenteer)
                 TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'enter skill',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(onPressed: () {}, child: const Text('Signup')),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
