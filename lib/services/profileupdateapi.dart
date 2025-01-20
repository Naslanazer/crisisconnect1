import 'package:crisisconnect1/services/loginapi.dart';
import 'package:crisisconnect1/services/registrationapi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<void> updateUserProfile({context,
  data// Optional field for avatar
}) async {
  final Dio dio = Dio();
  final String profileUrl = "$baseUrl/profileupdateAPI/$lid";

 

  try {
    
    final Response response = await dio.put(
      profileUrl,
      data:data,
     
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      print("Profile updated successfully!");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile Updated Successfully')));
    } else {
      print("Failed to update profile: ${response.data['message']}");
    }
  } on DioException catch (e) {
    if (e.response != null) {
      print("Error: ${e.response?.data ?? 'Unknown error'}");
    } else {
      print("Failed to connect to the server. Please try again.");
    }
  } catch (e) {
    print("An unexpected error occurred: $e");
  }
}
