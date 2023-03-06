import 'package:chatai/provider/firebase_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  int? maxRoomNum;

  @override
  void initState() {
    super.initState();
    var p = Provider.of<FirebaseService>(context, listen: false);
    FirebaseFirestore.instance
        .collection(p.id)
        .orderBy('roomNum', descending: true)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        setState(() {
          maxRoomNum = value.docs.first['roomNum'];
          print('최대 채팅방 수는 $maxRoomNum개 입니다.');
        });
      } else {
        print('채팅방이 없습니다.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return maxRoomNum != null
        ? ListView.builder(
            itemCount: maxRoomNum!,
            itemBuilder: (context, index) {
              // 채팅방 목록을 보여주는 코드 작성
              return ListTile(
                title: Text('채팅방 ${index + 1}'),
              );
            },
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
