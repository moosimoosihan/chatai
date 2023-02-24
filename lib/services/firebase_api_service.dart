import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  String id;
  String name;
  String documentId;

  FirebaseService({
    required this.id,
    required this.name,
    required this.documentId,
  });
  // 메시지 전송
  void SendMessage(int chatNum, String userText, String aiText) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection(id).doc(documentId).get();
    if (snapshot.exists) {
      await FirebaseFirestore.instance.collection(id).doc(documentId).set({
        'chats$chatNum': FieldValue.arrayUnion([userText, aiText]),
        'chatNum': chatNum,
      });
    } else {
      AddChatRoom(userText, aiText);
    }
  }

  // 새로운 채팅방(도큐멘트 생성)
  void AddChatRoom(String userText, String aiText) async {
    await FirebaseFirestore.instance.collection(id).doc(documentId).set(
      {
        'name': name,
        'chats0': FieldValue.arrayUnion([userText, aiText]),
        'chatNum': 0,
      },
    );
  }

  // 채팅방 정보를 가져오기
  void ChatInfo(String id) {}

  // 채팅방 삭제
  void DelChatRoom() async {
    await FirebaseFirestore.instance.collection(id).doc(documentId).delete();
  }

  // 채팅 수정
  void ReChat(int chatNum, String userText, String aiText) async {
    await FirebaseFirestore.instance.collection(id).doc(documentId).update({
      'chat$chatNum': userText,
      'chats$chatNum': FieldValue.arrayUnion([userText, aiText]),
    });
  }
}
