import 'package:flutter/material.dart';
import '../model/chat_model.dart';
import '../services/chat_api_services.dart';
import '../widgets/chat_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<List<ChatModel>> chats = ChatApiService.getChats();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: chats,
        builder: (context, snapshot) {
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
                  child: makeChat(snapshot),
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
                          sendMsg(TextEditingController().text);
                          setState(() {});
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

// 채팅이 어떻게 보일지 설정해야 함
ListView makeChat(AsyncSnapshot<List<ChatModel>> snapshot) {
  return ListView.separated(
    scrollDirection: Axis.vertical,
    itemCount: snapshot.data!.length,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    itemBuilder: (context, index) {
      var chat = snapshot.data![index];
      return Chat(
        title: chat.title,
        thumb: chat.thumb,
        id: chat.id,
      );
    },
    separatorBuilder: (context, index) => const SizedBox(
      width: 40,
    ),
  );
}
