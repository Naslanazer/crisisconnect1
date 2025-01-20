import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
 
 Dio _dio = Dio();
  Future<List<Map<String,dynamic>>> getmap(context) async {
    const String url = 'https://example.com/api/volunteer/tasks'; // Replace with your API URL
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
       
        return List<Map<String,dynamic>>.from(response.data); // Assumes API returns a 'tasks' key
     
      } else {
       print('failed');
        return[];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

