import '../model/conversation.dart';
import '../temp_data/conversations.dart';
import 'package:flutter/material.dart';

class ConversationProvider extends ChangeNotifier {
  List<Conversation> _conversations = [];

  List<Conversation> getConversations() {
    conversationListJson.forEach((element) {
      _conversations.add(Conversation.fromJson(element));
    });
    print('_conversations.length ${_conversations.length}');
    // notifyListeners();
    return _conversations;
  }

  void addMessage(int index, MessageData messageData) {
    _conversations[index].messages!.add(messageData);
    notifyListeners();
  }
}
