import 'package:flutter/material.dart';

class MySearchField extends StatelessWidget {
  final TextEditingController controller;
  const MySearchField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 60,
            margin: const EdgeInsets.only(
              left: 16,
              top: 16,
              bottom: 16,
              right: 8,
            ),
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  spreadRadius: 3,
                  blurRadius: 2,
                  offset: const Offset(1, 4),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, size: 30),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 60,
          width: 60,
          margin: const EdgeInsets.only(right: 18),
          decoration: BoxDecoration(
            color: const Color(0xFFEF2A39),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(1, 2),
              ),
            ],
          ),
          child: Center(
            child: Image.asset('assets/images/menu.png', fit: BoxFit.contain),
          ),
        ),
      ],
    );
  }
}
