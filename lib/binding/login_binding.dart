import 'package:chatai/controller/login_controller.dart';
import 'package:chatai/provider/login_api.dart';
import 'package:chatai/repository/example_repository.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() {
      return LoginController(
          repository: ExampleRepository(apiClient: LoginApi()));
    });
  }
}


// //
// class HomeBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<HomeController>(() {
//       return HomeController(
//           repository:
//               MyRepository(apiClient: MyApiClient(httpClient: http.Client())));
//     });
//   }
// }