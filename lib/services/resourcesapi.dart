// import 'package:dio/dio.dart';

// Future<void> fetchResources() async {
//   final Dio dio = Dio();
//   final String resourcesUrl = "https://example.com/api/resources";

//   try {
//     final Response response = await dio.get(
//       resourcesUrl,
//       options: Options(
//         headers: {
//           "Content-Type": "application/json",
//         },
//       ),
//     );

//     if (response.statusCode == 200) {
//       final data = response.data;
//       print("Resources fetched successfully!");
//       for (var resource in data['resources']) {
//         print("Title: ${resource['title']}, Type: ${resource['type']}, URL: ${resource['url']}");
//       }
//     } else {
//       print("Failed to fetch resources: ${response.data['message']}");
//     }
//   } on DioException catch (e) {
//     if (e.response != null) {
//       print("Error: ${e.response?.data['message'] ?? 'Unknown error'}");
//     } else {
//       print("Failed to connect to the server. Please try again.");
//     }
//   } catch (e) {
//     print("An unexpected error occurred: $e");
//   }
// }
