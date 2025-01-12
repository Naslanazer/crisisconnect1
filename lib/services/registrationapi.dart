import 'package:dio/dio.dart';

Future<void> registerUser(String name, String email, String password,String age,String gender,String phone,String address,String skill) async {
  Dio dio = Dio();

  try {
    Response response = await dio.post(
      'https://your-api-endpoint.com/register',  // Replace with your registration API endpoint
      data: {
        'name': name,
        'email': email,
        'password': password,
        'age':age,
        'gender':gender,
        'phone':phone,
        'address':address,
        'skill':skill,

      },
    );

    if (response.statusCode == 200) {
      print('Registration successful: ${response.data}');
    } else {
      print('Failed to register: ${response.data}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
