import 'dart:convert';
import '../model/chat_model.dart';
import 'package:http/http.dart' as http;

class ChatApiService {
  static Future<List<ChatModel>> getChats() async {
    List<ChatModel> chatInstances = [];
    // chat api 주소에 맞게 변경 현재는 웹툰을 불러옴
    final url =
        Uri.parse('https://webtoon-crawler.nomadcoders.workers.dev/today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> chats = jsonDecode(response.body);
      for (var chat in chats) {
        chatInstances.add(ChatModel.fromJson(chat));
      }
      return chatInstances;
    }
    throw Error();
  }
}

class ChatAPI {
  Map<String, String> headers = {
    "Authorization": "하단 auth key 입력 후 테스트 가능",
    "Content-Type": "application/json"
  };

  getChat(String chat) async {
    final chatbody = jsonEncode(ChatAISendModel(chat).toJson());
    final url = Uri.parse('https://api.openai.com/v1/completions');
    final response = await http.post(url, body: chatbody, headers: headers);
    if (response.statusCode == 200) {
      final ChatAIResponseModel md =
          ChatAIResponseModel.fromJson(jsonDecode(response.body));
      Choices cs = Choices.fromJson(md.choices[0]);
      return cs.text;
    } else {
      throw Error();
    }
  }
}
