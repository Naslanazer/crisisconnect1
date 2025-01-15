import 'package:crisisconnect1/services/registrationapi.dart';
import 'package:dio/dio.dart';


int?  lid;

Future<void> performLogin(String email, String password) async {
 


  if (email.isEmpty || password.isEmpty) {
    print("Please fill in all fields.");
    return;
  }

  try {
    final Response response = await dio.post(
      '$baseurl/login',
      data: {
        "email": email,
        "password": password,
      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    if (response.statusCode == 200) {
      final data = response.data;
       lid = data['lid']; // Assuming the API returns a token
      print("Login successful! Token: $lid");
    } else {
      print("Login failed: ${response.data['message']}");
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
