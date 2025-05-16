import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/food_model.dart';

class DetailPage extends StatefulWidget {
  final FoodModel food;

  const DetailPage({super.key, required this.food});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final food = widget.food;

    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(child: Image.asset(food.image, height: 180)),
            const SizedBox(height: 20),
            Text(
              food.name,
              style: GoogleFonts.lato(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              food.category,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text(food.rating),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Delicious and freshly prepared ${food.name} that satisfies your cravings. Best served hot!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: decreaseQuantity,
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Text(quantity.toString(), style: const TextStyle(fontSize: 20)),
                IconButton(
                  onPressed: increaseQuantity,
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
