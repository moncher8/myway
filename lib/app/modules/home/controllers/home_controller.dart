import 'package:flutter/cupertino.dart';
import 'package:flutter_myway/app/data/repositories/home_repository.dart';
import 'package:get/get.dart';

import '../../../data/models/fb_user_model.dart';
import '../../../data/services/fb_user_service.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final HomeRepository homeRepository;

  FbUser localUser = FbUser();
  TextEditingController nameController = TextEditingController();
  TextEditingController departController = TextEditingController();
  TextEditingController posiController = TextEditingController();

  HomeController({required this.homeRepository});

  @override
  void onInit() {
    if (!Get
        .find<FbUserService>()
        .initialized) {
      Get.toNamed(Routes.LOGIN);
    }
    localUser = Get
        .find<FbUserService>()
        .fbUser;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void editName() {
    if (nameController.value.text != '') {
      localUser.name = nameController.value.text;
      Get
          .find<FbUserService>()
          .fbUser = localUser;
      homeRepository.postUser(localUser);
      nameController.clear();
      update();
    }
  }

  void editDepart() {
    if (departController.value.text != '') {
      localUser.department = departController.value.text;
      Get
          .find<FbUserService>()
          .fbUser = localUser;
      homeRepository.postUser(localUser);
      departController.clear();
      update();
    }
  }

  void editPosi() {
    if (posiController.value.text != '') {
      localUser.position = posiController.value.text;
      Get
          .find<FbUserService>()
          .fbUser = localUser;
      homeRepository.postUser(localUser);
      posiController.clear();
      update();
    }
  }
}
