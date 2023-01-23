import 'dart:developer';

import 'package:get/get.dart';
import 'package:mysns/src/controller/user_controller.dart';

import '../shared/global.dart';

class FeedRepository extends GetConnect {
  final userController = Get.put(UserController());

  @override
  void onInit() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = Global.API_ROOT;
    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
    super.onInit();
  }

  Future<List?> feedIndex() async {
    Response response = await get(
      "/api/feed",
      headers: {'token': await userController.getToken()},
    );
    if (response.statusCode == 401) {
      return null;
    }
    return response.body;
  }
}
