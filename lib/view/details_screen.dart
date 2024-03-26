import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String name;
  final String price;
  final String description;
  final String category;
  final String image;
  final String rating;

  const DetailsScreen({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 233, 186),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 80, 139, 74),
        title: const Text("Details Screen"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                height: 220,
                width: double.infinity,
                child: Image.network(image),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 1),
              Row(
                children: [
                  Text(category,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800])),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text("₹ $price",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 30),
              Text(description,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700])),
              const SizedBox(height: 50),
              Text(rating,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
