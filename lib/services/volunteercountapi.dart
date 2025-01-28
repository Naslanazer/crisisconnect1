import 'package:crisisconnect1/services/registrationapi.dart';
import 'package:dio/dio.dart';



  /// Fetch volunteer and donation counts
  Future<Map<String, dynamic>> fetchCounts() async {
     String apiUrl = '$baseUrl/Viewvolunteerscount'; // Replace with your API endpoint

    try {
      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        print(response.data);
        return response.data; // Assumes the response body is a JSON object
      } else {
        throw Exception("Failed to fetch counts");
      }
    } catch (e) {
      throw Exception("An error occurred: $e");
    }
  }

