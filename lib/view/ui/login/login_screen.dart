import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/login_controller.dart';

// 로그인 화면

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: MaterialButton(
            color: Colors.yellow,
            onPressed: () async {
              kakaoLogin(context);
            },
            child: const Text('Kakao Login'),
          ),
        ),
      ),
    );
  }
}
