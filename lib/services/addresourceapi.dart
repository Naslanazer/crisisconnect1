import 'package:crisisconnect1/services/registrationapi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<void> addResource({
 data ,context // URL or location of the resource
}) async {
  final Dio dio = Dio();
  final String resourcesUrl = '$baseUrl/ResourceAPI';

 

  try {
    final Response response = await dio.post(
      resourcesUrl,
      data:data,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    print(response.data);

    if (response.statusCode == 201) {
      print("Resource added successfully!");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Resource added successfully!"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    } else {
      print("Failed to add resource: ${response.data['message']}");
    }
  } on DioException catch (e) {
    if (e.response != null) {
      print("Error: ${e.response?.data['message'] ?? 'Unknown error'}");
    } else {
      print("Failed to connect to the server. Please try again.");
    }
  } catch (e) {
    print("An unexpected error occurred: $e");
  }
}
