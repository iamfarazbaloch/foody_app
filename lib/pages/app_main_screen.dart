import 'package:flutter/material.dart';
import 'package:foody_app/pages/chat_page.dart';
import 'package:foody_app/pages/favorite_page.dart';
import 'package:foody_app/pages/home_page.dart';
import 'package:foody_app/pages/profile_page.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFEF2A39),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade300,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        ],
      ),
    );
  }
}
