class Conversation {
  String? name;
  String? imageUrl;
  bool? isOnline;
  bool? hasStory;
  List<MessageData>? messages;

  Conversation({
    this.name,
    this.imageUrl,
    this.isOnline,
    this.hasStory,
    this.messages,
  });

  factory Conversation.fromJson(Map<String, Object> mapData) {
    List<MessageData> messages = [];
    for (var item in mapData['messages'] as Iterable<dynamic>) {
      messages.add(MessageData(
        message: item['message'],
        time: item['time'],
      ));
    }
    return Conversation(
      name: mapData['name'] as String?,
      imageUrl: mapData['imageUrl'] as String?,
      isOnline: mapData['isOnline'] as bool?,
      hasStory: mapData['hasStory'] as bool?,
      messages: messages,
    );
  }
}

class MessageData {
  String? message;
  String? time;

  MessageData({
    this.message,
    this.time,
  });

  factory MessageData.fromJson(Map<String, Object> mapData) {
    return MessageData(
      message: mapData['message'] as String?,
      time: mapData['time'] as String?,
    );
  }
}
