import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mysns/src/screen/user/login.dart';

import 'screen/home.dart';

class MyApp extends StatelessWidget {
  String? token;
  MyApp(this.token, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: (token == null) ? const Login() : const Home(),
    );
  }
}
