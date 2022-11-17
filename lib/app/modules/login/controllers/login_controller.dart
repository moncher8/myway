import 'package:flutter/material.dart';
import 'package:flutter_myway/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/models/fb_user_model.dart';
import '../../../data/repositories/login_repository.dart';
import '../../../data/services/fb_user_service.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final LoginRepository loginRepository;

  late TextEditingController emailAddressController;
  late TextEditingController passwordTextController;
  late bool passwordVisibility;

  LoginController({required this.loginRepository});

  @override
  void onInit() {
    super.onInit();
    emailAddressController = TextEditingController();
    passwordTextController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void changePasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    update();
  }

  void signIn() async {
    if (emailAddressController.value.text != '' &&
        passwordTextController.value.text != '') {
      FbUser fbUser = FbUser(
          id: emailAddressController.value.text,
          password: passwordTextController.value.text);

      FbUser? retfbUser = await loginRepository.getUser(fbUser);
      if (retfbUser == null) {
        Get.dialog(
          AlertDialog(
            title: Text('존재하지 않는 유저입니다'),
          ),
        );
      } else if (retfbUser!.password != passwordTextController.value.text) {
        Get.dialog(
          AlertDialog(
            title: Text('비밀번호가 일치하지 않습니다'),
          ),
        );
      } else {
        Get.find<FbUserService>().fbUser = retfbUser!;
        emailAddressController.clear();
        passwordTextController.clear();
        Get.toNamed(Routes.HOME);
      }
    }
  }

  void signUp() async {
    if (emailAddressController.value.text != '' &&
        passwordTextController.value.text != '') {
      FbUser fbUser = FbUser(
          id: emailAddressController.value.text,
          password: passwordTextController.value.text,
          name: 'New User',
          department: "devKor",
          position: "student");
      FbUser? retfbUser = await loginRepository.getUser(fbUser);
      if (retfbUser != null) {
        Get.dialog(
          AlertDialog(
            title: Text('이미 존재하지 않는 유저입니다'),
          ),
        );
      } else {
        FbUser retfbUser = await loginRepository.postUser(fbUser!);
        Get
            .find<FbUserService>()
            .fbUser = retfbUser;
        emailAddressController.clear();
        passwordTextController.clear();
        Get.toNamed(Routes.HOME);
      }
    }
  }
}
