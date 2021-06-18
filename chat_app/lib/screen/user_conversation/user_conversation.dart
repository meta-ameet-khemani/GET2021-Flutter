import 'package:intl/intl.dart';

import '../../provider/conversation_provider.dart';
import 'package:provider/provider.dart';
import '../../model/conversation.dart';
import 'package:flutter/material.dart';

class UserConversation extends StatefulWidget {
  final Conversation? chatData;

  const UserConversation({this.chatData});

  @override
  _UserConversationState createState() => _UserConversationState();
}

class _UserConversationState extends State<UserConversation> {
  TextEditingController? _textController;
  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ConversationProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 70,
          leading: Container(
            padding: EdgeInsets.only(left: 30),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(widget.chatData!.imageUrl!),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          title: Text(
            widget.chatData!.name!,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.only(
            left: 8,
            top: 8,
            right: 8,
          ),
          height: MediaQuery.of(context).size.height,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
                  // color: Colors.green[300],
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: List.generate(
                        widget.chatData!.messages!.length,
                        (index) {
                          MessageData messageData =
                              widget.chatData!.messages![index];
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.08,
                            // color: Colors.blue[200],
                            child: Text(
                                '${messageData.message} - ${messageData.time}'),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      TextField(
                        cursorHeight: MediaQuery.of(context).size.height * 0.04,
                        controller: _textController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        // onChanged: (value) => print(value),
                      ),
                      Container(
                        width: 50,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue,
                        ),
                        child: InkWell(
                          onTap: () {
                            print(_textController!.text);
                            _textController!.clear();
                            FocusScope.of(context).unfocus();
                            // print(DateFormat.jm(DateTime.now()).toString());
                          },
                          // => provider.addMessage(
                          //   0,
                          //   MessageData(
                          //     message: _textController.value.toString(),
                          //     time: DateFormat.jm(DateTime.now()).toString(),
                          //   ),
                          // ),
                          child: Icon(
                            Icons.send,
                            size: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              // Container(
              //   margin: EdgeInsets.only(
              //     top: 2,
              //     bottom: 6,
              //   ),
              //   padding: EdgeInsets.only(left: 10),
              //   width: double.infinity,
              //   height: MediaQuery.of(context).size.height * 0.08,
              //   decoration: BoxDecoration(
              //     color: Colors.grey[300],
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: TextField(
              //           controller: TextEditingController(),
              //           decoration: InputDecoration(
              //             // hintText: 'Hello !!!',
              //             hintStyle: TextStyle(
              //               fontWeight: FontWeight.bold,
              //               fontSize: 25,
              //             ),
              //             border: InputBorder.none,
              //             suffixIcon: InkWell(
              //               onTap: () => provider.addMessage(
              //                 0,
              //                 MessageData(
              //                   message: 'Latest Message',
              //                   time: 'asdf',
              //                 ),
              //               ),
              //               child: Container(
              //                 height: MediaQuery.of(context).size.height * 0.08,
              //                 width: 50,
              //                 decoration: BoxDecoration(
              //                   color: Colors.blue[300],
              //                   borderRadius: BorderRadius.circular(15),
              //                 ),
              //                 child: Icon(
              //                   Icons.send,
              //                   size: 30,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
