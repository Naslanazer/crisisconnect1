import 'package:crisisconnect1/payment.dart';
import 'package:crisisconnect1/resources.dart';
import 'package:flutter/material.dart';



class DonationPage extends StatelessWidget {
  const DonationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD9C3A3), // Beige color
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: const Text(
          'Donate',
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            'Select the type of donation',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          DonationOption(
            destination:PaymentScreen() ,
            icon: Icons.attach_money,
            title: 'Donate as cash.',
            description: 'donate for a cause in the form of amount',
          ),
          SizedBox(height: 20),
          DonationOption(
            destination: SupplyResourcesScreen(),
            icon: Icons.favorite,
            title: 'Donate as supplies.',
            description:
                'donate for a cause in form of supplies like food, clothes, medicines etc',
          ),
        ],
      ),
     
    );
  }
}

class DonationOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final destination;

  const DonationOption({super.key, 
    required this.icon,
    required this.title,
    required this.description,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>destination));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF8E8D6), // Light beige color
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black, size: 40),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width-180,
                  child: Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

