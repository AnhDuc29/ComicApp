import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homepage/models/comic.dart';
import 'package:homepage/models/nav_bar.dart';
import 'package:homepage/pages/searchpage.dart';
import 'package:homepage/pages/uiPage.dart';
import 'package:homepage/util/comic_ui_colors.dart';
import 'package:homepage/widgets/sliver_header.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    Favorites(),
    uiTruyen(),
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

class Favorites extends StatelessWidget {
  const Favorites({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        HeaderFavorites(),
        RecentsHeaderFavorites(),
        Recents(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: kBottomNavigationBarHeight * 1.4,
          ),
        )
      ],
    );
  }
}

class RecentsHeaderFavorites extends StatelessWidget {
  const RecentsHeaderFavorites({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                ),
                //Icon(Icons.all_inbox),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderFavorites extends StatelessWidget {
  const HeaderFavorites({
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
                      Icon(
                        Icons.format_align_left,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Favorites',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ],
                  ),
                ),
                //Icon(Icons.search, color: Colors.black, size: 30,),
                IconButton(
                  iconSize: 30,
                  alignment: Alignment.center,
                  icon: const Icon(Icons.search,),
                  
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchPage()),
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

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Header(),
        Banner(),
        Trends(),
        RecentsHeader(),
        Recents(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: kBottomNavigationBarHeight * 1.4,
          ),
        )
      ],
    );
  }
}

class Recents extends StatelessWidget {
  const Recents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2 + 5;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (_, index) {
            final comic = recentsData[index];
            return Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          comic.poster,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text('  ${comic.name}',
                              style: TextStyle(fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Chapter: ${comic.chapter}',
                          style: Theme.of(context).textTheme.button?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w100,
                                fontSize: 12,
                              ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '# ${comic.number}',
                          style: Theme.of(context).textTheme.button?.copyWith(
                                color: ComicUIColors.cyan,
                                fontWeight: FontWeight.w100,
                                fontSize: 14,
                              ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          childCount: 10,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 8,
          childAspectRatio: (itemWidth / itemHeight),
        ),
      ),
    );
  }
}

class RecentsHeader extends StatelessWidget {
  const RecentsHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                ),
                Icon(Icons.all_inbox),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'All Manga',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 16 / 16,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: LayoutBuilder(
                      builder: (_, constraints) {
                        return ListView.builder(
                            itemCount: bannersData.length,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(top: 0),
                            itemBuilder: (_, index) {
                              final screenWidth =
                                  MediaQuery.of(context).size.width;
                              final comic = bannersData[index];
                              return Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: Image.asset(
                                  comic.poster,
                                  fit: BoxFit.cover,
                                  width: screenWidth,
                                ),
                              );
                            });
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(0.1)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                    )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(color: Colors.transparent),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Manga',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration:
                              const BoxDecoration(color: Colors.transparent),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: SizedBox(
                                height: 100,
                                child: LayoutBuilder(builder: (_, constraints) {
                                  return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: bannersData.length,
                                    itemBuilder: (_, index) {
                                      final comic = bannersData[index];
                                      final screenWidth =
                                          MediaQuery.of(context).size.width;
                                      return Align(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 110),
                                          child: Text(
                                            comic.name.toUpperCase(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Noto Sans',
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }),
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(color: Colors.transparent),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Trends extends StatelessWidget {
  const Trends({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 15),
        child: AspectRatio(
          aspectRatio: 16 / 10,
          child: Column(
            children: [
              HeaderTrends(),
              //SizedBox(height: 100,),
              ListTrends(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListTrends extends StatelessWidget {
  const ListTrends({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: LayoutBuilder(builder: (_, constraints) {
      return ListView.builder(
        itemCount: trendsData.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(top: 10, left: 0),
        itemBuilder: (_, index) {
          final comic = trendsData[index];
          return Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: GestureDetector(
              onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => uiTruyen()),
                    ),
              child: Container(
                color: Colors.white,
                child: SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth * .3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            comic.poster,
                            fit: BoxFit.cover,
                            height: constraints.minHeight * .9,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text('  ${comic.name}',
                                style: TextStyle(fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Chapter: ${comic.chapter}',
                            style: Theme.of(context).textTheme.button?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 12,
                                ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '# ${comic.number}',
                            style: Theme.of(context).textTheme.button?.copyWith(
                                  color: ComicUIColors.cyan,
                                  fontWeight: FontWeight.w100,
                                  fontSize: 14,
                                ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }));
  }
}

class HeaderTrends extends StatelessWidget {
  const HeaderTrends({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        children: [
          Icon(
            Icons.legend_toggle,
            color: Colors.black,
            size: 30,
          ),
          SizedBox(width: 10),
          Expanded(
              child: Text(
            'Trending',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          )),
          Text(
            'View all',
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.w100),
          ),
        ],
      ),
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
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.format_align_left,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Home',
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.search, color: Colors.black, size: 30)
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
