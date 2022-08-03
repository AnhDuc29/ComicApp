import 'package:flutter/material.dart';

class listChap extends StatefulWidget {
  const listChap({Key? key}) : super(key: key);

  @override
  State<listChap> createState() => _listChapState();
}

class _listChapState extends State<listChap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 470,left: 15),
      child: ListView(
        children: ListTile.divideTiles(
          context: context,
          
          tiles: [
            
            ListTile(
              title: Text('Chap 1'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              title: Text('Chap 2'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              title: Text('Chap 3'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              title: Text('Chap 4'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              title: Text('Chap 5'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              title: Text('Chap 6'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
          ],
        ).toList(),
      ),
    );

  }
}

