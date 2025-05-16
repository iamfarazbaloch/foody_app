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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                food.image,
                height: 180,
                width: double.infinity,
              ),
            ),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text(food.rating),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              food.description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, letterSpacing: 1.2),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text('\$${food.price}', style: const TextStyle(fontSize: 24)),

                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEF2A39),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: decreaseQuantity,
                    icon: const Icon(Icons.remove, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    quantity.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEF2A39),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: increaseQuantity,
                    icon: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0xFFEF2A39),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Add to Cart',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
