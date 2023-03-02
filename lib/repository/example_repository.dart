import 'package:chatai/provider/login_api.dart';

class ExampleRepository {
  final LoginApi apiClient;

  ExampleRepository({required this.apiClient});

  kakaoLogin(context) {
    return apiClient.kakaoLogin(context);
  }

  kakaoLogout(context) {
    return apiClient.kakaoLogOut(context);
  }
}
