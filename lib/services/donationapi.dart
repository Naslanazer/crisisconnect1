import 'package:dio/dio.dart';

Future<void> performDonation({
  required String userId,
  required List<Map<String, dynamic>> supplies, // List of supplies
  String? message, // Optional message from the donor
}) async {
  final Dio dio = Dio();
  final String donationUrl = "https://example.com/api/donations";

  if (userId.isEmpty || supplies.isEmpty) {
    print("Please provide valid donation details.");
    return;
  }

  try {
    final Response response = await dio.post(
      donationUrl,
      data: {
        "userId": userId,
        "supplies": supplies, // Supply details
        "message": message,
      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data;
      print("Donation successful! Reference ID: ${data['referenceId']}");
    } else {
      print("Failed to process donation: ${response.data['message']}");
    }
  } on DioException catch (e) {
    if (e.response != null) {
      // Server error
      print("Error: ${e.response?.data['message'] ?? 'Unknown error'}");
    } else {
      // Connection error or timeout
      print("Failed to connect to the server. Please try again.");
    }
  } catch (e) {
    print("An unexpected error occurred: $e");
  }
}
