import 'package:flutter/material.dart';

import 'sub_screens/chat_screen.dart';
import 'sub_screens/home_screen.dart';
import 'sub_screens/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: [
            Center(child: HomeScreen()),
            Center(child: ChatsScreen()),
            Center(child: SettingsScreen()),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: 'Chat',
            ),
            Tab(
              icon: Icon(Icons.chat),
              text: 'Chats',
            ),
            Tab(
              icon: Icon(Icons.settings),
              text: 'Settings',
            )
          ],
        ),
      ),
    );
  }
}
