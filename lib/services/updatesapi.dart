import 'package:crisisconnect1/services/registrationapi.dart';
import 'package:dio/dio.dart';

Future<Map<String,dynamic>> updateResource() async {
  final Dio dio = Dio();
  final String resourceUrl = "$baseUrl/DisasterAPI";

  try {
    final Response response = await dio.get(
      resourceUrl,
     
    );

    if (response.statusCode == 200) {
      print("Resource updated successfully!");

      print(response.data);
      return response.data;
    } else {
      print("Failed to update resource: ${response.data['message']}");
      return {};
    }
  } on DioException catch (e) {
    print("Failed to update resource: $e");
    return {};
  } catch (e) {
    print("An unexpected error occurred: $e");
    return {};
  }
}
