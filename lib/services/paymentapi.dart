import 'package:dio/dio.dart';

Future<void> performPayment({
  required String userId,
  required double amount,
  required String paymentMethod,
  required String currency,
}) async {
  final Dio dio = Dio();
  final String paymentUrl = "https://example.com/api/payments";

  // Validation for inputs
  if (userId.isEmpty || amount <= 0 || paymentMethod.isEmpty || currency.isEmpty) {
    print("Please provide valid payment details.");
    return;
  }

  try {
    // Sending POST request to the backend
    final Response response = await dio.post(
      paymentUrl,
      data: {
        "userId": userId,
        "amount": amount,
        "paymentMethod": paymentMethod,
        "currency": currency,
      },
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data;
      print("Payment successful! Transaction ID: ${data['transactionId']}");
    } else {
      print("Payment failed: ${response.data['message']}");
    }
  } on DioException catch (e) {
    if (e.response != null) {
      // Server-side error
      print("Error: ${e.response?.data['message'] ?? 'Unknown error'}");
    } else {
      // Connection or timeout error
      print("Failed to connect to the server. Please try again.");
    }
  } catch (e) {
    print("An unexpected error occurred: $e");
  }
}
