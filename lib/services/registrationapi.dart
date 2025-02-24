
// ignore_for_file: depend_on_referenced_packages

// import 'package:bussafety/Api/profileupdateapi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final String baseUrl="http://192.168.137.98:8000";
final dio = Dio();

Future<void> registerUserApi(data,context) async {
  try {
    print('hellooooooo');

    Response response = await dio.post('$baseUrl/userregister',data: data);
   

    // Response response = await dio.post('${apidata}/login?email=${email},password=${Password}');
    print(response);
    print(response.statusCode);
    if (response.statusCode == 200||response.statusCode == 201) {
     print('success');
     snackbarwidget(context, 'Registration Successful');
     Navigator.pop(context);

    } else { 
      throw Exception('failed to get');
    }
  } catch (e) {
    print(e.toString());
    
  }
}


void snackbarwidget(BuildContext context,String message){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 2),
  ));
}