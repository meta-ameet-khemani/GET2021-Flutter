import 'package:chat_app/screen/story/story.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final List? storyList;

  const Stories({this.storyList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Your Story'),
            ],
          ),
          Row(
            children: List.generate(
              storyList!.length,
              (index) {
                return Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        storyList![index]['hasStory']
                            ? InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Story(
                                        imageUrl: storyList![index]['imageUrl'],
                                      ),
                                    ),
                                  );
                                  Future.delayed(Duration(seconds: 4)).then(
                                    (value) => Navigator.of(context).pop(),
                                  );
                                }, // showStory(context),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue[300],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 3, top: 3),
                                      child: Container(
                                        width: 53,
                                        height: 53,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                storyList![index]['imageUrl']),
                                          ),
                                        ),
                                      ),
                                    ),
                                    storyList![index]['isOnline']
                                        ? Positioned(
                                            top: 40,
                                            left: 35,
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.green,
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                              )
                            : Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        storyList![index]['imageUrl']),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(storyList![index]['name']),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void showStory(BuildContext context) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      width: 300,
      content: Text('Snackbar at top'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {},
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
