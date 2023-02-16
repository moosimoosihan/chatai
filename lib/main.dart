import 'dart:developer';
import 'package:chatai/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

void main() async {
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: '0b1acaac136372b78c81a18e037a956a',
    javaScriptAppKey: '5bd2118a462bac58f859d9ceb2c1970e',
  );

  // 카카오 로그인 해시 키 받는 함수
  hasykey();

  // 파이어베이스 초기화
  //Firebase.initializeApp();

  FlutterNativeSplash.remove(); // 초기화가 끝나는 시점에 삽입
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ai chat',
      theme: ThemeData(primaryColor: Colors.white),
      home: const LoginScreen(),
    );
  }
}

void hasykey() async {
  var hasykey = await KakaoSdk.origin;
  log(hasykey);
}
