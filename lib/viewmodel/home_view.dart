import 'package:chatai/services/firebase_api_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/chat_model.dart';
import '../services/chat_api_services.dart';

class HomeScreen extends StatefulWidget {
  final String id, name;
  const HomeScreen({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String docNum;
  late CollectionReference users;
  late Future<List<ChatModel>> chats;

  final TextEditingController sendController = TextEditingController();

  int chatRoomNum = 0;
  int chatNum = 0;

  @override
  void initState() {
    super.initState();
    chats = ChatApiService.getChats();
    users = FirebaseFirestore.instance.collection(widget.id);
    docNum = '${widget.id}$chatRoomNum';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: users.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamsnapshot) {
          if (streamsnapshot.hasData) {
            return Column(
              children: [
                // 채팅이 보이는 박스
                Flexible(
                  child: ListView.builder(
                    itemCount: streamsnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                          streamsnapshot.data!.docs[index];
                      return Card(
                        child: ListTile(
                          title: Text(documentSnapshot['name']),
                          subtitle: Text(documentSnapshot['chats'].toString()),
                        ),
                      );
                    },
                  ),
                ),
                // 사용자 채팅 입력 박스
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          onSubmitted: (text) {},
                          controller: sendController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Chat',
                          ),
                        ),
                      ),
                      // 사용자 채팅 보내기 버튼
                      GestureDetector(
                        onTap: () {
                          FirebaseService().SendMessage(users, docNum, chatNum,
                              widget.name, sendController.text, 'aiText 대답');
                          sendController.clear();
                          chatNum++;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.lightBlue[200],
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          child: Container(
                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                            child: const Text(
                              'SEND',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }
          if (streamsnapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }
          if (streamsnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
