import 'package:flutter/material.dart';

class FadeAndSlideTransition extends StatefulWidget {
  @override
  _FadeAndSlideTransitionState createState() => _FadeAndSlideTransitionState();
}

class _FadeAndSlideTransitionState extends State<FadeAndSlideTransition> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondPage(),
              ),
            );
          },
          child: Text('Show Image'),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 3000),
      vsync: this,
    );

    // _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    Future.delayed(Duration(microseconds: 200))
        .then((value) => _animationController.forward());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(50),
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: FadeTransition(
                      opacity: _animationController,
                      child: Text(
                        'Angry Little Bird',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Image.asset('assets/images/angry_bird.jpg'),
                    ),
                  ),
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(_animationController),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 80,
                        width: 500,
                        color: Theme.of(context).primaryColor,
                        child: Center(
                          child: Text(
                            'Nice Bird!',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
