import 'package:crisisconnect1/services/loginapi.dart';
import 'package:crisisconnect1/services/registrationapi.dart';
import 'package:dio/dio.dart';


List<Map<String,dynamic>> resourcedata=[];
Future<void> resourcelimit() async {
  final Dio dio = Dio();
  final String profileUrl = "$baseUrl/ResourcelimitAPI";

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
      resourcedata=List<Map<String,dynamic>>.from(response.data);
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
