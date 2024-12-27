import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SizedBox(
          height: 300,width: 200,
          child: Column(
            children: [
              const Text('Login'),
              const SizedBox(height: 30,),
              TextFormField(
                 decoration: const InputDecoration(
                  labelText: 'Enter your username',
                  border: OutlineInputBorder(),
                ),
                
              ),
              const SizedBox(height: 30,),
                 TextFormField(
                 decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ), 
              ),
              const SizedBox(height: 30,),
              ElevatedButton(onPressed: (){}, child: const Text('Login')),
              const Text('Create an account'),
          
            ] 
          ),
        ),
      ),
    );
  }
}