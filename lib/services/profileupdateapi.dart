import 'package:dio/dio.dart';

Future<void> updateUserProfile({
  required String userId,
  required String name,
  required String email,
  String? avatarUrl, // Optional field for avatar
}) async {
  final Dio dio = Dio();
  final String profileUrl = "https://example.com/api/profile/$userId";

  if (userId.isEmpty || name.isEmpty || email.isEmpty) {
    print("Please provide valid profile details.");
    return;
  }

  try {
    
    final Response response = await dio.put(
      profileUrl,
      data: {
        "name": name,
        "email": email,
        "avatar": avatarUrl, // Optional
      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      print("Profile updated successfully!");
    } else {
      print("Failed to update profile: ${response.data['message']}");
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
