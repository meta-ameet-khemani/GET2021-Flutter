import 'package:flutter/material.dart';
import '../../components/bottom_nav_bar.dart';
import '../../components/hamburger_menu.dart';
import '../../components/use_avatar.dart';
import '../../components/app_bar.dart';
import 'components/place_categories.dart';
import 'components/popular_places.dart';
import 'components/recommended.dart';
import 'components/recommended_places.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: buildAppBar(
        context: context,
        title: 'Discover',
        leading: HamburgerMenu(),
        actions: [
          UseAvatar(),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PlaceCategories(),
            PopularPlaces(),
            Recommended(),
            RecommendedPlaces(),
          ],
        ),
      ),
    );
  }
}
