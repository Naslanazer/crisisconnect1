import 'package:crisisconnect1/bottombarscreen.dart';
import 'package:crisisconnect1/homescreen.dart';
import 'package:crisisconnect1/mapScreen.dart';
import 'package:crisisconnect1/services/mapapi.dart';
import 'package:crisisconnect1/services/registrationapi.dart';
import 'package:crisisconnect1/services/resourcelimitapi.dart';
import 'package:crisisconnect1/services/volunteercountapi.dart';
import 'package:crisisconnect1/volunteerbar.dart';
import 'package:crisisconnect1/volunteerhome.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


int?  lid;


String volunteerusername = '';

Map<String,dynamic>disasterdata={};
Map<String, dynamic>volentercount={}; 

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
    volunteerusername =email;
    print(response.data);
    if (response.statusCode == 200&&response.data['message']=='success') {
      final data = response.data;
       lid = data['login_id']; // Assuming the API returns a token
      print("Login successful! Token: $lid");
disasterdata= await getmap();
disasterLocation=disasterdata['Location'];
await resourcelimit();
volentercount=await fetchCounts();


      // adsfgv
      


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
