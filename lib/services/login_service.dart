import 'dart:developer';
import 'package:chatai/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

// 로그인 연동
void kakaoLogin(context) async {
  if (await AuthApi.instance.hasToken()) {
    try {
      AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
      loginOn(context, tokenInfo);
    } catch (error) {
      if (error is KakaoException && error.isInvalidTokenError()) {
        log('토큰 만료 $error');
      } else {
        log('토큰 정보 조회 실패 $error');
      }
      // 카카오톡 실행 가능 여부 확인
      // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
      if (await isKakaoTalkInstalled()) {
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
          loginOn(context, token);
        } catch (error) {
          log('카카오톡으로 로그인 실패 $error');
          // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
          // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
          if (error is PlatformException && error.code == 'CANCELED') {
            return;
          }
          // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
          try {
            OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
            loginOn(context, token);
          } catch (error) {
            log('카카오계정으로 로그인 실패 $error');
          }
        }
      } else {
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          loginOn(context, token);
        } catch (error) {
          log('카카오계정으로 로그인 실패 $error');
        }
      }
    }
  }
}

void loginOn(context, token) {
  log('카카오톡으로 로그인 성공 ${token.accessToken}');
  loginTokenInfo();
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: ((context) => const MainScreen()),
    ),
  );
}

void loginTokenInfo() async {
  try {
    AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
    log('토큰 정보 보기 성공'
        '\n회원정보: ${tokenInfo.id}'
        '\n만료시간: ${tokenInfo.expiresIn} 초');
    try {
      User user = await UserApi.instance.me();
      log(
        '사용자 정보 요청 성공'
        '\n회원번호: ${user.id}'
        '\n닉네임: ${user.kakaoAccount?.profile?.nickname}',
      );
    } catch (error) {
      log('사용자 정보 요청 실패 $error');
    }
  } catch (error) {
    log('토큰 정보 보기 실패 $error');
  }
}
