import 'package:flutter/material.dart';
import '../modal/list_item.dart';

class ListItemDetails extends StatefulWidget {
  final ListItem listItem;

  ListItemDetails(this.listItem);

  @override
  _ListItemDetailsState createState() => _ListItemDetailsState();
}

class _ListItemDetailsState extends State<ListItemDetails>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _colorAnimation;
  Animation<double> _sizeAnimation;
  Animation _curveAnimation;
  IconData icon;
  bool isFav = false;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red)
        .animate(_animationController);

    _curveAnimation = CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _animationController,
    );

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween(begin: 30, end: 50),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween(begin: 50, end: 30),
        weight: 50,
      ),
    ]).animate(_curveAnimation);
    // ]).animate(_animationController);

    _animationController.addStatusListener((status) {
      if (_animationController.status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      } else if (_animationController.status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        padding: EdgeInsets.zero,
        height: 620,
        width: double.infinity,
        child: Column(
          children: [
            Hero(
              tag: widget.listItem.imageURL,
              child: Container(
                height: 400,
                width: double.infinity,
                child: Image.asset(
                  widget.listItem.imageURL,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          widget.listItem.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          widget.listItem.title,
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: _colorAnimation.value,
                          size: _sizeAnimation.value,
                        ),
                        onPressed: () {
                          isFav
                              ? _animationController.reverse()
                              : _animationController.forward();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: 100,
                width: 390,
                child: Text(
                  widget.listItem.description,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
