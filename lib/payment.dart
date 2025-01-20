import 'package:crisisconnect1/services/paymentapi.dart';
import 'package:flutter/material.dart';



class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String paymentMethod = '';  // Holds selected payment method (debit or credit)
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  // Toggle method to show debit or credit card fields
  void togglePaymentFields(String method) {
    setState(() {
      paymentMethod = method;
    });
  }

  // A simple function for 'Pay' button action (this can be expanded with payment logic)
  void processPayment() async{
    if (paymentMethod == 'debit' || paymentMethod == 'credit') {
      // You can replace this with actual payment processing logic
     await performPayment(amount:amountController.text,context: context );
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Payment Successful'),
          content: const Text('Payment has been processed successfully!'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFF8E8D8),  // Set background color of the screen
              borderRadius: BorderRadius.circular(20), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Dropdown to select payment method
                const Text(
                  'Select Payment Method:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                DropdownButton<String>(
                  value: paymentMethod.isEmpty ? null : paymentMethod,
                  hint: const Text('Select Method'),
                  items: const [
                    DropdownMenuItem(value: 'debit', child: Text('Debit Card')),
                    DropdownMenuItem(value: 'credit', child: Text('Credit Card')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      togglePaymentFields(value);
                    }
                  },
                ),
                const SizedBox(height: 20),
        
                // Debit Card Fields
                if (paymentMethod == 'debit') ...[
                  TextField(
                    controller: cardNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Debit Card Number',
                      hintText: 'Enter Debit Card Number',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 2),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: amountController,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                      hintText: 'Enter Amount',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 2),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: processPayment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const Color(0xFFD4A373), // Background color
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text('Pay with Debit'),
                  ),
                ],
        
                // Credit Card Fields
                if (paymentMethod == 'credit') ...[
                  TextField(
                    controller: cardNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Credit Card Number',
                      hintText: 'Enter Credit Card Number',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 2),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: amountController,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                      hintText: 'Enter Amount',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 2),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: processPayment,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4A373), // Background color
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text('Pay with Credit'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
