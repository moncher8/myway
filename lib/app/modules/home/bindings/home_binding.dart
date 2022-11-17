import 'package:flutter_myway/app/data/providers/fb_user_provider.dart';
import 'package:flutter_myway/app/data/repositories/home_repository.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(homeRepository: HomeRepository(
        fbUserProvider: FbUserProvider()
      )),
    );
  }
}
