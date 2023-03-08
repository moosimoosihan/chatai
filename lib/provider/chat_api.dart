import 'dart:convert';
import '../model/chat_model.dart';
import 'package:http/http.dart' as http;

class ChatAPI {
  Map<String, String> headers = {
    "Authorization": "하단 auth key 입력 후 테스트 가능",
    "Content-Type": "application/json"
  };

  Future<ChatAIResponseModel> getChat(String chat) async {
    final chatbody = jsonEncode(ChatAISendModel(chat).toJson());
    final url = Uri.parse('https://api.openai.com/v1/completions');
    final response = await http.post(url, body: chatbody, headers: headers);
    if (response.statusCode == 200) {
      final ChatAIResponseModel md =
          ChatAIResponseModel.fromJson(jsonDecode(response.body));
      print(md.choices[0]);
      Choices cs = Choices.fromJson(md.choices[0]);
      print(cs.text);
      return md;
    } else {
      print(response.statusCode);
      print(response.body);
      throw Error();
    }
  }
}
