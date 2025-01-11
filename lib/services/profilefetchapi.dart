import 'package:dio/dio.dart';

Future<void> fetchUserProfile(String userId) async {
  final Dio dio = Dio();
  final String profileUrl = "https://example.com/api/profile/$userId";

  if (userId.isEmpty) {
    print("Invalid user ID.");
    return;
  }

  try {
    final Response response = await dio.get(
      profileUrl,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = response.data;
      print("Profile fetched successfully!");
      print("Name: ${data['name']}");
      print("Email: ${data['email']}");
      print("Avatar: ${data['avatar']}");
    } else {
      print("Failed to fetch profile: ${response.data['message']}");
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
