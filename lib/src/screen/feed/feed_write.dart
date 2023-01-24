import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mysns/src/controller/feed_controller.dart';
import 'package:mysns/src/widget/image_box.dart';

import '../../shared/global.dart';

class FeedWrite extends StatefulWidget {
  const FeedWrite({super.key});

  @override
  State<FeedWrite> createState() => _FeedWriteState();
}

class _FeedWriteState extends State<FeedWrite> {
  final _textController = TextEditingController();
  final snackBar = const SnackBar(content: Text("글을 작성 해 주세요"));
  final picker = ImagePicker();
  final feedController = Get.put(FeedController());
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
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: _upload,
                    child: ImageBox(child: const Icon(Icons.image)),
                  ),
                  const SizedBox(width: 20),
                  previewImage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget previewImage() {
    if (tmpImg == null) {
      return const SizedBox();
    }
    return ImageBox(
      child: Image.network(
        "${Global.API_ROOT}/file/$tmpImg",
        fit: BoxFit.cover,
      ),
    );
  }

  Future<void> _upload() async {
    final file = await picker.pickImage(source: ImageSource.gallery);
    int? result = await feedController.imageUpload(file!.path, file.name);
    if (result != null) {
      setState(() {
        tmpImg = result;
      });
    }
  }
}
