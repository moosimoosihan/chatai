import 'package:chatai/viewmodel/chat_view.dart';
import 'package:chatai/viewmodel/home_view.dart';
import 'package:chatai/viewmodel/settings_view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AI chat App'),
        ),
        body: const TabBarView(
          children: [
            Center(child: HomeScreen()),
            Center(child: ChatScreen()),
            Center(child: SettingsScreen()),
          ],
        ),
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: 'home',
            ),
            Tab(
              icon: Icon(Icons.chat),
              text: 'chats',
            ),
            Tab(
              icon: Icon(Icons.settings),
              text: 'settings',
            )
          ],
        ),
      ),
    );
  }
}
