import 'package:chatai/model/chat_model.dart';
import 'package:chatai/services/firebase_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChattingItem extends StatelessWidget {
  const ChattingItem({Key? key, required this.chattingModel}) : super(key: key);
  final ChatModel chattingModel;

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<FirebaseService>(context);
    var isMe = chattingModel.id == p.id;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Text(
                  chattingModel.name,
                  style: const TextStyle(fontSize: 17),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                decoration: BoxDecoration(
                    color: isMe ? Colors.grey[700] : Colors.grey[800],
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(30),
                        topRight: const Radius.circular(30),
                        bottomLeft: Radius.circular(isMe ? 30 : 0),
                        bottomRight: Radius.circular(isMe ? 0 : 30))),
                child: Column(
                  children: [
                    Text(
                      chattingModel.usertext,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      chattingModel.aitext,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
