import 'package:dio/dio.dart';

Future<void> addResource({
  required String title,
  required String type, // E.g., "document", "video", etc.
  required String url,  // URL or location of the resource
}) async {
  final Dio dio = Dio();
  final String resourcesUrl = "https://example.com/api/resources";

  if (title.isEmpty || type.isEmpty || url.isEmpty) {
    print("Please provide valid resource details.");
    return;
  }

  try {
    final Response response = await dio.post(
      resourcesUrl,
      data: {
        "title": title,
        "type": type,
        "url": url,
      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    if (response.statusCode == 201) {
      print("Resource added successfully!");
    } else {
      print("Failed to add resource: ${response.data['message']}");
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
