import 'package:dio/dio.dart';

Future<void> updateResource({
  required String resourceId,
  String? title, // Optional: Update title
  String? type,  // Optional: Update type
  String? url,   // Optional: Update URL
}) async {
  final Dio dio = Dio();
  final String resourceUrl = "https://example.com/api/resources/$resourceId";

  if (resourceId.isEmpty) {
    print("Invalid resource ID.");
    return;
  }

  try {
    final Response response = await dio.put(
      resourceUrl,
      data: {
        if (title != null) "title": title,
        if (type != null) "type": type,
        if (url != null) "url": url,
      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    if (response.statusCode == 200) {
      print("Resource updated successfully!");
    } else {
      print("Failed to update resource: ${response.data['message']}");
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
