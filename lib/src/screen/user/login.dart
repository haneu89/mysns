import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysns/src/controller/user_controller.dart';
import 'package:mysns/src/screen/home.dart';
import 'package:mysns/src/screen/user/register.dart';

final userController = Get.put(UserController());

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void submit() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;

      String? message = await userController.login(email, password);
      if (message == null) {
        Get.off(() => const Home());
      } else {
        Get.snackbar("로그인 에러", message, snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '로그인',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  '반갑습니다 현장실습 프로젝트 교과 예제 프로젝트 SNS 서비스 입니다.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 80),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: '아이디(email)'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value == null || value!.trim().isEmpty) {
                      return "아이디를 입력해야 합니다.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: '비밀번호'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value!.trim().isEmpty) {
                      return "비밀번호를 입력해야 합니다.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.off(() => const Register());
                      },
                      child: const Text('아이디가 없으신가요?'),
                    ),
                    const SizedBox(width: 50),
                    ElevatedButton(onPressed: submit, child: const Text('로그인')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
