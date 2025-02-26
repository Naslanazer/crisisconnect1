import 'package:crisisconnect1/services/loginapi.dart';
import 'package:crisisconnect1/services/registrationapi.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Dio _dio = Dio();
Future<List<Map<String, dynamic>>> fetchTasks(context) async {
  String url = '$baseUrl/TaskAPI/$lid'; // Replace with your API URL
  try {
    Response response = await _dio.get(
      url,
    );
    print(response.data);
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(
          response.data); // Assumes API returns a 'tasks' key
    } else {
      showError('Failed to load tasks. Error: ${response.statusCode}', context);
      return [];
    }
  } catch (e) {
    showError('Failed to load tasks. Error: $e', context);
    return [];
  }
}

Future<void> markTaskAsComplete(taskId, context) async {
  String url = '$baseUrl/TaskupdateAPI';
  try {
    Response response = await _dio.put(url, data: {
      'task_id': taskId,
      'Status': 'verify',
    });

    if (response.statusCode == 200) {
      fetchTasks(context); // Refresh task list after completion
      showSuccess('Task marked as completed', context);
    } else {
      // showError('Failed to mark task as complete. Error: ${response.statusCode}',context);
      print(response.data);
    }
  } catch (e) {
    print(e);
    // showError('Failed to complete task. Error: $e',context);
  }
}

void showError(String message, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message, style: const TextStyle(color: Colors.red)),
  ));
}

void showSuccess(String message, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message, style: const TextStyle(color: Colors.green)),
  ));
}
