import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:mysns/src/model/feed_model.dart';
import 'package:mysns/src/repository/feed_repository.dart';

class FeedController extends GetxController {
  final feedRepo = Get.put(FeedRepository());
  List feedList = [];

  Future<bool> feedIndex() async {
    List? body = await feedRepo.feedIndex();
    if (body == null) {
      return false;
    }
    List feed = body.map(((e) => FeedModel.parse(e))).toList();
    feedList = feed;
    update();
    return true;
  }

  feedShow() {}
  feedDelete() {}
  feedEdit() {}
  imageUpload() {}
}
