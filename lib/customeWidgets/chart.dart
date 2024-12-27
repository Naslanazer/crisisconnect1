import 'package:flutter/material.dart';

class ProgressData {
  final String category;
  final double available;
  final double total;
  final Color color;

  ProgressData({
    required this.category,
    required this.available,
    required this.total,
    required this.color,
  });
}

class CustomProgressChart extends StatelessWidget {
  final List<ProgressData> progressData = [
    ProgressData(category: 'Food', available: 40, total: 100, color: Colors.green),
    ProgressData(category: 'Clothes', available: 70, total: 100, color: Colors.blue),
    ProgressData(category: 'Medical', available: 50, total: 100, color: Colors.red),
    ProgressData(category: 'Shelter', available: 30, total: 100, color: Colors.orange),
  ];

   CustomProgressChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Resource Progress",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200, // Height to accommodate vertical bars
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: progressData.map((data) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        // Total progress bar (background)
                        Container(
                          width: 20,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        // Available progress bar (foreground, aligned to bottom)
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: 20,
                            height: (data.available / data.total) * 120, // Calculate height proportionally
                            decoration: BoxDecoration(
                              color: data.color,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${data.available.toInt()}/${data.total.toInt()}',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      data.category,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.brown),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}


