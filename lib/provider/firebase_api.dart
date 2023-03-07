import 'package:chatai/model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseService extends ChangeNotifier {
  String id;
  String name;
  int roomNum;
  var chattingList = <ChatModel>[];
  late DocumentReference firebase =
      FirebaseFirestore.instance.collection('users').doc(id);
  FirebaseService({
    required this.id,
    required this.name,
    required this.roomNum,
  });

  // 메시지 전송
  Future SendMessage(String usertext, String aitext) async {
    var now = DateTime.now().millisecondsSinceEpoch;
    await firebase
        .collection("ChatRoom$roomNum")
        .add(ChatModel(
          id,
          name,
          usertext,
          aitext,
          now,
        ).toJson())
        .then((value) => print("Text Added"))
        .catchError((error) => print("Failed to add text : $error"));
  }

  // 채팅방 생성
  void CreateRoom() {
    chattingList = <ChatModel>[];
    roomNum++;
  }

  // 채팅방 삭제
  void DelChatRoom() async {
    await firebase.collection("ChatRoom$roomNum").doc().delete();
  }

  Stream<QuerySnapshot> getSnapshot() {
    return firebase
        .collection("ChatRoom$roomNum")
        .orderBy('uploadTime', descending: true)
        .limit(1)
        .snapshots();
  }

  void addOne(ChatModel model) {
    chattingList.insert(0, model);
    notifyListeners();
  }

  Future load() async {
    chattingList = <ChatModel>[];
    var result = await firebase
        .collection("ChatRoom$roomNum")
        .orderBy('uploadTime', descending: true)
        .get();
    var l = result.docs.map((e) => ChatModel.fromJson(e.data())).toList();
    chattingList.addAll(l);
    notifyListeners();
  }

  Future<int> roomCount() async {
    late int count = 0;

    // 서브컬렉션을 구하는 로직 필요!

    print('방 개수: $count');
    return count;
  }
}
