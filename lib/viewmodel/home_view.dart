import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/chat_model.dart';
import '../services/chat_api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<ChatModel>> chats;

  @override
  void initState() {
    super.initState();
    chats = ChatApiService.getChats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc('user-id')
            .collection('chat')
            .orderBy('timestamp', descending: true)
            .limit(1)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                //대화 주제
                Row(
                  children: const [
                    Text('홈 스크린'),
                  ],
                ),
                // 채팅이 보이는 박스
                Flexible(
                  // 임시
                  child: ListView(),
                  //child: makeChat(snapshot),
                ),
                // 사용자 채팅 입력 박스
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          onSubmitted: (text) {
                            sendMsg(text);
                          },
                          controller: TextEditingController(),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Chat',
                          ),
                        ),
                      ),
                      // 사용자 채팅 보내기 버튼
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            sendMsg(TextEditingController().text);
                          });
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
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
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

void sendMsg(String text) {
  TextEditingController().clear();
  // api로 채팅 전송
}

//채팅이 어떻게 보일지 설정해야 함, 최근 채팅을 불러와야 함 없다면 welcome 화면!
// ListView makeChat(AsyncSnapshot<QuerySnapshot> snapshot) {
//   return ListView.separated(
    // scrollDirection: Axis.vertical,
    // itemCount: snapshot.data!.size,
    // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    // // itemBuilder: (context, index) {
    // //   //var chat = snapshot.data![index];
    // //   // return Chat(
    // //   //   title: chat.title,
    // //   //   thumb: chat.thumb,
    // //   //   id: chat.id,
    // //   // );
    // // },
    // separatorBuilder: (context, index) => const SizedBox(
    //   width: 40,
    // ),
//   );
// }
