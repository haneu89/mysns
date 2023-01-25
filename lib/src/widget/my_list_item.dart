import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysns/src/model/feed_model.dart';
import 'package:mysns/src/screen/feed/feed_show.dart';
import 'package:mysns/src/shared/global.dart';
import 'package:mysns/src/widget/my_profile.dart';

class MyListItem extends StatelessWidget {
  final FeedModel feed;
  const MyListItem(this.feed, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => FeedShow(feed));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const MyProfile(),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${feed.name}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10),
                    Text("${feed.createdAt}",
                        style: const TextStyle(color: Colors.grey))
                  ],
                ),
                const SizedBox(height: 5),
                Text('${feed.content}'),
                const SizedBox(height: 20),
                imageView(),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget imageView() {
    if (feed.imageId == null) return const SizedBox();
    return Image.network(
      "${Global.API_ROOT}/file/${feed.imageId}",
      height: 100,
    );
  }
}
