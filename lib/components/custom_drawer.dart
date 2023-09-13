import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../model/user_session.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  UserSession? _session;
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    _session = box.read('session');
    return Drawer(
      width: 300,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue.shade400),
              child: Center(
                child: ListTile(
                  leading: Icon(
                      Icons.supervised_user_circle,
                    size: 50,
                  ),
                  title: Text(_session?.username ?? 'user'),
                  subtitle: Text(_session?.host ?? 'localhost'),
                ),
              )
          )
        ],
      ),
    );
  }
}
