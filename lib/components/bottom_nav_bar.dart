import 'package:flutter/material.dart';

class MyBottomNavBar extends StatefulWidget {
  void Function(int)? onTabChange;

  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _currentIndex = 0;

  void setCurrentIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black26,
            width: 10,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setCurrentIndex(value);
          widget.onTabChange!(value);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black26,
        elevation: 0,
        selectedItemColor: Colors.amber.shade500,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Works',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create_sharp),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}
