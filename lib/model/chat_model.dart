class ChatModel {
  ChatModel(
    this.id,
    this.name,
    this.usertext,
    this.aitext,
    this.uploadTime,
    this.roomNum,
  );
  final String id;
  final String name;
  final String usertext;
  final String aitext;
  final int uploadTime;
  final int roomNum;

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      json['id'],
      json['name'],
      json['usertext'],
      json['aitext'],
      json['uploadTime'],
      json['roomNum'],
    );
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'usertext': usertext,
      'aitext': aitext,
      'uploadTime': uploadTime,
      'roomNum': roomNum,
    };
  }
}

/// ChatAIResponseModel - AI 채팅 API 결과값
/// Choices - AI 채팅 결과값 Json format

class ChatAIResponseModel {
  final String id;
  final int created;
  final List<dynamic> choices;

  ChatAIResponseModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        created = json['created'],
        choices = json['choices'];
}

class Choices {
  final String text;
  final int index;

  Choices.fromJson(Map<String, dynamic> json)
      : index = json['index'],
        text = json['text'];
}

/// ChatAISendModel - AI 채팅 API 전달값

class ChatAISendModel {
  final String prompt;
  final String model = "text-davinci-003";

  ChatAISendModel(this.prompt);

  Map<String, dynamic> toJson() {
    return {'prompt': prompt, 'model': model, 'max_tokens': 150};
  }
}

// {
//   "model": "text-davinci-003",
//   "prompt": "How can I build a ship",
//   "temperature": 0.9,
//   "max_tokens": 150,
//   "top_p": 1,
//   "frequency_penalty": 0.0,
//   "presence_penalty": 0.6,
//   "stop": [" Human:", " AI:"]
// }

//{
//     "id": "cmpl-6m3NYScD6D9Mo2w0ybfI0EkW1yZ67",
//     "object": "text_completion",
//     "created": 1676910752,
//     "model": "text-davinci-003",
//     "choices": [
//         {
//             "text": "?\n\nBuilding a ship can be a complicated and involved process, depending on the type of vessel you wish to construct. Generally speaking, ships require a combination of basic materials such as wood, metal, and fiberglass, along with specialized tools and components like rudder systems, engines, masts, and sails. You should start by researching how to build a ship of the type that you want to make and familiarize yourself with marine engineering principles, safety precautions, and the different materials available for use. Once you have a better understanding of the process, you can begin to gather the materials and tools needed for the project and create a plan for the construction. It’s also important to factor in additional costs such as labor and labor tools",
//             "index": 0,
//             "logprobs": null,
//             "finish_reason": "length"
//         }
//     ],
//     "usage": {
//         "prompt_tokens": 6,
//         "completion_tokens": 150,
//         "total_tokens": 156
//     }
// }
