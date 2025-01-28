import 'package:crisisconnect1/services/registrationapi.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
 
 Dio _dio = Dio();
  Future<Map<String,dynamic>> getmap() async {
     String url = '$baseUrl/DisasterMapAPI'; // Replace with your API URL
    try {
      Response response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer YOUR_TOKEN', // Add authentication if required
          },
        ),
      );

      if (response.statusCode == 200) {
        print(response.data);
       
        return response.data; // Assumes API returns a 'tasks' key
     
      } else {
       print('failed');
        return{};
      }
    } catch (e) {
      print(e);
      return {};
    }
  }

