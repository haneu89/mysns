import 'package:flutter/material.dart';
import 'package:mysns/src/widget/my_profile.dart';

class FeedShow extends StatelessWidget {
  const FeedShow({super.key});

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
                  '홍길동',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
                "나랏말싸미 듕귁에 달아 문자와로 서르 사맛디 아니할쎄 이런 젼차로 어린 백셩이 니르고져 홀 배 이셔도 마참내 제 뜨들 시러펴디 몯 할 노미 하니라 내 이랄 위하야 어엿비 너겨 새로 스믈 여듧 짜랄 맹가노니 사람마다 해여 수비 니겨 날로 쑤메 뼌한킈 하고져 할따라미니라"),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: SizedBox()),
                Text(
                  '2023-01-01',
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
