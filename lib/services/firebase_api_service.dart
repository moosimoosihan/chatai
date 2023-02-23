import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  // 메시지 전송
  void SendMessage(CollectionReference users, String documentId, int chatNum,
      String name, String userText, String aiText) async {
    DocumentSnapshot snapshot = await users.doc(documentId).get();
    if (snapshot.exists) {
      await users.doc(documentId).update({
        'name': name,
        'chats$chatNum': FieldValue.arrayUnion([userText, aiText]),
        'chatNum': chatNum,
      });
    } else {
      await users.doc(documentId).set(
        {
          'name': name,
          'chats$chatNum': FieldValue.arrayUnion([userText, aiText]),
          'chatNum': chatNum,
        },
      );
    }
  }
}
