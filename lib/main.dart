import 'explicit_animation_and_transitions/scale_transition_widget.dart';
import 'explicit_animation_and_transitions/size_transition_widget.dart';
import 'explicit_animation_and_transitions/rotation_transition_widget.dart';
import 'explicit_animation_and_transitions/animate_positioned_widget.dart';
import 'explicit_animation_and_transitions/fade_and_slide_transition.dart';
import 'explicit_animation_and_transitions/animation_builder_widget.dart';
import 'implicit_animation/animated_align_widget.dart';
import 'implicit_animation/animated_container_widget.dart';
import 'implicit_animation/animated_cross_fade.dart';
import 'implicit_animation/animated_default_textstyle.dart';
import 'implicit_animation/animated_positioned.dart';
import 'implicit_animation/animated_physical_modal.dart';
import 'implicit_animation/my_hero_animation.dart';
import 'implicit_animation/simple_animation.dart';
import 'implicit_animation/tween_animation_builder.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Animations Example'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController = PageController(
    initialPage: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: PageView(
          controller: _pageController,
          children: [
            SimpleAnimation(),
            MyTweenAnimationBuilder(),
            MyHeroAnimation(),
            AnimatedAlignWidget(),
            AnimatedContainerWidget(),
            AnimatedCrossFadeExample(),
            AnimatedDefaultTextStyleWidget(),
            AnimatedPositionedWidget(),
            AnimatedPhysicalModalWidget(),
            AnimationBuilderWidget(),
            FadeAndSlideTransition(),
            PositionedTransitionWidget(),
            RotationTransitionWidget(),
            ScaleTransitionWidget(),
            SizeTransitionWidget(),
          ],
        ),
      ),
    );
  }
}
