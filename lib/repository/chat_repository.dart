import '../provider/chat_api.dart';

class ChatRepository {
  final ChatAPI apiClient;

  ChatRepository({required this.apiClient});

  getAnswer(String text) {
    return apiClient.getChat(text);
  }
}
