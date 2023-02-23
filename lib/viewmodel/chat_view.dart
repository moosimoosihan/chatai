import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  final String id, name;

  const ChatsScreen({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late CollectionReference users = FirebaseFirestore.instance.collection(id);
    return Scaffold(
      body: StreamBuilder(
        stream: users.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamsnapshot) {
          if (streamsnapshot.hasData) {
            return Column(children: [
              // 채팅목록이 보이는 박스
              Flexible(
                child: ListView.builder(
                  itemCount: streamsnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        streamsnapshot.data!.docs[index];
                    return Card(
                      child: ListTile(
                        title: Text(documentSnapshot['name']),
                        subtitle: Text(documentSnapshot['chats0'].toString()),
                      ),
                    );
                  },
                ),
              ),
            ]);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
