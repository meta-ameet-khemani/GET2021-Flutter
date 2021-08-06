import '../../provider/conversation_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import 'components/conversations.dart';
import 'components/heading.dart';
import 'components/search_bar.dart';
import 'components/stories.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _storyList = [
    {
      "name": "Novac",
      "imageUrl": "https://randomuser.me/api/portraits/men/31.jpg",
      "isOnline": true,
      "hasStory": true,
    },
    {
      "name": "Derick",
      "imageUrl": "https://randomuser.me/api/portraits/men/81.jpg",
      "isOnline": false,
      "hasStory": false,
    },
    {
      "name": "Mevis",
      "imageUrl": "https://randomuser.me/api/portraits/women/49.jpg",
      "isOnline": true,
      "hasStory": false,
    },
    {
      "name": "Emannual",
      "imageUrl": "https://randomuser.me/api/portraits/men/35.jpg",
      "isOnline": true,
      "hasStory": true,
    },
    {
      "name": "Gracy",
      "imageUrl": "https://randomuser.me/api/portraits/women/56.jpg",
      "isOnline": false,
      "hasStory": false,
    },
    {
      "name": "Robert",
      "imageUrl": "https://randomuser.me/api/portraits/men/36.jpg",
      "isOnline": false,
      "hasStory": true,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 15,
          ),
          child: Consumer<ConversationProvider>(
            builder: (context, value, child) {
              return ListView(
                children: [
                  Heading(),
                  SizedBox(
                    height: 15,
                  ),
                  SearchBar(),
                  SizedBox(
                    height: 15,
                  ),
                  Stories(
                    storyList: _storyList,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // Conversations(conversationList: getConversations()),
                  // Consumer<ConversationProvider>(
                  //   builder: (context, value, child) {
                  //     return Conversations(
                  //         conversationList: value.getConversations());
                  //   },
                  // ),
                  Conversations(conversationList: value.getConversations()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
