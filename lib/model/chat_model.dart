class ChatModel {
  // chat api 모델에 맞게 다시 변형
  final String title, thumb, id;

  ChatModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
