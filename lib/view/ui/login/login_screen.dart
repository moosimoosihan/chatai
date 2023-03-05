import 'package:flutter/material.dart';

// 로그인 화면

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
<<<<<<< HEAD
        body: Center(
          child: MaterialButton(
            color: Colors.yellow,
            onPressed: () async {
              kakaoLogin(context);
            },
            child: const Text('Kakao Login'),
          ),
        ),
=======
        body: Center(child: GetBuilder<LoginController>(
          builder: (_) {
            return MaterialButton(
              color: Colors.yellow,
              onPressed: () async {
                Get.find<LoginController>().kakaoLogin(context);
              },
              child: const Text('Kakao Login'),
            );
          },
        )),
>>>>>>> dc0fe8b (폴더 구조 변경)
      ),
    );
  }
}
