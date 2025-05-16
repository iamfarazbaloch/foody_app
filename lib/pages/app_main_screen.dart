import 'package:flutter/material.dart';
import 'package:foody_app/pages/chat_page.dart';
import 'package:foody_app/pages/favorite_page.dart';
import 'package:foody_app/pages/home_page.dart';
import 'package:foody_app/pages/profile_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    ProfilePage(),
    ChatPage(),
    FavoritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        backgroundColor: Colors.transparent,
        color: const Color(0xFFEF2A39),
        buttonBackgroundColor: Color(0xFFEF2A39),
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
          Icon(Icons.chat, color: Colors.white),
          Icon(Icons.favorite, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
