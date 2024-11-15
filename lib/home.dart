import 'package:c5_test/mock_datas.dart';
import 'package:c5_test/screens/chat_screen.dart';
import 'package:c5_test/screens/marketplace_screen.dart';
import 'package:c5_test/screens/mypage.dart';
import 'package:c5_test/screens/post_upload_screen.dart';
import 'package:c5_test/screens/search_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int screenIndex = 0;

  final screens = [
    MarketplaceScreen(),
    const SearchScreen(),
    const PostUploadScreen(),
    const ChatScreen(),
    const Mypage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Image.network(
              "https://logowik.com/content/uploads/images/starbucks1710.jpg",
              height: 100,
            ),
          )),
      body: SafeArea(
        child: screens.elementAt(screenIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: screenIndex,
        onTap: (value) {
          setState(() {
            screenIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add_outlined), label: 'Add'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'MyPage'),
        ],
      ),
    );
  }
}
