import 'package:crisisconnect1/services/registrationapi.dart';
import 'package:dio/dio.dart';


  /// Fetch skills from the backend
  Future<List<Map<String, dynamic>>> fetchSkills() async {
     String apiUrl = '$baseUrl/SkillAPI'; 

    try {
      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        print(response.data);
        return List<Map<String, dynamic>>.from(response.data);
      } else {
        throw Exception("Failed to load skills");
      }
    } catch (e) {
      throw Exception("An error occurred: $e");
    }
  }

