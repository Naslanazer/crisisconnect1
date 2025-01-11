import 'package:dio/dio.dart';

Future<void> performSignup(data) async {
  final Dio dio = Dio();
  final String signupUrl = "https://example.com/api/signup";

 

  try {
    final Response response = await dio.post(
      signupUrl,
      data: data,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data;
      print("Signup successful! Message: ${data['message']}");
    } else {
      print("Signup failed: ${response.data['message']}");
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
