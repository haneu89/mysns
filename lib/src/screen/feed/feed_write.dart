import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mysns/src/repository/feed_repo.dart';

class FeedWrite extends StatefulWidget {
  const FeedWrite({super.key});

  @override
  State<FeedWrite> createState() => _FeedWriteState();
}

class _FeedWriteState extends State<FeedWrite> {
  final _textController = TextEditingController();
  final snackBar = const SnackBar(content: Text("글을 작성 해 주세요"));
  final picker = ImagePicker();
  final feedRepo = FeedRepo();
  int? tmpImg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('피드 작성'),
        actions: [
          IconButton(
              onPressed: () {
                String text = _textController.text;

                if (text == '') {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                keyboardType: TextInputType.multiline,
                expands: true,
                minLines: null,
                maxLines: null,
                decoration:
                    const InputDecoration(contentPadding: EdgeInsets.all(20)),
              ),
            ),
            (tmpImg == null) ? uploadButton() : showImage(),
          ],
        ),
      ),
    );
  }

  showImage() {
    return Image.network('https://sns.jinhyung.kim/file/$tmpImg');
  }

  uploadButton() {
    return IconButton(
      icon: const Icon(Icons.image),
      onPressed: () async {
        final file = await picker.pickImage(source: ImageSource.gallery);
        String result = await feedRepo.upload(file!.path, file.name);
        Map json = jsonDecode(result);

        setState(() {
          tmpImg = json['id'];
        });
      },
    );
  }
}
