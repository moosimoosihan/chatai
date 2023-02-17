import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String name;
  List<List<String>> chat;

  User({required this.id, required this.name, required this.chat});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      chat: List<List<String>>.from(map['chat']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'chat': chat,
    };
  }

  Future<void> addUserToFirebase() async {
    await FirebaseFirestore.instance.collection('users').doc(id).set(toMap());
  }
}
