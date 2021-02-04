import 'package:flutter/material.dart';
import 'package:reachme/utils/data.dart';
import 'package:reachme/widgets/CustomDrawer.dart';
import 'package:reachme/widgets/FollowingUsers.dart';
import 'package:reachme/widgets/PostCarousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          'REACHME',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 10.0,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3.0,
          indicatorColor: Theme.of(context).primaryColor,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 18.0,
          ),
          tabs: [
            Tab(text: 'Trending'),
            Tab(text: 'Latest'),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: [
          FollowingUsers(),
          PostCarousel(
            pageController: _pageController,
            title: 'Posts',
            posts: posts,
          ),
          SizedBox(height: 50.0),
        ],
      ),
    );
  }
}
