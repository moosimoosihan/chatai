// 파이어베이스 연동
import 'package:chatai/model/fire_model.dart';

class FireService {
  static final FireService _fireService = FireService._internal();

  factory FireService() => _fireService;

  FireService._internal();

  late List<List<String>> chatList;
  late FireModel chatTitle;

  // Create
  Future createNewMotto(Map<String, dynamic> json) async {
    // 회원 정보가 중복되었는지 확인 후 회원 찾기 및 등록
  }

  // READ 각각의 데이터를 콕 집어서 가져올때
  Future<FireModel> getFireModel(String userkey) async {
    return FireModel();
  }

  //READ 컬렉션 내 모든 데이터를 가져올때
  Future<List<FireModel>> getFireModels() async {
    List<FireModel> chatList = [];
    FireModel fireModel = chatTitle;
    chatList.add(fireModel);
    return chatList;
  }

//Delete
  Future<void> delFireModel(reference) async {
    await reference.delete();
  }

//Update
  Future<void> updateFireModel(Map<String, dynamic> json, reference) async {
    await reference.set(json);
  }
}
