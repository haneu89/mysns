import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysns/src/controller/feed_controller.dart';
import 'package:mysns/src/screen/feed/feed_write.dart';
import 'package:mysns/src/screen/user/register.dart';

import '../widget/my_list_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final feedController = Get.put(FeedController());

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    bool result = await feedController.feedIndex();
    if (!result) {
      Get.off(const Register());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const FeedWrite());
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
