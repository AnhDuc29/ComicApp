import 'package:flutter/material.dart';

import '../models/comic.dart';
import '../util/comic_ui_colors.dart';

class ui2page extends StatefulWidget {
  const ui2page({Key? key}) : super(key: key);

  @override
  State<ui2page> createState() => _ui2pageState();
}

class _ui2pageState extends State<ui2page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              //color: RenderErrorBox.backgroundColor,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _CustomIcon(
                      icon: Icons.star,
                      text: '89%',
                    ),
                    _CustomIcon(
                      icon: Icons.tv,
                      text: 'Phim',
                    ),
                    _CustomIcon(
                      icon: Icons.wc,
                      text: '18+',
                    ),
                    _CustomIcon(
                      icon: Icons.av_timer_rounded,
                      text: 'Chap 123',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 10),
                  child: Text(
                    'Truyen lien quan',
                    style: TextStyle(fontSize: 23),
                  ),
                ),
                More(),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Chapter',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}

class More extends StatelessWidget {
  const More({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          Expanded(child: LayoutBuilder(builder: (_, constraints) {
        return ListView.builder(
          itemCount: trendsData.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(top: 10, left: 0),
          itemBuilder: (_, index) {
            final comic = trendsData[index];
            return Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
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
                                style: TextStyle(
                                    fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Chapter: ${comic.chapter}',
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(
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
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(
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
            );
          },
        );
      })),
    );
  }
}

class _CustomIcon extends StatelessWidget {
  const _CustomIcon({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 45,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.grey),
        )
      ],
    );
  }
}
