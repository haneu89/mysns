import 'package:flutter/material.dart';
import 'package:mysns/src/model/feed_model.dart';
import 'package:mysns/src/widget/my_profile.dart';

class FeedShow extends StatelessWidget {
  final FeedModel feed;
  const FeedShow(this.feed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('피드'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                MyProfile(),
                SizedBox(width: 20),
                Text(
                  '${feed.name}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text("${feed.content}"),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: SizedBox()),
                Text(
                  '${feed.createdAt}',
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: SizedBox()),
                ElevatedButton(onPressed: null, child: Text('수정')),
                SizedBox(width: 20),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("피드 삭제"),
                            content: Text('정말 삭제하시겠습니까'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('삭제')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
