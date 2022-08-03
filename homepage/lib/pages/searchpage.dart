import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homepage/models/comic.dart';
import 'package:homepage/models/nav_bar.dart';
import 'package:homepage/pages/homepage.dart';
import 'package:homepage/pages/searchpage.dart';
import 'package:homepage/util/comic_ui_colors.dart';
import 'package:homepage/widgets/sliver_header.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [ComicUIColors.bg, Colors.white],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft),
      ),
      child: Container(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Stack(
              children: const [
                Body(),
                NavBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Body(),
    Text(
      'Index 1: Favorites',
      style: optionStyle,
    ),
    Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [ComicUIColors.bg, Colors.white],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF3ED2C9),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Header(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: kBottomNavigationBarHeight * 1.4,
          ),
        )
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverCustomHeaderDelegate(
        minHeight: 51,
        maxHeight: 51,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 7.5,
                  blurRadius: 15),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                  iconSize: 30,
                  alignment: Alignment.center,
                  icon: const Icon(Icons.arrow_back_ios ),
                  
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),
                      SizedBox(
                        width: 10,
                      ),
                      Text  (
                        'Home',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  iconSize: 30,
                  alignment: Alignment.center,
                  icon: const Icon(Icons.search,),
                  
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),
              ],
            ),
            // SizedBox(height: 5,),
            // Text("What would you like to read today?")
          ]),
        ),
      ),
    );
  }
}
