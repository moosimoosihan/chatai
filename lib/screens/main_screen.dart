import 'dart:developer';
import 'package:chatai/viewmodel/chat_view.dart';
import 'package:chatai/viewmodel/home_view.dart';
import 'package:chatai/viewmodel/settings_view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final String id, name;
  //List<List<String>> chatList;
  const MainScreen({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('id: $id, name: $name');
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
