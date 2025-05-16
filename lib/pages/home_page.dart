import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/food_model.dart';
import '../widgets/my_search_field.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> items = ['All', 'Combo', 'Sliders', 'Classic'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final foodProvider = Provider.of<FoodProvider>(context);
    final foodList = foodProvider.foods;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Title & Profile Image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Foodgo',
                    style: GoogleFonts.lobster(
                      color: Colors.black,
                      fontSize: 50,
                    ),
                  ),
                  Image.asset('assets/images/profile.png', height: 50),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Subtitle
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Order your favorite food',
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 16),

            // Search Field
            MySearchField(controller: TextEditingController()),

            const SizedBox(height: 20),

            // Category Selector
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final bool isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? 20 : 12,
                        right: index == items.length - 1 ? 20 : 0,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? const Color(0xFFEF2A39)
                                : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        items[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Food Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: GridView.builder(
                  itemCount: foodList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (context, index) {
                    final food = foodList[index];
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Food image
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => DetailPage(food: food),
                                  ),
                                );
                              },
                              child: Image.asset(
                                food.image,
                                height: 110,
                                width: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            food.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            food.category,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.amber,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(food.rating),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  foodProvider.toggleFavorite(food);
                                },
                                child: Icon(
                                  food.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color:
                                      food.isFavorite
                                          ? Colors.red
                                          : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
