import 'package:crisisconnect1/bottombarscreen.dart';
import 'package:crisisconnect1/homescreen.dart';
import 'package:crisisconnect1/services/registrationapi.dart';
import 'package:crisisconnect1/volunteerbar.dart';
import 'package:crisisconnect1/volunteerhome.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


int?  lid;

Future<void> performLogin(String email, String password,context) async {
 


  if (email.isEmpty || password.isEmpty) {
    print("Please fill in all fields.");
    return;
  }

  try {
    final Response response = await dio.post(
      '$baseUrl/LoginAPI',
      data: {
        "username": email,
        "password": password,
      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    print(response.data);
    if (response.statusCode == 200&&response.data['message']=='success') {
      final data = response.data;
       lid = data['login_id']; // Assuming the API returns a token
      print("Login successful! Token: $lid");


    if (data['user_type']=='volunteer') {
      
Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Volunteerbar()),
  );


    }else{
Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => BottomBarScreen()),
  );
      
    }


    } else {
      print("Login failed: ${response.data['message']}");
    }
  } on DioException catch (e) {
    if (e.response != null) {
      // Server error
      print("Error: ${e.response?.data['message'] ?? 'Unknown error'}");
    } else {
      // Connection error or timeout
      print("Failed to connect to the server. Please try again.");
    }
  } catch (e) {
    print("An unexpected error occurred: $e");
  }
}
