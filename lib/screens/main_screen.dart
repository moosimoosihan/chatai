import 'package:chatai/viewmodel/chat_view.dart';
import 'package:chatai/viewmodel/home_view.dart';
import 'package:chatai/viewmodel/settings_view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ai chat',
      theme: ThemeData(primaryColor: Colors.white),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('ai chat App'),
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
                text: 'chat',
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: 'settings',
              )
            ],
          ),
        ),
      ),
    );
  }
}
