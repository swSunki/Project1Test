import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.shifting,

      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.add_outlined), label: 'Add'),
        BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: 'Chat'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'MyPage'),
      ],
      // onTap: ScreenProvider.setCurrentPage(index);,
    );
  }
}
