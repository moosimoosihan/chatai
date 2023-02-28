import 'dart:async';

import 'package:chatai/model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChattingProvider extends ChangeNotifier {
  ChattingProvider(this.id, this.name);
  final String id;
  final String name;
  int num = 0;

  var chattingList = <ChatModel>[];

  Stream<QuerySnapshot> getSnapshot() {
    final f = FirebaseFirestore.instance;
    return f
        .collection(id)
        .limit(1)
        .orderBy('uploadTime', descending: true)
        .snapshots();
  }

  void addOne(ChatModel model) {
    chattingList.insert(0, model);
    notifyListeners();
  }

  Future load() async {
    var now = DateTime.now().millisecondsSinceEpoch;
    final f = FirebaseFirestore.instance;
    var result = await f
        .collection(id)
        .where('uploadTime', isGreaterThan: now)
        .orderBy('uploadTime', descending: true)
        .get();
    var l = result.docs.map((e) => ChatModel.fromJson(e.data())).toList();
    chattingList.addAll(l);
    notifyListeners();
  }

  Future send(String usertext, String aitext) async {
    var now = DateTime.now().millisecondsSinceEpoch;
    final f = FirebaseFirestore.instance;
    await f
        .collection(id)
        .doc('$id$num')
        .set(ChatModel(id, name, usertext, aitext, now).toJson());
  }
}
