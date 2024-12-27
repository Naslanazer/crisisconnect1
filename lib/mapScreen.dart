import 'package:flutter/material.dart';
import 'package:universe/universe.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[100],
        elevation: 0,
        title: const Text(
          'Map',
          style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Map Screen',
              style: TextStyle(fontSize: 18, color: Colors.brown),
            ),
            

U.OpenStreetMap(
  center: [-6.175329, 106.827253],
  type: OpenStreetMapType.HOT,
  zoom: 15,
)
          ],
        ),
      ),
    );
  }
}