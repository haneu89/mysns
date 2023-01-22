import 'dart:io';

import 'package:http/http.dart' as http;

// final base = 'http://192.168.55.113:3000';
final base = 'https://sns.jinhyung.kim';

class FeedRepo {
  upload(String path, String filename) async {
    var request = http.MultipartRequest("POST", Uri.parse("$base/file/upload"));
    request.files.add(http.MultipartFile(
        'file', File(path).readAsBytes().asStream(), File(path).lengthSync(),
        filename: filename));
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      print('업로드 오류');
      return null;
    }
  }
}
