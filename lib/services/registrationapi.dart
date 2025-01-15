import 'package:dio/dio.dart';

Dio dio = Dio();
 final  baseurl=" 192.168.1.84:5000";

Future<void> registerUser(String name, String email, String password,String age,String gender,String phone,String address,String skill) async {
  

  try {
    Response response = await dio.post(
      '$baseurl/register',  // Replace with your registration API endpoint
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
