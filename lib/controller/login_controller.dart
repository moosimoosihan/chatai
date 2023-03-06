import 'package:chatai/repository/example_repository.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final ExampleRepository repository;
  LoginController({required this.repository});

  kakaoLogin(context) {
    repository.kakaoLogin(context);
  }

  kakaoLogout(context) {
    repository.kakaoLogout(context).then(() {});
  }
}
