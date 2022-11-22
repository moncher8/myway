import 'package:get/get.dart';

import '../../../data/repositories/init_repository.dart';
import '../controllers/init_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitController>(
      () => InitController(initRepository: InitRepository()),
    );
  }
}
