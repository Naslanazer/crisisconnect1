import 'package:dio/dio.dart';

Future<void> submitComplaint(String userId, String title, String description) async {
  final Dio dio = Dio();
  final String complaintsUrl = "https://example.com/api/complaints";

  if (userId.isEmpty || title.isEmpty || description.isEmpty) {
    print("Please fill in all fields.");
    return;
  }

  try {
    final Response response = await dio.post(
      complaintsUrl,
      data: {
        "userId": userId,
        "title": title,
        "description": description,
      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data;
      print("Complaint submitted successfully! Reference ID: ${data['referenceId']}");
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
