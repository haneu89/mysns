import 'package:flutter/material.dart';
import 'package:mysns/src/screen/feed/feed_show.dart';
import 'package:mysns/src/widget/my_profile.dart';

class MyListItem extends StatelessWidget {
  const MyListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FeedShow()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          MyProfile(),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "홍길동",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Text("2022-01-19", style: TextStyle(color: Colors.grey))
                  ],
                ),
                const SizedBox(height: 5),
                const Text(
                    '나랏말싸미 듕귁에 달아 문자와로 서르 사맛디 아니할쎄 이런 젼차로 어린 백셩이 니르고져 홀 배 이셔도 마참내 제 뜨들 시러펴디 몯 할 노미 하니라 내 이랄 위하야 어엿비 너겨 새로 스믈 여듧 짜랄 맹가노니 사람마다 해여 수비 니겨 날로 쑤메 뼌한킈 하고져 할따라미니라'),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
