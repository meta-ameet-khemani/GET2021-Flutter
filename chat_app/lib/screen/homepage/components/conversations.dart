import '../../../model/conversation.dart';
import '../../../screen/user_conversation/user_conversation.dart';
import 'package:flutter/material.dart';

class Conversations extends StatelessWidget {
  final List<Conversation>? conversationList;

  const Conversations({this.conversationList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        conversationList!.length,
        (index) {
          return InkWell(
            child: Row(
              children: [
                Container(
                  child: Column(
                    children: [
                      conversationList![index].hasStory!
                          ? Stack(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue[300],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 3, top: 3),
                                  child: Container(
                                    width: 43,
                                    height: 43,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            conversationList![index].imageUrl!),
                                      ),
                                    ),
                                  ),
                                ),
                                conversationList![index].isOnline!
                                    ? Positioned(
                                        top: 30,
                                        left: 35,
                                        child: Container(
                                          width: 15,
                                          height: 15,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green,
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            )
                          : Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      conversationList![index].imageUrl!),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UserConversation(
                          chatData: conversationList![index],
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        conversationList![index].name!,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 135,
                        child: Text(
                          conversationList![index]
                                  .messages![
                                      conversationList![index].messages!.length -
                                          1]
                                  .message! +
                              " - " +
                              conversationList![index]
                                  .messages![
                                      conversationList![index].messages!.length -
                                          1]
                                  .time!,
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF000000).withOpacity(0.7)),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
