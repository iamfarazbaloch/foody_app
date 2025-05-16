import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:foody_app/widgets/my_search_field.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title & Profile Image
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

            // Subtitle
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Order your favorite food',
                style: TextStyle(fontSize: 16),
              ),
            ),

            // Search Field
            MySearchField(controller: TextEditingController()),

            // Category Selector
            const SizedBox(height: 20),
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
          ],
        ),
      ),
    );
  }
}
