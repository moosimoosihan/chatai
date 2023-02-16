// 파이어베이스 연동
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseApiService {
  final user = FirebaseAuth.instance.currentUser!;
  // ignore: deprecated_member_use
  final databaseReference = FirebaseDatabase.instance.reference();
  void firebase() async {
    await databaseReference.child('users/${user.uid}').set({
      'id': '홍길동',
      'name': 'hong@example.com',
    });
  }
}
