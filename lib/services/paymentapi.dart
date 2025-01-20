import 'package:crisisconnect1/services/loginapi.dart';
import 'package:crisisconnect1/services/registrationapi.dart';
import 'package:crisisconnect1/services/taskapi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<void> performPayment({
 
  required  amount,context
  
}) async {
  final Dio dio = Dio();
  final String paymentUrl = '$baseUrl/DonationAPI/$lid/';
  // Validation for inputs
 
  try {
    // Sending POST request to the backend
    final Response response = await dio.post(
      paymentUrl,
      data: {
        "Amount": amount,
       
      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data;
      print("Payment successful! Transaction ID: ${data['transactionId']}");

      Navigator.pop(context);
      showSuccess('payment successful',context);
      
    } else {
      print("Payment failed: ${response.data['message']}");
    }
  } on DioException catch (e) {
    if (e.response != null) {
      // Server-side error
      print("Error: ${e.response?.data['message'] ?? 'Unknown error'}");
    } else {
      // Connection or timeout error
      print("Failed to connect to the server. Please try again.");
    }
  } catch (e) {
    print("An unexpected error occurred: $e");
  }
}
