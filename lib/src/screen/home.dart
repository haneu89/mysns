import 'package:flutter/material.dart';
import 'package:mysns/src/screen/feed/feed_write.dart';

import '../widget/my_list_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FeedWrite()),
          );
        },
        child: Icon(Icons.create),
      ),
      appBar: AppBar(
        title: const Text('MySNS'),
      ),
      body: ListView(children: const [
        MyListItem(),
        MyListItem(),
        MyListItem(),
        MyListItem(),
        MyListItem(),
      ]),
    );
  }
}
