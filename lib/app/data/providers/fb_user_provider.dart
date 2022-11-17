import 'package:flutter_myway/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/fb_user_model.dart';

class FbUserProvider extends GetConnect {

  final GetStorage box = GetStorage();

  @override
  void onInit() {
  }

  Future<FbUser?> getFbUser(FbUser fbUser) async {
    Map<String,dynamic> userBox = box.read(Constants.user)??{};
    return userBox[fbUser.id]==null?null:FbUser.fromJson(userBox[fbUser.id]);
  }

  Future<FbUser> postFbUser(FbUser fbUser) async {
    Map<String,dynamic> userBox = box.read(Constants.user)??{};
    userBox[fbUser.id!] = fbUser.toJson();
    box.write(Constants.user, userBox);
    return fbUser;
  }
}
