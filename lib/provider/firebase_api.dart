import 'package:chatai/model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseService extends ChangeNotifier {
  String id;
  String name;
  int roomNum;
  var chattingList = <ChatModel>[];
  late CollectionReference firebase = FirebaseFirestore.instance
      .collection('users')
      .doc(id)
      .collection('ChatRoom');
  FirebaseService({
    required this.id,
    required this.name,
    required this.roomNum,
  });

  // 메시지 전송
  Future SendMessage(String usertext, String aitext) async {
    var now = DateTime.now().millisecondsSinceEpoch;
    await firebase
        .add(ChatModel(
          id,
          name,
          usertext,
          aitext,
          now,
          roomNum,
        ).toJson())
        .then((value) => print("Text Added"))
        .catchError((error) => print("Failed to add text : $error"));
  }

  // 채팅방 삭제
  void DelChatRoom() async {
    await firebase.doc().delete();
  }

  Stream<QuerySnapshot> getSnapshot() {
    return firebase
        .where('roomNum', isEqualTo: roomNum)
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
    var result = await firebase.orderBy('uploadTime', descending: true).get();
    var l = result.docs
        .map((e) => ChatModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();
    chattingList.addAll(l);
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  Future RoomCount() async {
    int count = 0;
    await firebase.get().then((snapshot) {
      count = snapshot.docs.length;
    });
  }
}
