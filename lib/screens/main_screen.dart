import 'dart:developer';
import 'package:chatai/viewmodel/chat_view.dart';
import 'package:chatai/viewmodel/home_view.dart';
import 'package:chatai/viewmodel/settings_view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final String id, name;
  //List<List<String>> chatList;
  const MainScreen({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    log('id: ${widget.id}, name: ${widget.name}');
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AI chat App'),
        ),
        body: TabBarView(
          children: [
            Center(
                child: HomeScreen(
              id: widget.id,
              name: widget.name,
            )),
            Center(
                child: ChatsScreen(
              id: widget.id,
              name: widget.name,
            )),
            const Center(child: SettingsScreen()),
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
