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
String? usertype;

String volunteerusername = '';

Map<String,dynamic>disasterdata={};
Map<String, dynamic>volunteercount={}; 
Future<void> performLogin(String email, String password, BuildContext context) async {
  if (email.isEmpty || password.isEmpty) {
    showSnackbar(context, "Please fill in all fields.", Colors.red);
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

    print("Response Data: ${response.data}"); // Debugging line

    if (response.statusCode == 200 && response.data != null) {
      if (response.data['message'] == 'success') {
        final data = response.data;
        lid = data['login_id'];
        print("Login successful! Token: $lid");
        volunteerusername=email.replaceAll('@gmail.com', '');
        disasterdata = await getmap();
        disasterLocation = disasterdata['Location'];
        await resourcelimit();
        volunteercount = await fetchCounts();
        print('ssssss$volunteercount');

        usertype = data['user_type'];

        if (usertype == 'volunteer') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Volunteerbar()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomBarScreen()),
          );
        }
      } else {
        showSnackbar(context, response.data['message'] ?? "Invalid username or password.", Colors.red);
      }
    } else {
      showSnackbar(context, "Login failed. Please try again.", Colors.red);
    }
  } on DioException catch (e) {
    print("DioException: $e"); // Debugging line
    if (e.response != null && e.response?.data is Map && e.response?.data['message'] != null) {
      showSnackbar(context, e.response?.data['message'], Colors.red);
    } else {
      showSnackbar(context, "Failed to connect to the server. Please try again.", Colors.red);
    }
  } catch (e) {
    print("Unexpected Error: $e"); // Debugging line
    showSnackbar(context, "An unexpected error occurred.", Colors.red);
  }
}

void showSnackbar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: TextStyle(color: Colors.white)),
      backgroundColor: color,
      duration: Duration(seconds: 3),
    ),
  );
}

