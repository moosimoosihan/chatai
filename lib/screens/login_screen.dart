import 'package:flutter/material.dart';
import '../services/login_service.dart';

// 로그인 화면

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.yellow,
          onPressed: () async {
            KakaoLogin(context);
          },
          child: const Text('Kakao Login'),
        ),
      ),
    );
  }
}
