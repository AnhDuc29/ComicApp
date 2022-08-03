
import 'package:flutter/material.dart';
import 'package:homepage/models/comic.dart';


import 'package:homepage/widgets/sliver_header.dart';

import '../util/comic_ui_colors.dart';
import 'list.dart';

class uiTruyen extends StatefulWidget {
  const uiTruyen({Key? key}) : super(key: key);

  @override
  State<uiTruyen> createState() => _uiTruyenState();
}

class _uiTruyenState extends State<uiTruyen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
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
                children:  [
                  uiHome(),
                  AspectRatio(
                    aspectRatio: 16 / 10,
                     child: Container(
                      padding: const EdgeInsets.only(top: 400),
                       child: Column(
                        
                         children: [
                           ListTrends(),
                         ],
                       ),
                     ),
                   ),
                   //ui2page(),
                   listChap(),
                   
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class uiHome extends StatelessWidget {
  const uiHome({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // background image and bottom contents
          Column(
            children: <Widget>[
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/banners/Jujutsu_Kaisen.jpg')),
                ),
              ),
            ],
          ),
          // Profile image
          Positioned(
            left: 15,
            top: 150.0, // (background container size) - (circle height / 2)
            child: Container(
              height: 300,
              width: 150.0,
              child: Column(
                children: [
                  ClipRect(
                    child: Image.asset(
                      'assets/images/chu-thuat-hoi-chien.jpg',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
          ),
          const Positioned(
              left: 190,
              right: 30,
              top: 210,
              child: Text(
                'Yuuji Itadori là một thiên tài có tốc độ và sức mạnh, nhưng cậu ấy muốn dành thời gian của mình trong Câu lạc bộ Tâm Linh. ...',
                style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
              )),
          const Positioned(
              left: 190,
              right: 0,
              top: 150,
              child: Text(
                'Jujutsu Kaisen',
                style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
              )),
              Positioned(
                left: 20,
              right: 0,
              top: 390,
                
                  child:
                    Row(
                      children: [
                        Icon(Icons.book),
                        SizedBox(width: 10,),
                        Text('Chapter',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                    
              
                
              ),
             
        ],
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
