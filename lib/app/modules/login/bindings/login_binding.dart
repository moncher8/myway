import 'package:flutter_myway/app/data/providers/fb_user_provider.dart';
import 'package:flutter_myway/app/data/repositories/login_repository.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(loginRepository: LoginRepository(fbUserProvider: FbUserProvider())),
    );
  }
}
