import 'package:flutter/material.dart';
import 'package:mysns/src/screen/user/register.dart';

import 'screen/home.dart';

class MyApp extends StatelessWidget {
  String? token;
  MyApp(this.token, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (token == null) ? Register() : Home(),
    );
  }
}
