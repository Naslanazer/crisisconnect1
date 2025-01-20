import 'package:crisisconnect1/services/loginapi.dart';
import 'package:crisisconnect1/services/registrationapi.dart';
import 'package:dio/dio.dart';


Map<String,dynamic> profiledata={};
Future<void> fetchUserProfile() async {
  final Dio dio = Dio();
  final String profileUrl = "$baseUrl/UserAPI/$lid";

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
      profiledata=data;
      print(data);
      } else {
      print("Failed to fetch profile: ${response.data}");
    }
  } on DioException catch (e) {
   print(e);
  } catch (e) {
    print("An unexpected error occurred: $e");
  }
}
