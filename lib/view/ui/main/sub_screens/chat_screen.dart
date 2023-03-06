import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chatai/provider/firebase_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/firebase_api.dart';

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
    Provider.of<FirebaseService>(context, listen: false).listenToChatRooms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<FirebaseService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('채팅방'),
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        key: UniqueKey(),
        stream: p.listenToChatRooms(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('로딩 실패'));
          } else {
            var roomTitles = snapshot.data!.docs;
            maxRoomNum = roomTitles.length;
            return ListView.builder(
              itemCount: maxRoomNum,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: Text(
                        '채팅방 $index',
                        style: const TextStyle(fontSize: 17),
                      ),
                    ),
                    Hero(
                      tag: 'chathero',
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(0))),
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              p.roomNum = index;
                            });
                          },
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => p.DelChatRoom(index),
                          ),
                          title: Text(roomTitles[index].get('usertext'),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18)),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
