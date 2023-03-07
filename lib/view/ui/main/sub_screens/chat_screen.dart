import 'package:chatai/provider/firebase_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({
    Key? key,
  }) : super(key: key);

  @override
  ChatsScreenState createState() => ChatsScreenState();
}

class ChatsScreenState extends State<ChatsScreen> {
  late int maxRoomNum;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<FirebaseService>(context);
    maxRoomNum = 10;
    return Scaffold(
      appBar: AppBar(
        title: const Text('채팅방'),
      ),
      body: ListView.builder(
        itemCount: maxRoomNum,
        itemBuilder: (context, index) {
          // 채팅방 목록을 보여주는 코드 작성
          return ListTile(
            onTap: () {
              setState(() {
                p.roomNum = index;
              });
            },
            title: Text('채팅방 ${index + 1}'),
          );
        },
      ),
    );
  }
}
