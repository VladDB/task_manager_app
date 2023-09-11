import 'package:flutter/material.dart';
import 'package:task_manager/components/bottom_nav_bar.dart';
import 'package:task_manager/components/hidden_drawer.dart';
import 'package:task_manager/pages/create_work_page.dart';
import 'package:task_manager/pages/works_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //navigation bar
  var _selectedId = 0;

  void navigateBottomBar(var index) {
    setState(() {
      _selectedId = index;
    });
  }

  //pages
  final List<Widget> _pages = [
    //works page
    WorksPage(),
    //create task page
    CreateWorkPage(),
    //users page
    WorksPage(),
    //dialogs page
    CreateWorkPage(),
  ];

  final List<String> _titles = ['Tasks', 'Creating', 'Users', 'Chat'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text(_titles[_selectedId])),
      //drawer: const HiddenDrawer(),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedId],
    );
  }
}
