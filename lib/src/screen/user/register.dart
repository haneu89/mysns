import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysns/src/repository/user_repository.dart';
import 'package:mysns/src/screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final userRepo = Get.put(UserRepository());
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void submit() async {
    final prefs = await SharedPreferences.getInstance();

    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      String? token = await userRepo.register(name, email, password);
      if (token != null) {
        await prefs.setString('token', token);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
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
                  '회원가입',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  '반갑습니다 현장실습 프로젝트 교과 예제 프로젝트 SNS 서비스 입니다.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: '이름(닉네임)'),
                  validator: (String? value) {
                    if (value == null || value!.trim().isEmpty) {
                      return "이름을 입력해야 합니다.";
                    }
                    return null;
                  },
                ),
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
                ElevatedButton(onPressed: submit, child: const Text('회원가입'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
