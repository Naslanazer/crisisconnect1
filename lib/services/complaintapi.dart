import 'package:crisisconnect1/services/loginapi.dart';
import 'package:crisisconnect1/services/registrationapi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<void> submitComplaint(String title,context ) async {
  final Dio dio = Dio();
  final String complaintsUrl = "$baseUrl/ComplaintAPI";

 

  try {
    final Response response = await dio.post(
      complaintsUrl,
      data: {
        "Complaint":title,
        'USER':lid,
       
      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data;
     
     ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Complaint submitted successfully!"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context); 
    } else {
      print("Failed to submit complaint: ${response.data['message']}");
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
